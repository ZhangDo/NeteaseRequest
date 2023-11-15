import Foundation
import Alamofire
import SwiftyJSON

public var NR_BASEURL = ""





public enum RequestError: Error {
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
        ///手机登录
        static let cellPhoneLogin = "\(NR_BASEURL)/login/cellphone"
        ///二维码 key 生成接口
        static let qrKey = "\(NR_BASEURL)/login/qr/key"
        ///二维码生成接口
        static let qrCode = "\(NR_BASEURL)/login/qr/create"
        /// 二维码检测扫码状态接口
        static let qrCheck = "\(NR_BASEURL)/login/qr/check"
        ///获取账号信息
        static let accountInfo = "\(NR_BASEURL)/user/account"
        ///获取用户信息 , 歌单，收藏，mv, dj 数量
        static let userSubcount = "\(NR_BASEURL)/user/subcount"
        ///获取用户等级信息
        static let userLevelInfo = "\(NR_BASEURL)/user/level"
        ///获取用户关注列表
        static let userFollows = "\(NR_BASEURL)/user/follows"
        ///获取用户粉丝列表
        static let userFolloweds = "\(NR_BASEURL)/user/followeds"
        ///获取用户详情
        static let userDetail = "\(NR_BASEURL)/user/detail"
        ///获取歌手粉丝数量
        static let artistFansCount = "\(NR_BASEURL)/artist/follow/count"
        ///歌手分类列表
        static let artistList = "\(NR_BASEURL)/artist/list"
        ///歌手热门 50 首歌曲
        static let topSong = "\(NR_BASEURL)/artist/top/song"
        ///歌手全部歌曲
        static let allSong = "\(NR_BASEURL)/artist/songs"
        ///收藏的歌手列表
        static let artistSublist = "\(NR_BASEURL)/artist/sublist"
        ///获取音乐 url - 新版
        static let audioUrl = "\(NR_BASEURL)/song/url/v1"
        ///获取歌曲详情
        static let songDetail = "\(NR_BASEURL)/song/detail"
        ///获取歌手详情
        static let singerDetail = "\(NR_BASEURL)/artist/detail"
        ///获取歌手单曲
        static let singerSong = "\(NR_BASEURL)/artists"
        ///获取歌手专辑
        static let singerAlbum = "\(NR_BASEURL)/artist/album"
        ///获取歌手 mv
        static let singerMV = "\(NR_BASEURL)/artist/mv"
        ///获取 mv 数据
        static let mvDetail = "\(NR_BASEURL)/mv/detail"
        ///mv 地址
        static let mvUrl = "\(NR_BASEURL)/mv/url"
        ///全部 mv
        static let allMV = "\(NR_BASEURL)/mv/all"
        ///歌单分类
        static let catList = "\(NR_BASEURL)/playlist/catlist"
        ///热门歌单分类
        static let hotPlayList = "\(NR_BASEURL)/playlist/hot"
        ///歌单 ( 网友精选碟 )
        static let topPlayList = "\(NR_BASEURL)/top/playlist"
        ///获取精品歌单
        static let highqualityPlayList = "\(NR_BASEURL)/top/playlist/highquality"
        ///获取歌单详情
        static let playlistDetail = "\(NR_BASEURL)/playlist/detail"
        ///获取歌单所有歌曲
        static let playListTrackAll = "\(NR_BASEURL)/playlist/track/all"
        ///音乐是否可用
        static let checkAudio = "\(NR_BASEURL)/check/music"
        ///获取歌词
        static let lyric = "\(NR_BASEURL)/lyric"
        ///获取每日推荐歌单
        static let recommendPlayList = "\(NR_BASEURL)/recommend/resource"
        ///获取每日推荐歌曲
        static let recommendSongs = "\(NR_BASEURL)/recommend/songs"
        ///私人 FM
        static let personalfm = "\(NR_BASEURL)/personal_fm"
        ///推荐歌单
        static let personalizedPlayList = "\(NR_BASEURL)/personalized"
        ///banner
        static let banner = "\(NR_BASEURL)/banner"
        ///获取专辑内容
        static let albumContent = "\(NR_BASEURL)/album"
        ///推荐新音乐
        static let newsong = "\(NR_BASEURL)/personalized/newsong"
        ///电台
        static let djCatelist = "\(NR_BASEURL)/dj/catelist"
        ///电台 - 类别热门电台
        static let djHotRadio = "\(NR_BASEURL)/dj/radio/hot"
        /// 获取推荐电台
        static let djRecommend = "\(NR_BASEURL)/dj/recommend"
        ///获取推荐电台节目
        static let personalProgram = "\(NR_BASEURL)/personalized/djprogram"
        ///获取电台个性推荐
        static let djPersonalRecommend = "\(NR_BASEURL)/dj/personalize/recommend"
        ///获取电台节目列表
        static let djProgram = "\(NR_BASEURL)/dj/program"
        ///获取电台节目详情
        static let djPRogramDetail = "\(NR_BASEURL)/dj/program/detail"
        ///最近播放-播客
        static let recentDj = "\(NR_BASEURL)/record/recent/dj"
        ///最近播放-歌曲
        static let recentSong = "\(NR_BASEURL)/record/recent/song"
        ///最近播放-声音
        static let recentVoice = "\(NR_BASEURL)/record/recent/voice"
        ///最近播放-歌单
        static let recentPlaylist = "\(NR_BASEURL)/record/recent/playlist"
        ///最近播放-专辑
        static let recentAlbum = "\(NR_BASEURL)/record/recent/album"
        ///最近播放-视频
        static let recentVideo = "\(NR_BASEURL)/record/recent/video"
        ///获取用户歌单
        static let userPlaylist = "\(NR_BASEURL)/user/playlist"
        ///获取我收藏的专辑
        static let albumSublist = "\(NR_BASEURL)/album/sublist"
        ///获取我收藏的播客
        static let djSublist = "\(NR_BASEURL)/dj/sublist"
        ///搜索
        static let search = "\(NR_BASEURL)/search"
        ///收藏/取消收藏歌单
        static let subscribePlaylist = "\(NR_BASEURL)/playlist/subscribe"
        ///歌曲评论
        static let musicComment = "\(NR_BASEURL)/comment/music"
        ///楼层评论 comment/floor
        static let floorComment = "\(NR_BASEURL)/comment/floor"
        ///所有榜单toplist
        static let allToplist = "\(NR_BASEURL)/toplist"
        ///歌手榜
        static let singerToplist = "\(NR_BASEURL)/toplist/artist"
        ///获取相似歌手
        static let simiArtist = "\(NR_BASEURL)/simi/artist"
        ///喜欢音乐列表
        static let likelist = "\(NR_BASEURL)/likelist"
        ///歌手简要百科信息
        static let artistIntroduce = "\(NR_BASEURL)/ugc/artist/get"
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
                do {
                    if try url.asURL().absoluteString.contains("qr/check") {
                        if let tempDataObj = dataObj {
                            let dataj = json[tempDataObj]
                            print("\(url) response: \(json)")
                            complete?(.success(dataj))
                        } else {
                            complete?(.success(json))
                        }
                        return
                    }
                } catch {
                   print(error)
                }
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


