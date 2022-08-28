//
//  UpcomingSubscriptionDataView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 26/08/2022.
//

import SwiftUI

struct UpcomingSubscriptionDataView: Equatable, Identifiable {
    let id: UUID
    let name: String
    let icon: String
    let amount: String
    let category: SubscriptionCategory
    let leftDays: LeftDays
    
    struct LeftDays: Equatable {
        let progressValue: Float
        let progressColor: Color
        let text: String
    }
}
