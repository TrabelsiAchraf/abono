//
//  DummyData.swift
//  Abono
//
//  Created by Achraf Trabelsi on 06/09/2022.
//

import Foundation

func getCoreDataSubs() -> [UpcomingSubscriptionDataView] {
    let subscriptions = PersistenceManager.shared.coreDataStack.fetchAll(entity: Subscription.self)
    var subs: [UpcomingSubscriptionDataView] = []
    subscriptions?.forEach { subscription in
        let sub = UpcomingSubscriptionModel(
            name: subscription.name ?? "",
            icon: subscription.icon ?? "",
            amount: "$\(subscription.amount) / mo",
            category: subscription.category ?? "",
            paymentDate: subscription.paymentDate ?? Date()
        ).map()
        subs.append(sub)
    }
    return subs
}

func saveDummySubscription() {
    let subcription = Subscription(context: PersistenceManager.shared.coreDataStack.managedContext)
    subcription.name = "Netflix"
    subcription.identifier = UUID()
    subcription.paymentDate = Date()
    subcription.icon = "netflix_ic"
    subcription.category = "Entertainment"
    subcription.amount = 13.9
    subcription.billingCycles = "Monthly"
    PersistenceManager.shared.coreDataStack.saveContext()
}
