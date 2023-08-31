import XCTest
@testable import NeteaseRequest

final class NeteaseRequestTests: XCTestCase {
    func testExample() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
//        do {
//            let newSongs:[NewSongs] = try await getNewSons()
//            print(newSongs.first!.name)
//
//        } catch {
//            print(error)
//        }
        
        
//        do {
//            let cellPhoneModel: CellPhoneModel = try await cellPhoneLogin(phone: "17610363682", password: "Feel.8023")
//            UserDefaults.standard.set(cellPhoneModel.cookie, forKey: "cookie")
//        } catch {
//            print(error)
//        }
        
        do {
            let cookie: String = UserDefaults.standard.value(forKey: "cookie") as! String
            let profileModel: NRProfileModel = try await fetchAccountInfo(cookie: cookie)
            print("profileInfo\(String(describing: profileModel.avatarUrl))")
        } catch {
            print(error)
        }

        
    }
    
    
    func getNewSons() async throws ->  [NewSongs] {
        return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.newsong, parameters: [:], dataObj: "result")
    }
    
    
}
