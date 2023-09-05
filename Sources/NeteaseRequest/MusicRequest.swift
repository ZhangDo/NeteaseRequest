import Foundation
import SwiftyJSON
import Alamofire
public enum NRSingerType: Int {
    case allSinger = -1 // 全部
    case male = 1 // 男歌手
    case female = 2 // 女歌手
    case band = 3 // 乐队
}

public enum NRAreaType: Int {
    case allArea = -1 // 全部
    case other = 0 // 其他
    case chinese = 7 // 华语
    case japanese = 8 // 日本
    case korean = 16 // 韩国
    case western = 96 // 欧美
}

public enum NROrder: String {
    ///热门
    case hot = "hot"
    ///时间
    case time = "time"
    
}

public enum NRSongLevel: String, Codable {
    ///标准
    case standard = "standard"
    ///较高
    case higher = "higher"
    ///极高
    case exhigh = "exhigh"
    ///无损
    case lossless = "lossless"
    ///Hi-Res
    case hires = "hires"
    ///高清环绕声
    case jyeffect = "jyeffect"
    ///沉浸环绕声
    case sky = "sky"
    ///超清母带
    case jymaster = "jymaster"
    
}

public struct NRArtistModel: Codable {
    let accountId: Int?
    let albumSize: Int
    let briefDesc: String
    let fansCount: Int
    let followed: Bool
    let id: Int
    let img1v1Url: String?
    let name: String
    let musicSize: Int
    let picUrl: String?
    let trans: String?
}

public struct NRSongModel: Codable {
    let name: String
    let id: Int
    let publishTime: TimeInterval?
    let level: NRSongLevel?
}

public struct NRAudioUrlModel: Codable {
    let id: Int
    let url: String
    let size: Int
    let expi: Int
    let time: Int
    let type: String
}

///获取音频url
/// - Parameters:
///  - id: 音频 id
///  - level: 播放音质等级
/// - Returns: [AudioUrlModel]

public func fetchAudioUrl(id: Int, level: NRSongLevel = .standard) async throws -> [NRAudioUrlModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.audioUrl, parameters: ["id": id, "level": level.rawValue], dataObj: "data")
}


///获取歌手分类列表
/// - Parameters:
///  - type: 歌手类型 默认 all
///  - area: 区域
///  - initial: 按首字母索引查找参数
///  - limit: 返回数量 , 默认为 30
/// - Returns: [ArtistModel]
public func fetchArtistList(type: NRSingerType = .allSinger, area: NRAreaType = .allArea, initial: String? = nil, limit: Int = 30) async throws -> [NRArtistModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.artistList, parameters: ["type": type.rawValue, "area": area.rawValue, "limit": limit, "initial": initial ?? ""], dataObj: "artists")
}
/// 获取歌手热门 50 首歌曲
/// - Parameters:
///  - id: 歌手 id
/// - Returns: [SongModel]

public func fetchTopSongs(singerId: Int) async throws -> [NRSongModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.topSong, parameters: ["id": singerId], dataObj: "songs")
}


/// 获取歌手全部歌曲
/// - Parameters:
///  - id: 歌手 id]
///  - order: 排序
///  - limit: 返回数量 , 默认为 30
/// - Returns: [SongModel]

public func fetchAllSongs(singerId: Int, order: NROrder = .hot, limit: Int = 30) async throws -> [NRSongModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.allSong, parameters: ["id": singerId, "order":order, "limit": limit], dataObj: "songs")
}
