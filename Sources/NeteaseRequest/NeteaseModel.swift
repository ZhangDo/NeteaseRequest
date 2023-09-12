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
   public var backgroundUrl: String
   public var birthday: TimeInterval?
   public var gender: Int
   public var vipType: Int
   
   public var birthd: String {
        let date = Date(timeIntervalSince1970: (birthday ?? TimeInterval()) / 1000)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        return dateformatter.string(from: date)
    }
    
    public init(userId: Int, userType: Int, nickname: String, avatarImgId: Int, avatarUrl: String, backgroundUrl: String, birthday: TimeInterval? = nil, gender: Int, vipType: Int) {
        self.userId = userId
        self.userType = userType
        self.nickname = nickname
        self.avatarImgId = avatarImgId
        self.avatarUrl = avatarUrl
        self.backgroundUrl = backgroundUrl
        self.birthday = birthday
        self.gender = gender
        self.vipType = vipType
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
    public var albumSize: Int
    public var briefDesc: String
    public var fansCount: Int
    public var followed: Bool
    public var id: Int
    public var img1v1Url: String?
    public var name: String
    public var musicSize: Int
    public var picUrl: String?
    public var trans: String?
    
    public init(accountId: Int?, albumSize: Int, briefDesc: String, fansCount: Int, followed: Bool, id: Int, img1v1Url: String?, name: String, musicSize: Int, picUrl: String?, trans: String?) {
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
    }
}

public struct NRSongModel: Codable {
    public var name: String
    public var id: Int
    public var publishTime: TimeInterval?
    public var level: NRSongLevel?
    public var al: NRAlModel
    
    
    public init(name: String, id: Int, publishTime: TimeInterval? = nil, level: NRSongLevel? = nil, al: NRAlModel) {
        self.name = name
        self.id = id
        self.publishTime = publishTime
        self.level = level
        self.al = al
    }
}

public struct NRAlModel: Codable {
    public var name: String
    public var id: Int
    public var picUrl: String
}

public struct NRAudioUrlModel: Codable {
    public var id: Int
    public var url: String?
    public var size: Int
    public var expi: Int
    public var time: Int
    public var type: String?
    
    public init(id: Int, url: String, size: Int, expi: Int, time: Int, type: String) {
        self.id = id
        self.url = url
        self.size = size
        self.expi = expi
        self.time = time
        self.type = type
    }
}

public struct NRCatModel: Codable {
    public var all: NRCatInfoModel
    public var sub: [NRCatInfoModel]
    public var categories: [String: String]
    
    
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

public struct NRPlayListDetailModel: Codable {
    public var id: Int
    public var name: String
    public var coverImgUrl: String
    public var userId: Int
    public var createTime: TimeInterval?
    public var playCount: Int
    public var description: String
    public var subscribedCount: Int
    public var trackNumberUpdateTime: TimeInterval?
    public var trackUpdateTime: TimeInterval?
    public var tags: [String]?
    
    public init(id: Int, name: String, coverImgUrl: String, userId: Int, createTime: TimeInterval? = nil, playCount: Int, description: String, subscribedCount: Int, trackNumberUpdateTime: TimeInterval? = nil, trackUpdateTime: TimeInterval? = nil, tags: [String]? = nil) {
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
