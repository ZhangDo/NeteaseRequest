import XCTest
@testable import NeteaseRequest

final class NeteaseRequestTests: XCTestCase {
    func testExample() async {
        //腾讯云 serverless 部署
        //TODO:  服务部署请参考 https://github.com/Binaryify/NeteaseCloudMusicApi/blob/master/README.MD
        //下面是我在腾讯云部署的（不保证一直能用）
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
        let cookie: String = UserDefaults.standard.value(forKey: "cookie") as! String
        
        //        do {
        //            let profileModel: NRProfileModel = try await fetchAccountInfo(cookie: cookie)
        //            print("profileInfo ==== \(profileModel.birthd)")
        //        } catch  {
        //            print(error);
        //        }
        
        //            do {
        //                let profileModel: NRUserDetailModel = try await fetchUserInfoDetail(uid: 81479026, cookie: cookie)
        //                print("profileModel ==== \(profileModel)")
        //            } catch  {
        //                print(error);
        //            }
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
        //            let level: [String] = audioUrlModel.map { model in
        //                return model.levelName
        //            }
        //            print("audioUrlModel.level ==== \(level)")
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
        //            print(catListModel)
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
        //            let topListModel: [NRPlayListModel] = try await fetchTopPlayList(cat: "朋克")
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
        //        let playListDetail: NRPlayListDetailModel = try! await fetchPlayListDetail(id: 7780071743, cookie: cookie)
        //
        //        print(playListDetail)
        
        //        let allSongs: [NRSongModel] =  try! await fetchPlayListTrackAll(id: 7780071743)
        //        let filterModels: [String] = allSongs.map { $0.dt }.map { dt in
        //            let min = dt / 1000 / 60
        //            let sec = dt / 1000 % 60
        //            return String(format: "%d:%02d", min, sec)
        //        }
        //
        //        print(filterModels)
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
        //            return model.copywriter ?? ""
        //        }
        //
        //        print(recommendPlayListNames)
        
        //        let dailySongModel: NRDailySongModel =  try! await fetchDailtSongs(cookie: cookie)
        //        let filterModels: [String] = dailySongModel.dailySongs.map { model in
        //            return model.name
        //        }
        //        print(filterModels)
        
        //        let personalFMModels: [NRPersonalFMModel] = try! await fetchPersonalFM(cookie: cookie)
        //        let filterModels: [String] = personalFMModels.map { model in
        //            return model.name
        //        }
        //        print(filterModels)
        
        //        let personalizedPlayList: [NRRecommendPlayListModel] = try! await fetchPersonalizedPlayList(cookie: cookie)
        //        let personalizedPlayListNames: [String] = personalizedPlayList.map { model in
        //            return model.name
        //        }
        //
        //        print(personalizedPlayListNames)
        
        //        let newSongModels: [NRNewSongModel] = try! await fetchNewSong(cookie: cookie)
        //        let newSongNames: [String] = newSongModels.map { model in
        //            return model.name
        //        }
        //        print(newSongNames)
        
        //        let bannerModels: [NRBannerModel] = try! await fetchBanners(type: 2)
        //        let typeTitles: [String] = bannerModels.map { model in
        //            return model.typeTitle!
        //        }
        //        print(bannerModels)
        
        //        let albumDetail: NRAlbumDetailModel = try! await fetchAlbumDetail(id: 174767494)
        //        let names: [String] = albumDetail.album!.artists!.map { model in
        //            return model.name
        //        }
        //
        //        print(names)
        //        let djCatelist: [NRDJCatelistModel] = try! await fetchDJCatelist()
        //        print(djCatelist)
        
        //        let djHotRadios: [NRDJRadioModel] = try! await fetchDJHotRadio(cateId: 2)
        //        print(djHotRadios.first!)
        
        //        let personalPrograms = try! await fetchPersonalProgram()
        //        print(personalPrograms)
        
        //        let djRecommends = try! await fetchDJRecommend(cookie: cookie)
        //        print(djRecommends)
        
        //        let djpersonalRecommends = try! await fetchPersonalRecommend(cookie: cookie)
        //        print(djpersonalRecommends)
        
        //        let djPrograms: [NRProgramModel] = try! await fetchDJProgram(rid: 975555134)
        //        print(djPrograms)
        
        //        let djProgramDetail: NRProgramModel = try! await fetchDJProgramDetail(id: 2518969003)
        //        print(djProgramDetail)
        
        //        let key:String = try! await fetchQRKey().unikey
        //        print(key)
        //        let qrCode:String = try! await fetchQRCode(key: key).qrurl
        //        print(qrCode)
        //
        //        let qrCheckModel: NRQRCodeCheckModel = try! await checkQRCode(key: key)
        //        print(qrCheckModel)
        
        //        do {
        //            let searchModle: NRSearchModel = try await search(keywords: "taylor", type: 1014, limit: 100)
        //            let ids: String = searchModle.videos!.map { $0.vid }.joined(separator: ",")
        //            print(ids)
        //            let songs:[NRSongModel] = try await fetchSongDetail(ids: ids)
        //            print(songs)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let singerDetail: NRArtistDetailModel = try await fetchArtistDetail(id: 3684)
        //            print(singerDetail)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let singerSongs: [NRSongModel] = try await fetchAllSongs(singerId: 3684, order: .hot, limit: 100)
        //            print(singerSongs)
        //        } catch {
        //            print(error)
        //        }
        
        //            do {
        //                let singerAlbum: [NRAlbumModel] = try await fetchArtistAlbum(id: 3684, limit: 100)
        //                print(singerAlbum)
        //            } catch {
        //                print(error)
        //            }
        //        do {
        //            let singerMVs: [NRMVListModel] = try await fetchArtistMV(id: 3684)
        //            print(singerMVs)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let mvDetail: NRMVDetailModel = try await fetchMVDetail(mvid: 14634962)
        //            print(mvDetail)
        //        } catch {
        //            print(error)
        //        }
        //
        //        do {
        //            let mvUrlModel: NRMVUrlModel = try await fetchMVUrl(id: 14629024)
        //            print(mvUrlModel)
        //        } catch {
        //            print(error)
        //        }
        //        do {
        //            let fansCountModel: NRArtistFansCountModel = try await fetchArtistFansCount(id: 3684)
        //            print(fansCountModel)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let songModels: [NRSongModel] = try await fetchArtistSongs(id: 3684)
        //            print(songModels.map { $0.tns })
        //        } catch {
        //
        //        }
        //        do {
        //            let recentModel: NRRecentPlayModel = try await fetchRecentDj(cookie: cookie)
        //            print(recentModel.list.first?.data)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let recentModel: NRRecentPlayModel = try await fetchRecentSong(cookie: cookie)
        //            print(recentModel.list.first?.data)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let recentModel: NRRecentPlayModel = try await fetchRecentPlaylist(cookie: cookie)
        //            print(recentModel.list.first?.data)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let recentModel: NRRecentPlayModel = try await fetchRecentAlbum(cookie: cookie)
        //            print(recentModel.list.first?.data)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let recentModel: NRRecentPlayModel = try await fetchRecentVideo(cookie: cookie)
        //            print(recentModel.list.first!.data)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let recentModel: NRRecentPlayModel = try await fetchRecentVoice(cookie: cookie)
        //            print(recentModel.list.first!.data)
        //        } catch {
        //            print(error)
        //        }
        
        
        
        //        do {
        //            let mvModelList: [NRMVListModel] = try await fetchAllMV(area: "韩国", order: "最热")
        //            print(mvModelList)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let userPlaylist: [NRPlayListModel] = try await fetchUserPlaylist(cookie: cookie, uid: 81479026).filter { model in
        //                model.userId != 81479026
        //            }
        //            print(userPlaylist)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let albumSublist: [NRAlbumModel] = try await fetchAlbumSublist(cookie: cookie, limit: 100, offset:  0)
        //            print(albumSublist)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let djSublist: [NRDJRadioModel] = try await fetchDjSublist(cookie: cookie, limit: 100, offset:  0)
        //            print(djSublist)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let commentlist: [NRCommentModel] = try await fetchMusicHotComment(id: 186016)
        //            print(commentlist)
        //        } catch {
        //            print(error)
        //        }
        //        do {
        //            let floorComment: NRFloorCommentModel = try await fetchFloorComment(parentCommentId: 4956438, id: 186016)
        //            print(floorComment)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let allToplist: [NRTopListModel] = try await fetchAllToplist()
        //            print(allToplist)
        //        } catch {
        //            print(error)
        //        }
        //        do {
        //            let artistToplist: NRArtistToplistModel = try await fetchSingerToplist(type: 1)
        //            print(artistToplist.artists)
        //        } catch {
        //            print(error)
        //        }
        
        //        do {
        //            let artistList: [NRArtistModel] = try await fetchSimiArtistList(id: 3684, cookie: cookie)
        //            print(artistList)
        //        } catch {
        //            print(error)
        //        }
        
//        do {
//            let songIds: [Int] = try await fetchLikeMusicList(uid: 81479026, cookie: cookie)
//            print(songIds)
//        } catch {
//            print(error)
//        }
        
//        do {
//            let artistIntroduce: NRArtistIntroduceModel = try await fetchArtistIntroduce(id: 3684, cookie: cookie)
//            print(artistIntroduce)
//        } catch {
//            print(error)
//        }
        
//        do {
//            let mlogUrlDetail: NRMlogUrlDetailModel = try await fetchMlogUrlDetail(id: "a1A2PV3VDaT1YwX")
//            print(mlogUrlDetail)
//        } catch {
//            print(error)
//        }
        
//        do {
//            let anonimousLogin: NRAnonimousModel = try await anonimousLogin()
//            print(anonimousLogin)
//        } catch {
//            print(error)
//        }
        
        do {
            let newLyric: NRLyricModel = try await fetchNewLyric(id: 29814898)
            print(newLyric)
        } catch {
            print(error)
        }
    }
    
    
}
