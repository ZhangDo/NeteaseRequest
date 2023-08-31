import Foundation
import SwiftyJSON

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

//MARK: 手机密码登录
///手机密码登录
func cellPhoneLogin(phone: String, password: String) async throws -> CellPhoneModel {
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.cellPhoneLogin, parameters: ["phone": phone, "password": password])
}
//MARK: 获取账号信息
/// 获取账号信息
func fetchAccountInfo(cookie: String) async throws -> NRProfileModel {
//    let cookie: String = UserDefaults.standard.value(forKey: "cookie") as! String
    return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.accountInfo, parameters: ["cookie": cookie], dataObj: "profile")
}
