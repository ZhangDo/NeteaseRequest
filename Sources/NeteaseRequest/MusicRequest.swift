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

public func fetchTopPlayList(order: NROrder = .hot, cat: String) async throws -> [NRPlayListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.topPlayList, parameters: ["order": order, "cat": cat], dataObj: "playlists")
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
public func fetchPlayListDetail(id: Int, cookie: String) async throws -> NRPlayListDetailModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.playlistDetail, parameters: ["id": id, "cookie": cookie], dataObj: "playlist")
}

/// 获取歌单中的歌曲
///  - id: 歌单id
///  - limit: 50
/// - Returns: [NRSongModel]
///
public func fetchPlayListTrackAll(cookie: String, id: Int, limit: Int = 30, offset: Int = 0) async throws -> [NRSongModel]  {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.playListTrackAll, parameters: ["cookie": cookie, "id": id, "limit": limit, "offset": offset], dataObj: "songs")
}

///检查音频是否可用
/// - id: 音频id
///  - Returns: NRCheckAudioModel
public func checkAudio(id: Int) async throws -> NRCheckAudioModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.checkAudio, parameters: ["id":id])
}

///获取歌词
/// - id: 音频id
///  - Returns: NRLyricModel
public func fetchLyric(id: Int) async throws -> NRLyricModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.lyric, parameters: ["id":id], dataObj: "lrc")
}
///获取逐字歌词
/// - id: 音频 id
///  - Returns: NRLyricModel
public func fetchNewLyric(id: Int) async throws -> NRLyricModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.newLyric, parameters: ["id":id], dataObj: "klyric")
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

/// 获取电台 - 分类
/// - Returns: [NRBannerModel]
public func fetchDJCatelist() async throws -> [NRDJCatelistModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.djCatelist, dataObj: "categories")
}

/// 电台 - 类别热门电台
///  - cateId: 分类id
///  - Returns: [NRDJRadioModel]
public func fetchDJHotRadio(cateId: Int, limit: Int = 100) async throws -> [NRDJRadioModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.djHotRadio, parameters: ["cateId": cateId, "limit": limit], dataObj: "djRadios")
}
/// 获取推荐电台节目
///  - limit: 10
///  - Returns: [NRDJProgramModel]
public func fetchPersonalProgram(limit: Int = 10) async throws -> [NRDJProgramModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.personalProgram, parameters: ["limit": limit], dataObj: "result")
}
/// 获取推荐电台
/// - cookie: cookie
/// - Returns: [NRDJRadioModel]
public func fetchDJRecommend(cookie: String) async throws -> [NRDJRadioModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.djRecommend, parameters: ["cookie": cookie], dataObj: "djRadios")
}
/// 获取电台个性推荐
///  - cookie: cookie
/// - Returns: [NRDJRadioModel]
public func fetchPersonalRecommend(cookie: String) async throws -> [NRDJRadioModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.djPersonalRecommend, parameters: ["cookie": cookie], dataObj: "data")
}
/// 获取电台 - 节目列表
///  - rid: 电台 的 id
///  - limit: 返回数量 , 默认为 30
///  - offset : 偏移数量，用于分页 , 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认为 0
///  - asc : 排序方式,默认为 false (新 => 老 ) 设置 true 可改为 老 => 新
/// - Returns: [NRProgramModel]
public func fetchDJProgram(rid: Int, limit: Int = 30, offset: Int = 0, asc: Bool = false) async throws -> [NRProgramModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.djProgram,
                                            parameters: ["rid": rid,
                                                         "limit": limit,
                                                         "offset": offset,
                                                         "asc": asc], 
                                            dataObj: "programs")
}

/// 获取节目详情
///  - id：节目 id
///  - Returns:NRProgramModel
public func fetchDJProgramDetail(id: Int) async throws -> NRProgramModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.djPRogramDetail, parameters: ["id": id], dataObj: "program")
}

/// 获取歌曲详情 
///  - note: 调用此接口 , 传入音乐 `id`(支持多个 `id`, 用 , 隔开), 可获得歌曲详情(`dt`为歌曲时长)
///  - ids:  音乐 id
/// - Returns: [NRSongModel]
public func fetchSongDetail(ids: String) async throws -> [NRSongModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.songDetail, parameters: ["ids": ids], dataObj: "songs")
}
/// 获取歌手详情
///  - id: 歌手 id
/// - Returns: NRArtistDetailModel
public func fetchArtistDetail(id: Int) async throws -> NRArtistDetailModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.singerDetail, parameters: ["id": id], dataObj: "data")
}
/// 获取歌手单曲
///  - id: 歌手 id
/// - Returns: [NRSongModel]
public func fetchArtistSongs(cookie: String, id: Int) async throws -> [NRSongModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.singerSong, parameters: ["cookie": cookie, "id": id], dataObj: "hotSongs")
}
/// 获取歌手专辑
///  - id: 歌手 id
///   - limit:
/// - Returns: [NRAlbumModel]
public func fetchArtistAlbum(cookie: String, id: Int, limit: Int = 100) async throws -> [NRAlbumModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.singerAlbum, parameters: ["cookie":cookie, "id": id, "limit": limit], dataObj: "hotAlbums")
}

/// 获取歌手MV
///  - id: 歌手 id
/// - Returns: [NRMVModel]
public func fetchArtistMV(id: Int, limit: Int = 100) async throws -> [NRMVListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.singerMV, parameters: ["id": id, "limit": limit], dataObj: "mvs")
}

/// 获取 MV 详情
///  - mvid: mv 的 id
/// - Returns: NRMVDetailModel
public func fetchMVDetail(mvid: Int, cookie: String) async throws -> NRMVDetailModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.mvDetail, parameters: ["mvid": mvid, "cookie": cookie], dataObj: "data")
}

/// 获取全部MV
///  - area:  地区,可选值为全部,内地,港台,欧美,日本,韩国,不填则为全部 type: 类型,可选值为全部,官方版,原生,现场版,网易出品,不填则为全部
///  - order:  排序,可选值为上升最快,最热,最新,不填则为上升最快
///  - limit:
///  - offset:
public func fetchAllMV(area: String = "全部", order: String = "上升最快", limit: Int = 100, offset: Int = 0) async throws -> [NRMVListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.allMV, parameters: ["area": area, "order": order, "limit": limit, "offset": offset], dataObj: "data")
}

/// 获取 MV 地址
///  - id: mv 的 id
/// - Returns: NRMVDetailModel
public func fetchMVUrl(id: Int, cookie: String) async throws -> NRMVUrlModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.mvUrl, parameters: ["id": id, "cookie": cookie], dataObj: "data")
}
/// 获取 最近播放-播客
///  - cookie:
///  - limit:
/// - Returns: NRRecentPlayModel
public func fetchRecentDj(cookie: String, limit: Int = 100) async throws -> NRRecentPlayModel<NRDJRadioModel> {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recentDj, parameters: ["cookie": cookie, "limit": limit], dataObj: "data")
}

/// 获取 最近播放-歌曲
///  - cookie:
///  - limit:
/// - Returns: NRRecentPlayModel
public func fetchRecentSong(cookie: String, limit: Int = 100) async throws -> NRRecentPlayModel<NRSongModel> {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recentSong, parameters: ["cookie": cookie, "limit": limit], dataObj: "data")
}

/// 获取 最近播放-声音
///  - cookie:
///  - limit:
/// - Returns: NRRecentPlayModel
public func fetchRecentVoice(cookie: String, limit: Int = 100) async throws -> NRRecentPlayModel<NRRencentVoiceModel> {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recentVoice, parameters: ["cookie": cookie, "limit": limit], dataObj: "data")
}

/// 获取 最近播放-歌单
///  - cookie:
///  - limit:
/// - Returns: NRRecentPlayModel
public func fetchRecentPlaylist(cookie: String, limit: Int = 100) async throws -> NRRecentPlayModel<NRPlayListModel> {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recentPlaylist, parameters: ["cookie": cookie, "limit": limit], dataObj: "data")
}

/// 获取 最近播放-专辑
///  - cookie:
///  - limit:
/// - Returns: NRRecentPlayModel
public func fetchRecentAlbum(cookie: String, limit: Int = 100) async throws -> NRRecentPlayModel<NRAlbumModel> {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recentAlbum, parameters: ["cookie": cookie, "limit": limit], dataObj: "data")
}

/// 获取 最近播放-视频
///  - cookie:
///  - limit:
/// - Returns: NRRecentPlayModel
public func fetchRecentVideo(cookie: String, limit: Int = 100) async throws -> NRRecentPlayModel<NRVideoModel> {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.recentVideo, parameters: ["cookie": cookie, "limit": limit], dataObj: "data")
}

/// 获取用户歌单
///  - uid:
///  - limit:
///  - offset:
/// - Returns: NRRecentPlayModel
public func fetchUserPlaylist(cookie: String, uid: Int, limit: Int = 100, offset: Int = 0) async throws -> [NRPlayListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userPlaylist, parameters: ["cookie": cookie, "uid": uid, "limit": limit, "offset": offset], dataObj: "playlist")
}

/// 获取我收藏的专辑
///  - limit:
///  - offset:
/// - Returns: NRRecentPlayModel
public func fetchAlbumSublist(cookie: String, limit: Int = 100, offset: Int = 0) async throws -> [NRAlbumModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.albumSublist, parameters: ["cookie": cookie, "limit": limit, "offset": offset], dataObj: "data")
}

/// 获取我收藏的播客
///  - limit:
///  - offset:
/// - Returns: NRRecentPlayModel
public func fetchDjSublist(cookie: String, limit: Int = 100, offset: Int = 0) async throws -> [NRDJRadioModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.djSublist, parameters: ["cookie": cookie, "limit": limit, "offset": offset], dataObj: "djRadios")
}



/// 搜索
///  - keywords:  关键词
///  - type:  搜索类型；默认为 1 即单曲 , 取值意义 : 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频, 1018:综合, 2000:声音(搜索声音返回字段格式会不一样)
///  - limit: 默认 100
///  - Returns:NRSearchModel
public func search(cookie: String, keywords: String, type: Int, limit: Int = 100) async throws -> NRSearchModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.search, parameters: ["cookie": cookie, "keywords": keywords, "type": type, "limit": limit], dataObj: "result")
}


///收藏/取消收藏歌单
/// - t : 类型,1:收藏,2:取消收藏
/// - id : 歌单 id
/// - cookie:
public func subscribePlaylist(t: Int, id: Int, cookie: String, complete: ((Result<JSON, RequestError>) -> Void)? = nil) {
    NeteaseRequest.requestJSON(url: NeteaseRequest.EndPoint.subscribePlaylist, parameters: ["t": t, "id": id, "cookie": cookie], complete: complete)
}

/// 获取歌曲热门评论
///  - id:
///  - limit:
/// - Returns: [NRCommentModel]
public func fetchMusicHotComment(id: Int, limit: Int = 100) async throws -> [NRCommentModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.musicComment, parameters: ["id": id, "limit": limit], dataObj: "hotComments")
}

/// 获取楼层评论
///  - parentCommentId: 楼层评论 id
///  - type: type: 数字 , 资源类型 , 对应歌曲 , mv, 专辑 , 歌单 , 电台, 视频对应以下类型 0: 歌曲 1: mv 2: 歌单3: 专辑4: 电台节目5: 视频 6: 动态 7: 电台
///  - id: 资源 id
/// - Returns: NRFloorCommentModel
public func fetchFloorComment(parentCommentId: Int, id: Int, type: Int = 0, limit: Int = 20) async throws -> NRFloorCommentModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.floorComment, parameters: ["parentCommentId": parentCommentId, "id": id, "type": type, "limit": limit], dataObj: "data")
}

/// 获取所有榜单
/// - Returns: [NRTopListModel]
public func fetchAllToplist() async throws -> [NRTopListModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.allToplist, dataObj: "list")
}
/// 获取歌手榜
///  - type: 1: 华语 2: 欧美 3: 韩国 4: 日本
/// - Returns: NRArtistToplistModel
public func fetchSingerToplist(type: Int = 0) async throws -> NRArtistToplistModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.singerToplist, parameters: ["type": type], dataObj: "list")
}

/// 获取相似歌手
///  - id:
///  - cookie
/// - Returns: [NRArtistModel]
public func fetchSimiArtistList(id: Int, cookie: String) async throws -> [NRArtistModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.simiArtist, parameters: ["id": id, "cookie": cookie], dataObj: "artists")
}
/// 获取喜欢音乐列表
/// - uid:
/// - cookie:
/// - Returns:[Int]
public func fetchLikeMusicList(uid: Int, cookie: String) async throws -> [Int] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.likelist, parameters: ["uid": uid, "cookie": cookie], dataObj: "ids")
}

/// 获取歌手百科信息
/// - id:
/// - cookie:
/// - Returns:NRArtistIntroduceModel
public func fetchArtistIntroduce(id: Int, cookie: String) async throws -> NRArtistIntroduceModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.artistIntroduce, parameters: ["id": id, "cookie": cookie], dataObj: "data")
}

/// 获取 mlog 播放地址
/// - Returns:NRMlogUrlDetailModel
public func fetchMlogUrlDetail(id: String) async throws -> NRMlogUrlDetailModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.mlogUrl, parameters: ["id": id] ,dataObj: "data")
}
/// 获取收藏的 MV 列表
/// - cookie:
/// - Returns:[NRMVSublistModel]
public func fetchMVSublist(cookie: String) async throws -> [NRMVSublistModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.mvSublist, parameters: ["cookie": cookie], dataObj: "data")
}
/// 获取云盘数据
/// - cookie:
/// - Returns: [NRUserCloudDataModel]
public func fetchUserCloudData(cookie: String, limit: Int = 200) async throws -> [NRUserCloudDataModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userCloudData, parameters: ["cookie": cookie, "limit": limit], dataObj: "data")
}
///获取历史日推可用日期
/// - cookie:
/// - Returns: NRHistoryDateModel
public func fetchHistoryDate(cookie: String) async throws -> NRHistoryDateModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.historyDate, parameters: ["cookie": cookie], dataObj: "data")
}
///获取历史日推详情数据
/// - date: 日期
/// - cookie:
/// - Returns: 
public func fetchHistoryRecommendDetail(cookie: String, date: String) async throws -> NRHistoryDateModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.historyRecommendDetail, parameters: ["cookie": cookie, "date": date], dataObj: "data")
}
