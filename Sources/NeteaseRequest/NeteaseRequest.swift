import Foundation
import Alamofire
import SwiftyJSON


struct NewSongs: Codable {
    let name: String
    let picUrl: String
    let type: Int
    
}


enum RequestError: Error {
    case networkFail
    case statusFail(code: Int, message: String)
    case decodeFail(message: String)
}

enum ValidationError: Error {
    case argumentInvalid(message: String)
}

enum NoCookieSession {
    static let session = Session(configuration: URLSessionConfiguration.ephemeral)
}

enum NeteaseRequest {
    
    enum EndPoint {
        static let cellPhoneLogin = "https://wknetesae.vercel.app/login/cellphone"
        static let accountInfo = "https://wknetesae.vercel.app/user/account"
        static let userSubcount = "https://wknetesae.vercel.app/user/subcount"
        static let userLevelInfo = "https://wknetesae.vercel.app/user/level"
        static let userFollows = "https://wknetesae.vercel.app/user/follows"
        static let userFolloweds = "https://wknetesae.vercel.app/user/followeds"
        static let artistList = "https://wknetesae.vercel.app/artist/list"
        static let topSong = "https://wknetesae.vercel.app/artist/top/song"
        static let newsong = "https://wknetesae.vercel.app/personalized/newsong?limit=10"
    }
    
    
    
    
    static func requestData(method: HTTPMethod = .get,
                                   url: URLConvertible,
                                   parameters: Parameters = [:],
                                   headers: [String: String]? = nil,
                                   noCookie: Bool = false,
                                   complete: ((Result<Data, RequestError>) -> Void)? = nil)
    {
        
        var session = Session.default
        if noCookie {
            session = NoCookieSession.session
            session.sessionConfiguration.httpShouldSetCookies = false
        }
        session.sessionConfiguration.timeoutIntervalForResource = 30
        session.sessionConfiguration.timeoutIntervalForRequest = 30
        session.request(url,
                        method: method,
                        parameters: parameters,
                        encoding: URLEncoding.default,
                        headers: [:],
                        interceptor: nil)
            .responseData { response in
                switch response.result {
                case let .success(data):
                    complete?(.success(data))
                case let .failure(err):
                    print(err)
                    complete?(.failure(.networkFail))
                }
            }
        
        
    }
    
    static func requestJSON(method: HTTPMethod = .get,
                            url: URLConvertible,
                            parameters: Parameters = [:],
                            headers: [String: String]? = nil,
                            dataObj: String? = nil,
                            noCookie: Bool = false,
                            complete: ((Result<JSON, RequestError>) -> Void)? = nil)
    {
        requestData(method: method, url: url, parameters: parameters, headers: headers, noCookie: noCookie) { response in
            switch response {
            case let .success(data):
                let json = JSON(data)
                let errorCode = json["code"].intValue
                if errorCode != 200 {
                    let message = json["message"].stringValue
                    print(errorCode, message)
                    complete?(.failure(.statusFail(code: errorCode, message: message)))
                    return
                }
                if let tempDataObj = dataObj {
                    let dataj = json[tempDataObj]
                    print("\(url) response: \(json)")
                    complete?(.success(dataj))
                } else {
                    complete?(.success(json))
                }
            case let .failure(err):
                complete?(.failure(err))
            }
        }
    }
    
    static func request<T: Decodable>(method: HTTPMethod = .get,
                                      url: URLConvertible,
                                      parameters: Parameters = [:],
                                      headers: [String: String]? = nil,
                                      decoder: JSONDecoder? = nil,
                                      dataObj: String? = nil,
                                      noCookie: Bool = false,
                                      complete: ((Result<T, RequestError>) -> Void)?)
    {
        requestJSON(method: method, url: url, parameters: parameters, headers: headers, dataObj: dataObj, noCookie: noCookie) { response in
            switch response {
            case let .success(data):
                do {
                    let data = try data.rawData()
                    let object = try (decoder ?? JSONDecoder()).decode(T.self, from: data)
                    complete?(.success(object))
                } catch let err {
                    print("decode fail:", err)
                    complete?(.failure(.decodeFail(message: err.localizedDescription + String(describing: err))))
                }
            case let .failure(err):
                complete?(.failure(err))
            }
        }
    }
    
    static func requestJSON(method: HTTPMethod = .get,
                            url: URLConvertible,
                            parameters: Parameters = [:],
                            headers: [String: String]? = nil) async throws -> JSON
    {
        return try await withCheckedThrowingContinuation { configure in
            requestJSON(method: method, url: url, parameters: parameters, headers: headers) { resp in
                configure.resume(with: resp)
            }
        }
    }
    
    static func request<T: Decodable>(method: HTTPMethod = .get,
                                      url: URLConvertible,
                                      parameters: Parameters = [:],
                                      headers: [String: String]? = nil,
                                      decoder: JSONDecoder? = nil,
                                      noCookie: Bool = false,
                                      dataObj: String? = nil) async throws -> T
    {
        return try await withCheckedThrowingContinuation { configure in
            request(method: method, url: url, parameters: parameters, headers: headers, decoder: decoder, dataObj: dataObj, noCookie: noCookie) {
                (res: Result<T, RequestError>) in
                switch res {
                case let .success(content):
                    configure.resume(returning: content)
                case let .failure(err):
                    configure.resume(throwing: err)
                }
            }
        }
    }
}


