//
//  UpcomingSubscriptionDataView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 26/08/2022.
//

import Foundation

struct UpcomingSubscriptionDataView: Equatable, Identifiable {
    var id = UUID()
    let name: String
    let icon: String
    let amount: String
    let category: SubscriptionCategory
}
