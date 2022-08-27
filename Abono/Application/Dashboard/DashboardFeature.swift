//
//  DashboardFeature.swift
//  Abono
//
//  Created by Achraf Trabelsi on 25/08/2022.
//

import ComposableArchitecture

struct DashboardState {
    var upcomingSubsState = UpcomingSubscriptionsState()
    var alreadyPaidState = AlreadyPaidState(alreadyPaid: AlreadyPaidDataView(alreadyPaidValue: "", progressValue: 0.0, paidSubscriptions: []))
}

enum DashboardAction {
    case upcomingSubscriptionAction(UpcomingSubscriptionsAction)
    case alreadyPaidAction(AlreadyPaidAction)
}

struct DashboardEnvironment { }

let dashboardReducer = Reducer<
    DashboardState,
    DashboardAction,
    SystemEnvironment<DashboardEnvironment>
>.combine(
    upcomingSubsReducer.pullback(
        state: \.upcomingSubsState,
        action: /DashboardAction.upcomingSubscriptionAction,
        environment: { _ in .live(environment: UpcomingSubscriptionsEnvironment(upcomingSubsRequest: dummyUpcomingSubsEffect)) }
    ),
    alreadyPaidReducer.pullback(
        state: \.alreadyPaidState,
        action: /DashboardAction.alreadyPaidAction,
        environment: { _ in .live(environment: AlreadyPaidEnvironment(alreadyPaidRequest: dummyAlreadyPaidEffect)) }
    )
)
