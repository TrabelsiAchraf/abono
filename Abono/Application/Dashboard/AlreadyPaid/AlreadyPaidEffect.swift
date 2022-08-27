//
//  AlreadyPaidEffect.swift
//  Abono
//
//  Created by Achraf Trabelsi on 26/08/2022.
//

import ComposableArchitecture
import Firebase

func dummyAlreadyPaidEffect(decoder: JSONDecoder) -> Effect<AlreadyPaidDataView, APIError> {

//    let collection = Firestore.firestore().collection("Subscriptions")
//    let subscription = Subscriptions(
//        name: "Amazon Prime",
//        amount: "4.99"
//    )
//    
//    collection.addDocument(data: subscription.dictionary)
 
    let subs: [AlreadyPaidDataView.PaidSubscription] = [
        AlreadyPaidDataView.PaidSubscription(name: "Netflix", icon: "netflix_ic", paymentDate: "11 Janvier 2022", amount: "$12,99 / mo"),
        AlreadyPaidDataView.PaidSubscription(name: "Uber Eat", icon: "uber_eat_ic", paymentDate: "30 September 2022", amount: "$5,99 / mo")
    ]
    let dummyAlreadyPaid = AlreadyPaidDataView(currentValue: "23€ / 120€", paidSubscriptions: subs)
    return Effect(value: dummyAlreadyPaid)
}

struct Subscriptions: Decodable, Equatable {
    let name: String
    let amount: String
    var dictionary: [String: String] {
        ["name": name,
         "amount": amount
        ]
    }
}
