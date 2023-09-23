import Foundation
import SwiftyJSON
import Alamofire

///获取音频url
/// - Parameters:
///  - id: 音频 id
///  - level: 播放音质等级
///  - cookie: 登录cookie
/// - Returns: [AudioUrlModel]

public func fetchAudioUrl(id: Int, level: NRSongLevel = .standard, cookie: String) async throws -> [NRAudioUrlModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.audioUrl, parameters: ["id": id, "level": level.rawValue, "cookie": cookie], dataObj: "data")
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


/// 获取歌单分类
/// - Returns: [SongModel]

public func fetchPlayCatList() async throws -> NRCatModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.catList)
}

/// 获取热门歌单分类
/// - Returns: [NRCatInfoModel]

public func fetchHotPlayList() async throws -> [NRCatInfoModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.hotPlayList,dataObj: "tags")
}

/// 获取歌单 ( 网友精选碟 )
///  - order: 排序
///  - cat: tag, 比如 " 华语 "、" 古风 " 、" 欧美 "、" 流行 ", 默认为 "全部",可从歌单分类接口获取(/playlist/catlist)
/// - Returns: [NRPlayListModel]

public func fetchTopPlayList(order: NROrder = .hot, cat: String = "全部") async throws -> [NRPlayListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.topPlayList, parameters: ["order": order, cat: cat], dataObj: "playlists")
}

/// 获取精品歌单
///  - cat: tag, 比如 " 华语 "、" 古风 " 、" 欧美 "、" 流行 ", 默认为 "全部",可从歌单分类接口获取(/playlist/catlist)
///  - limit: 50
/// - Returns: [NRPlayListModel]
///
public func fetchHighqualityPlayList(cat: String = "全部",limit: Int = 30) async throws -> [NRPlayListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.highqualityPlayList, parameters: ["cat": cat, "limit": limit], dataObj: "playlists")
}

/// 获取歌单详情
///  - id: 歌单id
/// - Returns: [NRPlayListModel]
///
public func fetchPlayListDetail(id: Int) async throws -> NRPlayListDetailModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.playlistDetail, parameters: ["id": id], dataObj: "playlist")
}

/// 获取歌单中的歌曲
///  - id: 歌单id
///  - limit: 50
/// - Returns: [NRSongModel]
///
public func fetchPlayListTrackAll(id: Int, limit: Int = 30, offset: Int = 0) async throws -> [NRSongModel]  {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.playListTrackAll, parameters: ["id": id, "limit": limit, "offset": offset], dataObj: "songs")
}

///检查音频是否可用
/// - id: 音频id
public func checkAudio(id: Int) async throws -> NRCheckAudioModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.checkAudio, parameters: ["id":id])
}

///获取歌词
/// - id: 音频id
public func fetchLyric(id: Int) async throws -> NRLyricModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.lyric, parameters: ["id":id], dataObj: "lrc")
}

/// 获取每日推荐歌单

///  - cookie: 登录cookie
/// - Returns: [NRRecommendPlayListModel]

public func fetchRecommendPlayList(cookie: String) async throws -> [NRRecommendPlayListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recommendPlayList, parameters: ["cookie": cookie], dataObj: "recommend")
}

///获取每日推荐歌曲
/// - cookie: 登录cookie
/// - Returns: NRDailySongModel
public func fetchDailtSongs(cookie: String) async throws -> NRDailySongModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recommendSongs, parameters: ["cookie": cookie], dataObj: "data")
}

///获取私人FM
/// - cookie: 登录cookie
/// - Returns: [NRPersonalFMModel]
public func fetchPersonalFM(cookie: String) async throws -> [NRPersonalFMModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.personalfm, parameters: ["cookie": cookie], dataObj: "data")
}

/// 获取推荐歌单

///  - cookie: 登录cookie
/// - Returns: [NRRecommendPlayListModel]
public func fetchPersonalizedPlayList(cookie: String, limit: Int = 30) async throws -> [NRRecommendPlayListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.personalizedPlayList, parameters: ["cookie": cookie, "limit": limit], dataObj: "result")
}

/// 获取推荐新音乐

///  - cookie: 登录cookie
/// - Returns: [NewSongModel]
public func fetchNewSong(cookie: String, limit: Int = 30) async throws -> [NRNewSongModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.newsong, parameters: ["cookie": cookie, "limit": limit], dataObj: "result")
}


/// 获取Banner
///  - type:
///    - 0: pc
///    - 1: android
///    - 2: iphone
///    - 3: ipad
/// - Returns: [NRBannerModel]
public func fetchBanners(type: Int = 2) async throws -> [NRBannerModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.banner, parameters: ["type": type], dataObj: "banners")
}

/// 获取Album内容
///  - id: targetId
/// - Returns: [NRBannerModel]
public func fetchAlbumDetail(id: Int) async throws -> NRAlbumDetailModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.albumContent, parameters: ["id": id])
}
