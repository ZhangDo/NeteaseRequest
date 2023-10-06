import Foundation
import Alamofire
import SwiftyJSON

public var NR_BASEURL = ""





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
        static let cellPhoneLogin = "\(NR_BASEURL)/login/cellphone"
        static let accountInfo = "\(NR_BASEURL)/user/account"
        static let userSubcount = "\(NR_BASEURL)/user/subcount"
        static let userLevelInfo = "\(NR_BASEURL)/user/level"
        static let userFollows = "\(NR_BASEURL)/user/follows"
        static let userFolloweds = "\(NR_BASEURL)/user/followeds"
        static let artistList = "\(NR_BASEURL)/artist/list"
        static let topSong = "\(NR_BASEURL)/artist/top/song"
        static let allSong = "\(NR_BASEURL)/artist/songs"
        static let artistSublist = "\(NR_BASEURL)/artist/sublist"
        static let audioUrl = "\(NR_BASEURL)/song/url/v1"
        
        static let catList = "\(NR_BASEURL)/playlist/catlist"
        static let hotPlayList = "\(NR_BASEURL)/playlist/hot"
        static let topPlayList = "\(NR_BASEURL)/top/playlist"
        static let highqualityPlayList = "\(NR_BASEURL)/top/playlist/highquality"
        
        static let playlistDetail = "\(NR_BASEURL)/playlist/detail"
        
        static let playListTrackAll = "\(NR_BASEURL)/playlist/track/all"
        
        static let checkAudio = "\(NR_BASEURL)/check/music"
        
        static let lyric = "\(NR_BASEURL)/lyric"
        
        static let recommendPlayList = "\(NR_BASEURL)/recommend/resource"
        static let recommendSongs = "\(NR_BASEURL)/recommend/songs"
        static let personalfm = "\(NR_BASEURL)/personal_fm"
//        /推荐歌单
        static let personalizedPlayList = "\(NR_BASEURL)/personalized"
        ///banner
        static let banner = "\(NR_BASEURL)/banner"
        ///获取专辑内容
        static let albumContent = "\(NR_BASEURL)/album"
        
        static let newsong = "\(NR_BASEURL)/personalized/newsong"
        
        
        //电台
        static let djCatelist = "\(NR_BASEURL)/dj/catelist"
        
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
        session.sessionConfiguration.timeoutIntervalForResource = 90
        session.sessionConfiguration.timeoutIntervalForRequest = 90
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


