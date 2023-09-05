import Foundation
import SwiftyJSON
import Alamofire

struct CellPhoneModel: Codable {
    let loginType: Int
    let account: AccountModel
    let token: String
    let cookie: String
    
    
    struct AccountModel: Codable {
        let id: Int
        let userName: String
        let status: Int
        let vipType: Int
    }
}


struct NRProfileModel: Codable {
    let userId: Int
    let userType: Int
    let nickname: String
    let avatarImgId: Int
    let avatarUrl: String
    let backgroundUrl: String
    let birthday: TimeInterval?
    let gender: Int
    let vipType: Int
    
    var birthd: String {
        let date = Date(timeIntervalSince1970: (birthday ?? TimeInterval()) / 1000)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        return dateformatter.string(from: date)
    }
}

struct NRUserSubcountModel: Codable {
    let programCount: Int
    let djRadioCount: Int
    let mvCount: Int
    let artistCount: Int
    let newProgramCount: Int
    let createDjRadioCount: Int
    let createdPlaylistCount: Int
    let subPlaylistCount: Int
}


struct NRUserLevelInfoModel: Codable {
    let userId: Int
    let info: String
    let progress: Int
    let nextPlayCount: Int
    let nextLoginCount: Int
    let nowPlayCount: Int
    let nowLoginCount: Int
    let level: Int
}

struct NRUserFollowsModel: Codable {
    let py: String
    let time: Int
    let userType: Int
    let nickname: String?
    let followed: Bool
    let userId: Int
    let mutual: Bool
    let follows: Int
    let followeds: Int
    let remarkName: String?
    let avatarUrl: String?
    let signature: String?
}


struct NRSingerInfoModel: Codable {
    let info: String
    let id: Int
    let name: String
    let albumSize: Int?
    let mvSize: Int?
    let picUrl: String
}

//MARK: 手机密码登录
///手机密码登录
/// - Parameter phone: 手机号
/// - Parameter password: 密码
func cellPhoneLogin(phone: String, password: String) async throws -> CellPhoneModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.cellPhoneLogin, parameters: ["phone": phone, "password": password])
}
//MARK: 获取账号信息
/// 获取账号信息
func fetchAccountInfo(cookie: String) async throws -> NRProfileModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.accountInfo,
                                            parameters: ["cookie": cookie],
//                                            decoder: decoder,
                                            dataObj: "profile")
}

//MARK: 获取用户信息 , 歌单，收藏，mv, dj 数量
///获取用户信息 , 歌单，收藏，mv, dj 数量
func fetchUserSubcount(cookie: String) async throws -> NRUserSubcountModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userSubcount, parameters: ["cookie": cookie])

}

//MARK: 获取用户等级信息
///获取用户等级信息
func fetchUserLevelIno(cookie: String) async throws -> NRUserLevelInfoModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userLevelInfo, parameters: ["cookie": cookie],dataObj: "data")
}

//MARK: 获取用户关注列表
///获取用户关注列表
func fetchUserFollows(parameters: Parameters) async throws -> [NRUserFollowsModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userFollows, parameters: parameters, dataObj: "follow")
}

//MARK: 获取用户粉丝列表
///获取用户粉丝列表
func fetchUserFolloweds(parameters: Parameters) async throws -> [NRUserFollowsModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userFolloweds, parameters: parameters, dataObj: "followeds")
}


/// 获取收藏的歌手列表
/// - Parameters:
///  - cookie: cookie
/// - Returns: [NRSingerInfoModel]

func fetchSublist(cookie: String) async throws -> [NRSingerInfoModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.artistSublist, parameters: ["cookie": cookie], dataObj: "data")
}
