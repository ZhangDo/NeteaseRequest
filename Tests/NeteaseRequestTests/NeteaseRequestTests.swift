import XCTest
@testable import NeteaseRequest

final class NeteaseRequestTests: XCTestCase {
    func testExample() async {
        
        NR_BASEURL = "https://service-ioi18dzi-1259615918.gz.apigw.tencentcs.com/release"
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
        
        
//        do {
//            let artistList: [NRArtistModel] = try await fetchArtistList()
//            let name: [String] = artistList.map { model in
//                return model.name
//            }
//            print("artist ==== \(name)")
//        } catch {
//            print(error)
//        }
//
//
//        do {
//            let songModel: [NRSongModel] = try await fetchTopSongs(singerId: 31211)
//            let name: [String] = songModel.map { model in
//                return model.name
//            }
//            print("song ==== \(name)")
//        } catch {
//            print(error)
//        }
//
//        do {
//            let audioUrlModel: [NRAudioUrlModel] = try await fetchAudioUrl(id: 442869301, cookie: cookie)
//            let name: [String] = audioUrlModel.map { model in
//                return model.url!
//            }
//            print("audioUrlModel.url ==== \(name)")
//        } catch {
//            print(error)
//        }
        
//        do {
//            let songModel: [NRSongModel] = try await fetchAllSongs(singerId: 31211)
//            let name: [String] = songModel.map { model in
//                return model.name
//            }
//            print("song ==== \(name)")
//        } catch {
//            print(error)
//        }
//
//        do {
//            let singerModel: [NRSingerInfoModel] = try await fetchSublist(cookie: cookie)
//            let name: [String] = singerModel.map { model in
//                return model.name
//            }
//            print("song ==== \(name)")
//        } catch {
//            print(error)
//        }
//        do {
//            let catListModel: NRCatModel = try await fetchPlayCatList()
//            let sub:[NRCatInfoModel] = catListModel.sub
//            let filterModels: [NRCatInfoModel] = sub.filter { model in
//                model.category == 0
//            }
//            print(filterModels)
//            
//        } catch {
//            print(error)
//        }
        
        
//        do {
//            let hotListModel: [NRCatInfoModel] = try await fetchHotPlayList()
//            let filterModels: [NRCatInfoModel] = hotListModel.filter { model in
//                model.category == 0
//            }
//            print(filterModels)
//
//        } catch {
//            print(error)
//        }
        
//        do {
//            let topListModel: [NRPlayListModel] = try await fetchTopPlayList()
//            let filterModels: [String] = topListModel.map { model in
//                return model.name
//            }
//            print(filterModels)
//
//        } catch {
//            print(error)
//        }
//        let highqualityListModel: [NRPlayListModel] = (try? await fetchHighqualityPlayList()) ?? []
//        let filterModels: [Int] = highqualityListModel.map { model in
//            return model.id
//        }
//        print(filterModels)
//        let playListDetail: NRPlayListDetailModel = try! await fetchPlayListDetail(id: filterModels.first!)
//
//        print(playListDetail)
        
//        let allSongs: [NRSongModel] =  try! await fetchPlayListTrackAll(id: 8615539052)
//        let filterModels: [Int] = allSongs.map { model in
//            return model.id
//        }
//        print(allSongs)
//
//        do {
//            let checkModel: NRCheckAudioModel = try await checkAudio(id: filterModels.first!)
//            print(checkModel.message)
//        } catch {
//            print(error)
//        }
        
        
//        let lyricModel: NRLyricModel = try! await fetchLyric(id: 2054003356)
//        print(lyricModel.lyric ?? "")
        
//        let recommendPlayList: [NRRecommendPlayListModel] = try! await fetchRecommendPlayList(cookie: cookie)
//        let recommendPlayListNames: [String] = recommendPlayList.map { model in
//            return model.name
//        }
//
//        print(recommendPlayListNames)
        
//        let dailySongModel: NRDailySongModel =  try! await fetchDailtSongs(cookie: cookie)
//        let filterModels: [String] = dailySongModel.dailySongs.map { model in
//            return model.name
//        }
//        print(filterModels)
        
        let personalFMModels: [NRPersonalFMModel] = try! await fetchPersonalFM(cookie: cookie)
        let filterModels: [String] = personalFMModels.map { model in
            return model.name
        }
        print(filterModels)
        
    }
    
    
}
