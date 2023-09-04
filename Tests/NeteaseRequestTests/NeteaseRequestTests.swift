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
        let cookie: String = UserDefaults.standard.value(forKey: "cookie") as! String

//        do {
//            let profileModel: NRProfileModel = try await fetchAccountInfo(cookie: cookie)
//            print("profileInfo ==== \(profileModel.birthd)")
//        } catch  {
//            print(error);
//        }
//
//        do {
//            let userSubcount: NRUserSubcountModel = try await fetchUserSubcount(cookie: cookie)
//            print("userSubcountsubPlaylistCount === \(userSubcount.subPlaylistCount)")
//        } catch {
//            print(error)
//        }
//
//        do {
//            let userLevelInfo: NRUserLevelInfoModel = try await fetchUserLevelIno(cookie: cookie)
//            print("userLevelInfo === \(userLevelInfo.info)")
//        } catch {
//            print(error)
//        }
//
//        do {
//            let userFollows: [NRUserFollowsModel] = try await fetchUserFollows(parameters: ["uid": 81479026])
//            let userNickname: [String] = userFollows.map({ model in
//                return model.nickname!
//            })
//            print("userNickname === \(userNickname)")
//        } catch {
//            print(error)
//        }
//
//        do {
//            let userFolloweds: [NRUserFollowsModel] = try await fetchUserFolloweds(parameters: ["uid": 81479026])
//            let userNickname: [String] = userFolloweds.map({ model in
//                return model.nickname!
//            })
//            print("userNickname === \(userNickname)")
//        } catch {
//            print(error)
//        }
        
        
        do {
            let artistList: [ArtistModel] = try await fetchArtistList()
            let name: [String] = artistList.map { model in
                return model.name
            }
            print("artist ==== \(name)")
        } catch {
            print(error)
        }
        
        
        do {
            let songModel: [SongModel] = try await fetchTopSongs(singerId: 31211)
            let name: [String] = songModel.map { model in
                return model.name
            }
            print("song ==== \(name)")
        } catch {
            print(error)
        }
        
        do {
            let audioUrlModel: [AudioUrlModel] = try await fetchAudioUrl(id: 442869301)
            let name: [String] = audioUrlModel.map { model in
                return model.url
            }
            print("audioUrlModel.url ==== \(name)")
        } catch {
            print(error)
        }
        
        

        
    }
    
    
    func getNewSons() async throws ->  [NewSongs] {
        return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.newsong, parameters: [:], dataObj: "result")
    }
    
    
}
