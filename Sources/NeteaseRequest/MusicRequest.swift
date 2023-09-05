import Foundation
import SwiftyJSON
import Alamofire

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
