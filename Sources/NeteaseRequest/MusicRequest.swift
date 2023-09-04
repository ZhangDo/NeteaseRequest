import Foundation
import SwiftyJSON
import Alamofire

enum SingerType: Int {
    case allSinger = -1 // 全部
    case male = 1 // 男歌手
    case female = 2 // 女歌手
    case band = 3 // 乐队
}

enum AreaType: Int {
    case allArea = -1 // 全部
    case other = 0 // 其他
    case chinese = 7 // 华语
    case japanese = 8 // 日本
    case korean = 16 // 韩国
    case western = 96 // 欧美
}


struct ArtistModel: Codable {
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




///获取歌手分类列表
/// - Parameters:
///  - type: 歌手类型 默认 all
///  - area: 区域
///  - initial: 按首字母索引查找参数
///  - limit: 返回数量 , 默认为 30
/// - Returns: [ArtistModel]
func fetchArtistList(type: SingerType = .allSinger, area: AreaType = .allArea, initial: String? = nil, limit: Int = 30) async throws -> [ArtistModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.artistList, parameters: ["type": type.rawValue, "area": area.rawValue, "limit": limit, "initial": initial ?? ""], dataObj: "artists")
}
