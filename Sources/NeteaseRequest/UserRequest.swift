import Foundation
import SwiftyJSON
import Alamofire

//MARK: 手机密码登录
///手机密码登录
/// - Parameter phone: 手机号
/// - Parameter password: 密码
/// - Returns: CellPhoneModel
public func cellPhoneLogin(phone: String, password: String) async throws -> CellPhoneModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.cellPhoneLogin, parameters: ["phone": phone, "password": password])
}
///游客登录
/// - Returns:NRAnonimousModel
public func anonimousLogin() async throws -> NRAnonimousModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.anonimousLogin)
}
/// 二维码 key 生成接口
/// - Returns: NRQRKeyModel
public func fetchQRKey() async throws -> NRQRKeyModel {
    let currentTimeStamp = Date().timeIntervalSince1970 * 1000
    print(currentTimeStamp)
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.qrKey, parameters: ["timestamp":currentTimeStamp], dataObj: "data")
}
/// 二维码生成
/// - Parameter key: 二维码 key
/// - Parameter qrimg:
public func fetchQRCode(key: String, qrimg: Bool = false) async throws -> NRQRCodeModel {
    let currentTimeStamp = Date().timeIntervalSince1970 * 1000
    print(currentTimeStamp)
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.qrCode, parameters: ["key": key, "qrimg": qrimg, "timestamp":currentTimeStamp], dataObj: "data")
}
/// 二维码检测扫码状态接口
/// - Parameter key: 二维码 key
public func checkQRCode(key: String) async throws -> NRQRCodeCheckModel {
    let currentTimeStamp = Date().timeIntervalSince1970 * 1000
    print(currentTimeStamp)
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.qrCheck, parameters: ["key": key,"timestamp":currentTimeStamp,"noCookie": "true"])
}

/// 手机号登录
///
public func loginWithPhone(phone: String, captcha: String) async throws -> NRQRCodeCheckModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.cellPhoneLogin, parameters: ["phone": phone,"captcha":captcha])
}
/// 获取验证码
public func fetchCaptcha(phone: String, ctcode: String = "86", complete: ((Result<JSON, RequestError>) -> Void)? = nil) {
    NeteaseRequest.requestJSON(url: NeteaseRequest.EndPoint.fetchCaptcha, parameters: ["phone": phone, "ctcode": ctcode], complete: complete)
}

//MARK: 获取账号信息
/// 获取账号信息
public func fetchAccountInfo(cookie: String) async throws -> NRProfileModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.accountInfo,
                                            parameters: ["cookie": cookie],
                                            dataObj: "profile")
}
///获取用户详情
/// - uid:
/// - cookie:
///  - Returns: NRProfileModel
public func fetchUserInfoDetail(uid: Int, cookie: String) async throws -> NRUserDetailModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userDetail, parameters: ["uid": uid, "cookie": cookie])
}
//MARK: 获取用户信息 , 歌单，收藏，mv, dj 数量
///获取用户信息 , 歌单，收藏，mv, dj 数量
public func fetchUserSubcount(cookie: String) async throws -> NRUserSubcountModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userSubcount, parameters: ["cookie": cookie])

}

//MARK: 获取用户等级信息
///获取用户等级信息
public func fetchUserLevelIno(cookie: String) async throws -> NRUserLevelInfoModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userLevelInfo, parameters: ["cookie": cookie],dataObj: "data")
}

//MARK: 获取用户关注列表
///获取用户关注列表
public func fetchUserFollows(parameters: Parameters) async throws -> [NRUserFollowsModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userFollows, parameters: parameters, dataObj: "follow")
}

//MARK: 获取用户粉丝列表
///获取用户粉丝列表
public func fetchUserFolloweds(parameters: Parameters) async throws -> [NRUserFollowsModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userFolloweds, parameters: parameters, dataObj: "followeds")
}


/// 获取收藏的歌手列表
/// - Parameters:
///  - cookie: cookie
/// - Returns: [NRSingerInfoModel]

public func fetchSublist(cookie: String) async throws -> [NRSingerInfoModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.artistSublist, parameters: ["cookie": cookie], dataObj: "data")
}
/// 获取歌手粉丝数量
///  - Parameters:
///   - id: 歌手 id
///  - Returns:
public func fetchArtistFansCount(id: Int) async throws -> NRArtistFansCountModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.artistFansCount, parameters: ["id": id], dataObj: "data")
}



