//
//  PartySessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct PartySessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(_ session: Session) {
        if session.type == .party {
            self.session = session
            self.dataDefaults = SessionDataDefaults(session: session)
        } else {
            return nil
        }
    }
    
    var title: String {
        return dataDefaults.title
    }
    
    var subtitle: String {
        return dataDefaults.subtitle
    }
    
    var logoURL: URL {
        return dataDefaults.imageURL ?? dataDefaults.logoImageURL
    }
    
    var location: String {
        return session.venue!.localizedTitle
    }
    
    var sessionDescription: String {
        return "🎉🎉🎉".localized()
    }
    
    var presentationSummary: String {
        return dataDefaults.summary
    }
    
    
    var selectable: Bool {
        return true
    }
    
    var twitter: String {
        return "@\(dataDefaults.twitter)"
    }
}
