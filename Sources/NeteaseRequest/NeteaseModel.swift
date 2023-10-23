import Foundation

public enum NRSingerType: Int {
    case allSinger = -1 // 全部
    case male = 1 // 男歌手
    case female = 2 // 女歌手
    case band = 3 // 乐队
}

public enum NRAreaType: Int {
    case allArea = -1 // 全部
    case other = 0 // 其他
    case chinese = 7 // 华语
    case japanese = 8 // 日本
    case korean = 16 // 韩国
    case western = 96 // 欧美
}

public enum NROrder: String {
    ///热门
    case hot = "hot"
    ///时间
    case time = "time"
    
}

public enum NRSongLevel: String, Codable {
    ///标准
    case standard = "standard"
    ///较高
    case higher = "higher"
    ///极高
    case exhigh = "exhigh"
    ///无损
    case lossless = "lossless"
    ///Hi-Res
    case hires = "hires"
    ///高清环绕声
    case jyeffect = "jyeffect"
    ///沉浸环绕声
    case sky = "sky"
    ///超清母带
    case jymaster = "jymaster"
    
}


public enum NRFee: Int, Codable {
    ///免费或无版权
    case free = 0
    ///VIP 歌曲
    case vip = 1
    ///购买专辑
    case buyAlbum = 4
    
    ///非会员可免费播放低音质，会员可播放高音质及下载
    case notVip = 8
}

public enum NROriginCoverType: Int, Codable {
    ///未知
    case unowned = 0
    ///原唱
    case origin = 1
    ///翻唱
    case cover = 2
}

public enum NRBannerTargetType: Int, Codable {
    ///歌曲
    case song = 1
    ///专辑
    case album = 10
    ///其它
    case other = 3000
}


public struct NRQRKeyModel: Codable {
    public var code: Int
    public var unikey: String
    public init(code: Int, unikey: String) {
        self.code = code
        self.unikey = unikey
    }
}

public struct NRQRCodeModel:Codable {
    public var qrurl: String
    public var qrimg: String
}

public struct NRQRCodeCheckModel:Codable {
    public var code: Int
    public var message: String?
    public var cookie: String?
    public init(code: Int, message: String? = nil, cookie: String? = nil) {
        self.code = code
        self.message = message
        self.cookie = cookie
    }
}

public struct CellPhoneModel: Codable {
    public var loginType: Int
    public var account: AccountModel
    public var token: String
    public var cookie: String
    
    
    public struct AccountModel: Codable {
        public var id: Int
        public var userName: String
        public var status: Int
        public var vipType: Int
        
        public init(id: Int, userName: String, status: Int, vipType: Int) {
            self.id = id
            self.userName = userName
            self.status = status
            self.vipType = vipType
        }
    }
    
    public init(loginType: Int, account: AccountModel, token: String, cookie: String) {
        self.loginType = loginType
        self.account = account
        self.token = token
        self.cookie = cookie
    }
    
}


public struct NRProfileModel: Codable {
    public var userId: Int
    public var userType: Int
    public var nickname: String
    public var avatarImgId: Int
    public var avatarUrl: String
    public var backgroundUrl: String?
    public var birthday: TimeInterval?
    public var gender: Int
    public var vipType: Int
    public var signature: String?
    public var followeds: Int?
    public var follows: Int?
   
    public var birthd: String {
        let date = Date(timeIntervalSince1970: (birthday ?? TimeInterval()) / 1000)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        return dateformatter.string(from: date)
    }
    
    public init(userId: Int, userType: Int, nickname: String, avatarImgId: Int, avatarUrl: String, backgroundUrl: String? = nil, birthday: TimeInterval? = nil, gender: Int, vipType: Int, signature: String? = nil, followeds: Int? = nil, follows: Int? = nil) {
        self.userId = userId
        self.userType = userType
        self.nickname = nickname
        self.avatarImgId = avatarImgId
        self.avatarUrl = avatarUrl
        self.backgroundUrl = backgroundUrl
        self.birthday = birthday
        self.gender = gender
        self.vipType = vipType
        self.signature = signature
        self.followeds = followeds
        self.follows = follows
    }
    
}

public struct NRUserSubcountModel: Codable {
    public var programCount: Int
    public var djRadioCount: Int
    public var mvCount: Int
    public var artistCount: Int
    public var newProgramCount: Int
    public var createDjRadioCount: Int
    public var createdPlaylistCount: Int
    public var subPlaylistCount: Int
    
    public init(programCount: Int, djRadioCount: Int, mvCount: Int, artistCount: Int, newProgramCount: Int, createDjRadioCount: Int, createdPlaylistCount: Int, subPlaylistCount: Int) {
        self.programCount = programCount
        self.djRadioCount = djRadioCount
        self.mvCount = mvCount
        self.artistCount = artistCount
        self.newProgramCount = newProgramCount
        self.createDjRadioCount = createDjRadioCount
        self.createdPlaylistCount = createdPlaylistCount
        self.subPlaylistCount = subPlaylistCount
    }
}


public struct NRUserLevelInfoModel: Codable {
    public var userId: Int
    public var info: String
    public var progress: Int
    public var nextPlayCount: Int
    public var nextLoginCount: Int
    public var nowPlayCount: Int
    public var nowLoginCount: Int
    public var level: Int
    
    public init(userId: Int, info: String, progress: Int, nextPlayCount: Int, nextLoginCount: Int, nowPlayCount: Int, nowLoginCount: Int, level: Int) {
        self.userId = userId
        self.info = info
        self.progress = progress
        self.nextPlayCount = nextPlayCount
        self.nextLoginCount = nextLoginCount
        self.nowPlayCount = nowPlayCount
        self.nowLoginCount = nowLoginCount
        self.level = level
    }
}

public struct NRUserFollowsModel: Codable {
    public var py: String
    public var time: Int
    public var userType: Int
    public var nickname: String?
    public var followed: Bool
    public var userId: Int
    public var mutual: Bool
    public var follows: Int
    public var followeds: Int
    public var remarkName: String?
    public var avatarUrl: String?
    public var signature: String?
    
    public init(py: String, time: Int, userType: Int, nickname: String? = nil, followed: Bool, userId: Int, mutual: Bool, follows: Int, followeds: Int, remarkName: String? = nil, avatarUrl: String? = nil, signature: String? = nil) {
        self.py = py
        self.time = time
        self.userType = userType
        self.nickname = nickname
        self.followed = followed
        self.userId = userId
        self.mutual = mutual
        self.follows = follows
        self.followeds = followeds
        self.remarkName = remarkName
        self.avatarUrl = avatarUrl
        self.signature = signature
    }
}


public struct NRSingerInfoModel: Codable {
    public var info: String
    public var id: Int
    public var name: String
    public var albumSize: Int?
    public var mvSize: Int?
    public var picUrl: String
    
    public init(info: String, id: Int, name: String, albumSize: Int? = nil, mvSize: Int? = nil, picUrl: String) {
        self.info = info
        self.id = id
        self.name = name
        self.albumSize = albumSize
        self.mvSize = mvSize
        self.picUrl = picUrl
    }
}

public struct NRArtistModel: Codable {
    public var accountId: Int?
    public var albumSize: Int?
    public var briefDesc: String?
    public var fansCount: Int?
    public var followed: Bool?
    public var id: Int
    public var img1v1Url: String?
    public var name: String
    public var musicSize: Int?
    public var picUrl: String?
    public var trans: String?
    public var cover: String?
    public var avatar: String?
    
    public init(accountId: Int? = nil, albumSize: Int? = nil, briefDesc: String? = nil, fansCount: Int? = nil, followed: Bool? = nil, id: Int, img1v1Url: String? = nil, name: String, musicSize: Int? = nil, picUrl: String? = nil, trans: String? = nil, cover: String? = nil, avatar: String? = nil) {
        self.accountId = accountId
        self.albumSize = albumSize
        self.briefDesc = briefDesc
        self.fansCount = fansCount
        self.followed = followed
        self.id = id
        self.img1v1Url = img1v1Url
        self.name = name
        self.musicSize = musicSize
        self.picUrl = picUrl
        self.trans = trans
        self.cover = cover
        self.avatar = avatar
    }
    
}

public struct NRAudioQualityModel: Codable {
    public var br: Int
    public var fid: Int
    public var size: Int
    public var sr: Int?
    public init(br: Int, fid: Int, size: Int, sr: Int? = nil) {
        self.br = br
        self.fid = fid
        self.size = size
        self.sr = sr
    }
}

public struct NRSongModel: Codable {
    public var name: String
    public var id: Int
    public var publishTime: TimeInterval?
    public var level: NRSongLevel?
    public var al: NRAlModel?
    public var ar: [NRArModel]?
    public var fee: NRFee?
    public var originCoverType: NROriginCoverType?
    public var dt: Int?
    public var tns: [String]?
    /// 无损质量文件信息
    public var sq: NRAudioQualityModel?
    /// 高质量文件信息
    public var h: NRAudioQualityModel?
    /// 中质量文件信息
    public var m: NRAudioQualityModel?
    /// 低质量文件信息
    public var l: NRAudioQualityModel?
    
    public init(name: String, id: Int, publishTime: TimeInterval? = nil, level: NRSongLevel? = nil, al: NRAlModel? = nil, ar: [NRArModel]? = nil, fee: NRFee? = nil, originCoverType: NROriginCoverType? = nil, dt: Int? = nil, tns: [String]? = nil, sq: NRAudioQualityModel? = nil, h: NRAudioQualityModel? = nil, m: NRAudioQualityModel? = nil, l: NRAudioQualityModel? = nil) {
        self.name = name
        self.id = id
        self.publishTime = publishTime
        self.level = level
        self.al = al
        self.ar = ar
        self.fee = fee
        self.originCoverType = originCoverType
        self.dt = dt
        self.tns = tns
        self.sq = sq
        self.h = h
        self.m = m
        self.l = l
    }
}

public struct NRArModel: Codable {
    public var name: String?
    public var id: Int?
    public init(name: String? = nil, id: Int? = nil) {
        self.name = name
        self.id = id
    }
}

public struct NRAlModel: Codable {
    public var name: String
    public var id: Int
    public var picUrl: String?
    public init(name: String, id: Int, picUrl: String) {
        self.name = name
        self.id = id
        self.picUrl = picUrl
    }
}

public struct NRAudioUrlModel: Codable {
    public var id: Int
    public var url: String?
    public var size: Int
    public var expi: Int
    public var time: Int
    public var type: String?
    public var level: String?
    public var levelName: String {
        switch level {
        case "standard":
            return "标准"
        case "higher":
            return "较高"
        case "exhigh":
            return "极高"
        case "lossless":
            return "无损"
        case "hires":
            return "Hi-Res"
        case "jymaster":
            return "超清母带"
        default:
            return ""
        }
    }
    
    public init(id: Int, url: String? = nil, size: Int, expi: Int, time: Int, type: String? = nil, level: String? = nil) {
        self.id = id
        self.url = url
        self.size = size
        self.expi = expi
        self.time = time
        self.type = type
        self.level = level
    }
}

public struct NRCatModel: Codable {
    public var all: NRCatInfoModel
    public var sub: [NRCatInfoModel]
    public var categories: [String: String]
    
    public init(all: NRCatInfoModel, sub: [NRCatInfoModel], categories: [String : String]) {
        self.all = all
        self.sub = sub
        self.categories = categories
    }
}

public struct NRCatInfoModel: Codable {
    public var name: String
    public var resourceCount: Int?
    public var type: Int
    public var category: Int
    
    public init(name: String, resourceCount: Int, type: Int, category: Int) {
        self.name = name
        self.resourceCount = resourceCount
        self.type = type
        self.category = category
    }
}


public struct NRPlayListModel: Codable {
    public var name: String
    public var id: Int
    public var description: String?
    public var coverImgUrl: String?
    public var userId: Int?
    
    public init(name: String, id: Int, description: String? = nil, coverImgUrl: String? = nil, userId: Int? = nil) {
        self.name = name
        self.id = id
        self.description = description
        self.coverImgUrl = coverImgUrl
        self.userId = userId
    }
}

public struct NRRecommendPlayListModel: Codable {
    public var name: String
    public var id: Int
    public var description: String?
    public var picUrl: String?
    public var userId: Int?
    public var creator: NRPlayListCreator?
    public var copywriter: String?
    
    public init(name: String, id: Int, description: String? = nil, picUrl: String? = nil, userId: Int? = nil, creator: NRPlayListCreator? = nil, copywriter: String? = nil) {
        self.name = name
        self.id = id
        self.description = description
        self.picUrl = picUrl
        self.userId = userId
        self.creator = creator
        self.copywriter = copywriter
    }
}

public struct NRPlayListCreator: Codable {
    var remarkName: String?
    var mutual: Bool
    var avatarUrl: String?
    var nickname: String?
    var signature: String?
    
    public init(remarkName: String? = nil, mutual: Bool, avatarUrl: String? = nil, nickname: String? = nil, signature: String? = nil) {
        self.remarkName = remarkName
        self.mutual = mutual
        self.avatarUrl = avatarUrl
        self.nickname = nickname
        self.signature = signature
    }
}

public struct NRPlayListDetailModel: Codable {
    public var id: Int
    public var name: String
    public var coverImgUrl: String
    public var userId: Int
    public var createTime: TimeInterval?
    public var playCount: Int
    public var description: String?
    public var subscribedCount: Int
    public var subscribed: Bool?
    public var trackNumberUpdateTime: TimeInterval?
    public var trackUpdateTime: TimeInterval?
    public var tags: [String]?
    
    public init(id: Int, name: String, coverImgUrl: String, userId: Int, createTime: TimeInterval? = nil, playCount: Int, description: String?, subscribedCount: Int, trackNumberUpdateTime: TimeInterval? = nil, trackUpdateTime: TimeInterval? = nil, tags: [String]? = nil, subscribed: Bool) {
        self.id = id
        self.name = name
        self.coverImgUrl = coverImgUrl
        self.userId = userId
        self.createTime = createTime
        self.playCount = playCount
        self.description = description
        self.subscribedCount = subscribedCount
        self.trackNumberUpdateTime = trackNumberUpdateTime
        self.trackUpdateTime = trackUpdateTime
        self.tags = tags
        self.subscribed = subscribed
    }
}


public struct NRCheckAudioModel: Codable {
    public var success: Bool
    public var message: String
    
    public init(success: Bool, message: String) {
        self.success = success
        self.message = message
    }
}

public struct NRLyricModel: Codable {
    public var version: Int
    public var lyric: String?
    
    public init(version: Int, lyric: String? = nil) {
        self.version = version
        self.lyric = lyric
    }
}

public struct NRDailySongModel: Codable {
    public var dailySongs: [NRSongModel]
    public var recommendReasons: [NRRecommendReasonModel]
    
    public init(dailySongs: [NRSongModel], recommendReasons: [NRRecommendReasonModel]) {
        self.dailySongs = dailySongs
        self.recommendReasons = recommendReasons
    }

    
}

public struct NRRecommendReasonModel: Codable {
    public var songId: Int
    public var reason: String
    public var reasonId: String
    public var targetUrl: String?
    
    public init(songId: Int, reason: String, reasonId: String, targetUrl: String? = nil) {
        self.songId = songId
        self.reason = reason
        self.reasonId = reasonId
        self.targetUrl = targetUrl
    }
}

public struct NRPersonalFMModel: Codable {
    public var name: String
    public var id: Int
    public var fee: NRFee?
    
    public init(name: String, id: Int, fee: NRFee? = nil) {
        self.name = name
        self.id = id
        self.fee = fee
    }
}

public struct NRNewSongModel: Codable {
    public var id: Int
    public var name: String
    public var picUrl: String
    public var type: Int
//    public let song: NRSongModel?
    
    public init(id: Int, name: String, picUrl: String, type: Int) {
        self.id = id
        self.name = name
        self.picUrl = picUrl
        self.type = type
    }
}

public struct NRBannerModel: Codable {
    public var pic: String
    public var targetId: Int?
    public var targetType: Int?
    public var typeTitle: String?
    public var url: String?
    public var titleColor: String?
    public var song: NRSongModel?
    
    public init(pic: String, targetId: Int?, targetType: Int?, typeTitle: String?, url: String?, titleColor: String?, song: NRSongModel?) {
        self.pic = pic
        self.targetId = targetId
        self.targetType = targetType
        self.typeTitle = typeTitle
        self.url = url
        self.titleColor = titleColor
        self.song = song
    }
}

public struct NRAlbumModel: Codable {
    public var picUrl: String?
    public var description: String?
    public var name: String?
    public var artists: [NRArtistModel]?
    public var id: Int?
    
    public init(picUrl: String? = nil, description: String? = nil, name: String? = nil, artists: [NRArtistModel]? = nil, id: Int? = nil) {
        self.picUrl = picUrl
        self.description = description
        self.name = name
        self.artists = artists
        self.id = id
    }
}

public struct NRAlbumDetailModel: Codable {
    public var songs: [NRSongModel]?
    public var album: NRAlbumModel?
    
    
    public init(songs: [NRSongModel], album: NRAlbumModel) {
        self.songs = songs
        self.album = album
    }
    
}

public struct NRDJCatelistModel: Codable {
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public struct NRDJRadioModel: Codable {
    public var dj: NRDJModel
    public var category: String?
    public var secondCategory: String?
    public var buyed: Bool?
    public var lastProgramName: String?
    public var picUrl: String
    public var programCount: Int
    public var subCount: Int?
    public var lastProgramId: Int?
    public var desc: String?
    public var name: String
    public var id: Int
    public var rcmdtext: String?
    
    public init(dj: NRDJModel, category: String? = nil, secondCategory: String? = nil, buyed: Bool? = nil, lastProgramName: String? = nil, picUrl: String, programCount: Int, subCount: Int? = nil, lastProgramId: Int? = nil, desc: String? = nil, name: String, id: Int, rcmdtext: String? = nil) {
        self.dj = dj
        self.category = category
        self.secondCategory = secondCategory
        self.buyed = buyed
        self.lastProgramName = lastProgramName
        self.picUrl = picUrl
        self.programCount = programCount
        self.subCount = subCount
        self.lastProgramId = lastProgramId
        self.desc = desc
        self.name = name
        self.id = id
        self.rcmdtext = rcmdtext
    }
}


public struct NRDJModel: Codable {
    public var avatarUrl: String
    public var birthday: TimeInterval?
    public var gender: Int
    public var birthd: String {
         let date = Date(timeIntervalSince1970: (birthday ?? TimeInterval()) / 1000)
         let dateformatter = DateFormatter()
         dateformatter.dateFormat = "yyyy-MM-dd"
         return dateformatter.string(from: date)
     }
    public var userId: Int
    public var userType: Int
    public var nickname: String
    public var signature: String
    public var backgroundUrl: String?
    
    public init(avatarUrl: String, birthday: TimeInterval? = nil, gender: Int, userId: Int, userType: Int, nickname: String, signature: String, backgroundUrl: String? = nil) {
        self.avatarUrl = avatarUrl
        self.birthday = birthday
        self.gender = gender
        self.userId = userId
        self.userType = userType
        self.nickname = nickname
        self.signature = signature
        self.backgroundUrl = backgroundUrl
    }
}

public struct NRDJProgramModel: Codable {
    public var id: Int
    public var type: Int
    public var name: String
    public var copywriter: String?
    public var picUrl: String?
    public var canDislike: Bool
    public var program: NRProgramModel
    public init(id: Int, type: Int, name: String, copywriter: String? = nil, picUrl: String? = nil, canDislike: Bool, program: NRProgramModel) {
        self.id = id
        self.type = type
        self.name = name
        self.copywriter = copywriter
        self.picUrl = picUrl
        self.canDislike = canDislike
        self.program = program
    }
    
}

public struct NRProgramModel: Codable {
    public var dj: NRDJModel
    public var radio: NRRadioModel
    public var duration: Int
    public var subscribedCount: Int
    public var reward: Bool
    public var mainTrackId: Int
    public var serialNum: Int
    public var listenerCount: Int
    public var name: String
    public var id: Int
    public var createTime: Int
    public var description: String?
    public var userId: Int?
    public var coverUrl: String?
    public init(dj: NRDJModel, radio: NRRadioModel, duration: Int, subscribedCount: Int, reward: Bool, mainTrackId: Int, serialNum: Int, listenerCount: Int, name: String, id: Int, createTime: Int, description: String? = nil, userId: Int? = nil, coverUrl: String? = nil) {
        self.dj = dj
        self.radio = radio
        self.duration = duration
        self.subscribedCount = subscribedCount
        self.reward = reward
        self.mainTrackId = mainTrackId
        self.serialNum = serialNum
        self.listenerCount = listenerCount
        self.name = name
        self.id = id
        self.createTime = createTime
        self.description = description
        self.userId = userId
        self.coverUrl = coverUrl
    }
    
}

public struct NRRadioModel: Codable {
    public var id: Int
    public var name: String
    public var picUrl: String
    public var desc: String?
    public var subCount: Int
    public var programCount: Int
    public var category: String?
    public var rcmdText: String?
    
    public init(id: Int, name: String, picUrl: String, desc: String? = nil, subCount: Int, programCount: Int, category: String? = nil, rcmdText: String? = nil) {
        self.id = id
        self.name = name
        self.picUrl = picUrl
        self.desc = desc
        self.subCount = subCount
        self.programCount = programCount
        self.category = category
        self.rcmdText = rcmdText
    }
}

public struct NRVideoModel: Codable {
    public var coverUrl: String?
    public var title: String?
    public var durationms: Int?
    public var duration: Int?
    public var vid: String?
    
    public init(coverUrl: String? = nil, title: String? = nil, durationms: Int? = nil, duration: Int? = nil, vid: String? = nil) {
        self.coverUrl = coverUrl
        self.title = title
        self.durationms = durationms
        self.duration = duration
        self.vid = vid
    }
}


public struct NRSearchModel: Codable {
    public var songs: [NRSongModel]?
    public var albums: [NRAlbumModel]?
    public var artists: [NRArtistModel]?
    public var playlists: [NRPlayListModel]?
    public var userprofiles: [NRProfileModel]?
    public var djRadios: [NRDJRadioModel]?
    public var mvs: [NRMVListModel]?
    public var videos: [NRVideoModel]?
    
    public init(songs: [NRSongModel]? = nil, albums: [NRAlbumModel]? = nil, artists: [NRArtistModel]? = nil, playlists: [NRPlayListModel]? = nil, userprofiles: [NRProfileModel]? = nil, djRadios: [NRDJRadioModel]? = nil) {
        self.songs = songs
        self.albums = albums
        self.artists = artists
        self.playlists = playlists
        self.userprofiles = userprofiles
        self.djRadios = djRadios
    }
}

public struct NRArtistIdentifyModel: Codable {
    public var imageUrl: String?
    public var imageDesc: String?
    public var actionUrl: String?
    
    public init(imageUrl: String? = nil, imageDesc: String? = nil, actionUrl: String? = nil) {
        self.imageUrl = imageUrl
        self.imageDesc = imageDesc
        self.actionUrl = actionUrl
    }
}

public struct NRArtistDetailModel: Codable {
    public var videoCount: Int
    public var identify: NRArtistIdentifyModel?
    public var artist: NRArtistModel?
    
    public init(videoCount: Int, identify: NRArtistIdentifyModel? = nil, artist: NRArtistModel? = nil) {
        self.videoCount = videoCount
        self.identify = identify
        self.artist = artist
    }
}

public struct NRMVListModel: Codable {
    public var id: Int
    public var name: String
    public var artistName: String
    public var cover: String?
    public var imgurl: String?
    public var imgurl16v9: String?
    public var artist: NRArtistModel?
    public var duration: Int
    public var playCount: Int
    public var publishTime: String?
    
    public init(id: Int, name: String, artistName: String, cover: String? = nil, imgurl: String? = nil, imgurl16v9: String? = nil, artist: NRArtistModel? = nil, duration: Int, playCount: Int, publishTime: String? = nil) {
        self.id = id
        self.name = name
        self.artistName = artistName
        self.cover = cover
        self.imgurl = imgurl
        self.imgurl16v9 = imgurl16v9
        self.artist = artist
        self.duration = duration
        self.playCount = playCount
        self.publishTime = publishTime
    }
}

public struct NRMVDetailModel: Codable {
    public var id: Int
    public var name: String
    public var artistId: Int
    public var artistName: String
    public var briefDesc: String?
    public var desc: String?
    public var cover: String
    public var playCount: Int
    public var duration: Int
    public var publishTime: String
    public var artists: [NRArtistModel]?
    
    public init(id: Int, name: String, artistId: Int, artistName: String, briefDesc: String? = nil, desc: String? = nil, cover: String, playCount: Int, duration: Int, publishTime: String, artists: [NRArtistModel]? = nil) {
        self.id = id
        self.name = name
        self.artistId = artistId
        self.artistName = artistName
        self.briefDesc = briefDesc
        self.desc = desc
        self.cover = cover
        self.playCount = playCount
        self.duration = duration
        self.publishTime = publishTime
        self.artists = artists
    }
    
}

public struct NRMVUrlModel: Codable {
    public var id: Int
    public var url: String?
    public var r: Int
    public var size: Int
    public var expi: Int
    public var msg: String?
    public init(id: Int, url: String, r: Int, size: Int, expi: Int, msg: String? = nil) {
        self.id = id
        self.url = url
        self.r = r
        self.size = size
        self.expi = expi
        self.msg = msg
    }
}

public struct NRArtistFansCountModel: Codable {
    public var isFollow: Bool
    public var fansCnt: Int
    public var followCnt: Int
    public var follow: Bool
    
    public init(isFollow: Bool, fansCnt: Int, followCnt: Int, follow: Bool) {
        self.isFollow = isFollow
        self.fansCnt = fansCnt
        self.followCnt = followCnt
        self.follow = follow
    }
}

public struct NRRecentPlayModel<T: Codable>: Codable {
    public var total: Int
    public var list: [NRRencentResourceModel<T>]

    public init(total: Int, list: [NRRencentResourceModel<T>]) {
        self.total = total
        self.list = list
    }
}

public struct NRRencentResourceModel<T: Codable>: Codable{
    public var resourceId: String
    public var playTime: Int
    public var resourceType: String
    public var data: T

    public init(resourceId: String, playTime: Int, resourceType: String, data: T) {
        self.resourceId = resourceId
        self.playTime = playTime
        self.resourceType = resourceType
        self.data = data
    }
}


