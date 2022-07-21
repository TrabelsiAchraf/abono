//
//  SocialMediaManager.swift
//  Abono
//
//  Created by Achraf Trabelsi on 21/07/2022.
//

import UIKit

struct SocialMediaManager {
    static func showAdminTwitterProfile() {
        let twitterName = "twitter"
        let twitterDomain = "com"
        let adminUserName = "Tr_Achraf"
        
        let application = UIApplication.shared
        if let appURL = URL(string: "\(twitterName)://user? screen_name=\(adminUserName)"),
           application.canOpenURL(appURL) {
            application.open(appURL)
        } else if let webURL = URL(string: "https://\(twitterName).\(twitterDomain)/\(adminUserName)") {
            application.open(webURL)
        }
    }
}
