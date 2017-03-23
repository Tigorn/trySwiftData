//
//  Session.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import RealmSwift
import Foundation

public class Session: Object {
    /** The type of content in this particular session */
    open dynamic var type: SessionType = .talk

    /** The title of this session (if not provided by any child objects) */
    open dynamic var title: String?

    /** The Japanese title of this session (if not provided by any child objects) */
    open dynamic var titleJP: String?

    /** For special cases, the name of the image to show for this session. */
    open dynamic var imageAssetName: String?

    /** For special cases, the name of the image to show for this session. */
    open dynamic var imageWebURL: String?

    /** A sponsor, if any, responsible for this session. */
    open dynamic var sponsor: Sponsor?

    /** The presentation information if this session is a talk. */
    open dynamic var presentation: Presentation?

    /** The specific room this session will be held */
    open dynamic var location: Location?

    /** A special type of event occuring during the conference */
    open dynamic var event: Event?

    /** Any particular events held at a different venue from the conference */
    open dynamic var venue: Venue?

    open let sessionBlock = LinkingObjects(fromType: SessionBlock.self, property: "sessions")

    /***************************************************/

    public static var all: Results<Session>? {
        do {
            let realm = try Realm.trySwiftRealm()
            return realm.objects(Session.self)
        } catch {
            return nil
        }
    }
}

extension Session {
    
    @objc public enum SessionType: Int {
        case workshop
        case meetup
        case breakfast
        case announcement
        case talk
        case lightningTalk
        case sponsoredDemo
        case coffeeBreak
        case lunch
        case officeHours
        case party
    }
    
    var viewModel: SessionDisplayable {
        switch self.type {
        case .workshop:
            return WorkshopSessionViewModel(session: self)!
        case .meetup:
            return MeetupSessionViewModel(session: self)!
        case .breakfast:
            return BreakfastSessionViewModel(session: self)!
        case .announcement:
            return AnnouncementSessionViewModel(session: self)!
        case .talk:
            return TalkSessionViewModel(session: self)!
        case .lightningTalk:
            return LightningTalkSessionViewModel(session: self)!
        case .sponsoredDemo:
            return SponsoredDemoSessionViewModel(session: self)!
        case .coffeeBreak:
            return CoffeeBreakSessionViewModel(session: self)!
        case .lunch:
            return LunchSessionViewModel(session: self)!
        case .officeHours:
            return OfficeHoursSessionViewModel(session: self)!
        case .party:
            return PartySessionViewModel(session: self)!
        }
    }
}
