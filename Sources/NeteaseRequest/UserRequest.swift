import Foundation
import SwiftyJSON
import Alamofire

//MARK: 手机密码登录
///手机密码登录
/// - Parameter phone: 手机号
/// - Parameter password: 密码
public func cellPhoneLogin(phone: String, password: String) async throws -> CellPhoneModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.cellPhoneLogin, parameters: ["phone": phone, "password": password])
}
//MARK: 获取账号信息
/// 获取账号信息
public func fetchAccountInfo(cookie: String) async throws -> NRProfileModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.accountInfo,
                                            parameters: ["cookie": cookie],
//                                            decoder: decoder,
                                            dataObj: "profile")
}

//MARK: 获取用户信息 , 歌单，收藏，mv, dj 数量
///获取用户信息 , 歌单，收藏，mv, dj 数量
public func fetchUserSubcount(cookie: String) async throws -> NRUserSubcountModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userSubcount, parameters: ["cookie": cookie])

}

//MARK: 获取用户等级信息
///获取用户等级信息
public func fetchUserLevelIno(cookie: String) async throws -> NRUserLevelInfoModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userLevelInfo, parameters: ["cookie": cookie],dataObj: "data")
}

//MARK: 获取用户关注列表
///获取用户关注列表
public func fetchUserFollows(parameters: Parameters) async throws -> [NRUserFollowsModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userFollows, parameters: parameters, dataObj: "follow")
}

//MARK: 获取用户粉丝列表
///获取用户粉丝列表
public func fetchUserFolloweds(parameters: Parameters) async throws -> [NRUserFollowsModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.userFolloweds, parameters: parameters, dataObj: "followeds")
}


/// 获取收藏的歌手列表
/// - Parameters:
///  - cookie: cookie
/// - Returns: [NRSingerInfoModel]

public func fetchSublist(cookie: String) async throws -> [NRSingerInfoModel] {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.artistSublist, parameters: ["cookie": cookie], dataObj: "data")
}

