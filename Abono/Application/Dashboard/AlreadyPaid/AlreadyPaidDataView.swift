//
//  AlreadyPaidMode;.swift
//  Abono
//
//  Created by Achraf Trabelsi on 26/08/2022.
//

import Foundation

struct AlreadyPaidDataView: Equatable, Identifiable {
    let id = UUID()
    let alreadyPaidValue: String
    var progressValue: Float
    let paidSubscriptions: [PaidSubscription]
    
    struct PaidSubscription: Equatable, Identifiable {
        let id = UUID()
        let name: String
        let icon: String
        let paymentDate: String
        let amount: String
    }
}
