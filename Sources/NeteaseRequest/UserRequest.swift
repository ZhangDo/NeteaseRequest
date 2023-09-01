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
    let birthday: Date?
    let gender: Int
    let vipType: Int
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

//MARK: 手机密码登录
///手机密码登录
func cellPhoneLogin(phone: String, password: String) async throws -> CellPhoneModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.cellPhoneLogin, parameters: ["phone": phone, "password": password])
}
//MARK: 获取账号信息
/// 获取账号信息
func fetchAccountInfo(cookie: String) async throws -> NRProfileModel {
//    let cookie: String = UserDefaults.standard.value(forKey: "cookie") as! String
//    let decoder = JSONDecoder()
//    decoder.dateDecodingStrategy = .formatted(DateFormatter.myDateFormatter)
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

//MARK: 获取用户关注列表
///获取用户关注列表
func fetchUserFolloweds(parameters: Parameters) async throws -> [NRUserFollowsModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userFolloweds, parameters: parameters, dataObj: "followeds")
}



extension DateFormatter {
    static let myDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 8)
        formatter.locale = Locale(identifier: "zh_Hans_CN")
        return formatter
    }()
}
