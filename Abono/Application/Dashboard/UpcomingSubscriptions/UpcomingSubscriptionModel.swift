//
//  UpcomingSubscriptionModel.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import Foundation
import SwiftUI

struct UpcomingSubscriptionModel: Decodable, Equatable {
    let name: String
    let icon: String
    let amount: String
    let category: String
}

// MARK: - TDO

extension UpcomingSubscriptionModel {
    func map() -> UpcomingSubscriptionDataView {
        UpcomingSubscriptionDataView(id: UUID(), name: name, icon: icon, amount: amount, category: getCategory(from: category))
    }
    
    private func getCategory(from categoryStr: String) -> SubscriptionCategory {
        switch categoryStr {
        case "Entertainment":
            return .entertainment
        case "Photo":
            return .photo
        case "Video":
            return .video
        case "E-Commerce":
            return .eCommerce
        case "Education":
            return .education
        case "Food & Drinks":
            return .food
        case "Music":
            return .music
        case "Transportation":
            return .transportation
        case "Games":
            return .games
        default:
            return .other
        }
    }
}
