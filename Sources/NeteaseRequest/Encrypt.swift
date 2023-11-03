import Foundation
import CommonCrypto

let iv = Data([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08])
let presetKey = Data([0x30, 0x43, 0x6F, 0x4A, 0x55, 0x6D, 0x36, 0x51, 0x79, 0x77, 0x38, 0x57, 0x38, 0x6A, 0x75, 0x64])
let linuxapiKey = Data([0x72, 0x46, 0x67, 0x42, 0x26, 0x68, 0x23, 0x25, 0x32, 0x3F, 0x65, 0x44, 0x67, 0x3A, 0x51])
let base62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

let publicKey =
"""
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDgtQn2JZ34ZC28NWYpAUd98iZ37BUrX/aKzmFbt7clFSs6sXqHauqKWqdtLkF2KexO40H1YTX8z2lSgBBOAxLsvaklV8k4cBFK9snQXE9/DDaFt6Rr7iVZMldczhC0JNgTz+SHXT6CBHuX3e9SdB1Ua44oncaTWz7OBGLbCiK45wIDAQAB
-----END PUBLIC KEY-----
"""

let eapiKey = "e82ckenh8dichen8"

func aesEncrypt(buffer: Data, mode: String, key: Data, iv: Data) -> Data? {
    var encryptedData: Data?
    var numBytesEncrypted: Int = 0
    let bufferSize: Int = buffer.count + kCCBlockSizeAES128
    var bufferPointer = UnsafeMutableRawPointer.allocate(byteCount: bufferSize, alignment: 1)

    let cryptStatus = CCCrypt(CCOperation(kCCEncrypt), CCAlgorithm(kCCAlgorithmAES128), CCOptions(kCCOptionPKCS7Padding), key.bytes, key.count, iv.bytes, buffer.bytes, buffer.count, bufferPointer, bufferSize, &numBytesEncrypted)

    if cryptStatus == kCCSuccess {
        encryptedData = Data(bytes: bufferPointer, count: numBytesEncrypted)
    }

    bufferPointer.deallocate()

    return encryptedData
}

func rsaEncrypt(buffer: Data, key: String) -> Data? {
    let keyData = Data(base64Encoded: key)
    let keyRef = SecKeyCreateWithData(keyData! as CFData, [
        kSecAttrKeyType: kSecAttrKeyTypeRSA,
        kSecAttrKeyClass: kSecAttrKeyClassPublic
    ] as CFDictionary, nil)

    let blockSize = SecKeyGetBlockSize(keyRef!)
    var paddedData = Data(count: blockSize)

    let padding = SecPadding.PKCS1
    let paddedDataLength = blockSize - buffer.count
    paddedData.replaceSubrange(paddedDataLength..<blockSize, with: buffer)

    var encryptedData = Data(count: blockSize)
    var encryptedDataLength = blockSize

    let status = SecKeyEncrypt(keyRef!, padding, paddedData.bytes, paddedData.count, encryptedData.bytes, &encryptedDataLength)

    if status == errSecSuccess {
        encryptedData.count = encryptedDataLength
        return encryptedData
    } else {
        return nil
    }
}

func weapi(object: [String: Any]) -> [String: String]? {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: object)
        let text = String(data: jsonData, encoding: .utf8)!
        let secretKey = Data((0..<16).map { _ in base62.randomElement()!.asciiValue! })
        
        let encryptedData = aesEncrypt(buffer: Data(text.utf8), mode: "cbc", key: presetKey, iv: iv)
        let encryptedSecretKey = rsaEncrypt(buffer: secretKey.reversed(), key: publicKey)
        
        let params = encryptedData?.base64EncodedString()
        let encSecKey = encryptedSecretKey?.map { String(format: "%02hhx", $0) }.joined()
        
        return ["params": params!, "encSecKey": encSecKey!]
    } catch {
        return nil
    }
}

func linuxapi(object: [String: Any]) -> [String: String]? {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: object)
        let text = String(data: jsonData, encoding: .utf8)!
        
        let encryptedData = aesEncrypt(buffer: Data(text.utf8), mode: "ecb", key: linuxapiKey, iv: Data())
        let eparams = encryptedData?.map { String(format: "%02hhx", $0) }.joined().uppercased()
        
        return ["eparams": eparams!]
    } catch {
        return nil
    }
}

func eapi(url: String, object: Any) -> [String: String]? {
    let text: String
    if let objectData = try? JSONSerialization.data(withJSONObject: object) {
        text = String(data: objectData, encoding: .utf8)!
    } else if let objectString = object as? String {
        text = objectString
    } else {
        return nil
    }
    
    let message = "nobody\(url)use\(text)md5forencrypt"
    let digestData = Data(Array(message.utf8)).md5()
    let digest = digestData.map { String(format: "%02hhx", $0) }.joined()
    let data = "\(url)-36cd479b6b5-\(text)-36cd479b6b5-\(digest)"
    
    let encryptedData = aesEncrypt(buffer: Data(data.utf8), mode: "ecb", key: eapiKey, iv: Data())
    let params = encryptedData?.map { String(format: "%02hhx", $0) }.joined().uppercased()
    
    return ["params": params!]
}

func decrypt(cipherBuffer: Data) -> Data? {
    var decryptedData: Data?
    var numBytesDecrypted: Int = 0
    let bufferSize: Int = cipherBuffer.count + kCCBlockSizeAES128
    var bufferPointer = UnsafeMutableRawPointer.allocate(byteCount: bufferSize, alignment: 1)

    let cryptStatus = CCCrypt(CCOperation(kCCDecrypt), CCAlgorithm(kCCAlgorithmAES128), CCOptions(kCCOptionPKCS7Padding), eapiKey.bytes, eapiKey.count, nil, cipherBuffer.bytes, cipherBuffer.count, bufferPointer, bufferSize, &numBytesDecrypted)

    if cryptStatus == kCCSuccess {
        decryptedData = Data(bytes: bufferPointer, count: numBytesDecrypted)
    }

    bufferPointer.deallocate()

    return decryptedData
}

let object: [String: Any] = [:]
let weapiResult = weapi(object: object)
let linuxapiResult = linuxapi(object: object)
let eapiResult = eapi(url: "", object: object)

