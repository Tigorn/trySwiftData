//
//  LunchSessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct LunchSessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(session: Session) {
        if session.type == .lunch {
            self.session = session
            self.dataDefaults = SessionDataDefaults(session: session)
        } else {
            return nil
        }
    }
    
    var title: String {
        return "Lunch".localized()
    }
    
    var subtitle: String {
        return dataDefaults.subtitle
    }
    
    var logoURL: URL {
        return dataDefaults.imageURL ?? dataDefaults.logoImageURL
    }
    
    var location: String {
        return dataDefaults.location
    }
    
    var sessionDescription: String {
        return "❤️".localized()
    }
    
    var presentationSummary: String {
        return dataDefaults.summary
    }
    
    var selectable: Bool {
        return false
    }
    
    var twitter: String {
        return "@\(dataDefaults.twitter)"
    }
}