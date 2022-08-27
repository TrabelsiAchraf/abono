//
//  UpcomingSubsFeature.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import ComposableArchitecture

struct UpcomingSubscriptionsState: Equatable {
    var upcomingSubs: [UpcomingSubscriptionDataView] = []
}

enum UpcomingSubscriptionsAction: Equatable {
    case onAppear
    case dataLoaded(Result<[UpcomingSubscriptionDataView], APIError>)
}

struct UpcomingSubscriptionsEnvironment {
    var upcomingSubsRequest: (JSONDecoder) -> Effect<[UpcomingSubscriptionDataView], APIError>
}

let upcomingSubsReducer = Reducer<
    UpcomingSubscriptionsState,
    UpcomingSubscriptionsAction,
    SystemEnvironment<UpcomingSubscriptionsEnvironment>
> { state, action, environment in
    switch action {
    case .onAppear:
        return environment.upcomingSubsRequest(environment.decoder())
            .receive(on: environment.mainQueue())
            .catchToEffect()
            .map(UpcomingSubscriptionsAction.dataLoaded)
    case let .dataLoaded(result):
        switch result {
        case .success(let upcomingSubs):
            state.upcomingSubs = upcomingSubs
        case .failure(let error):
            break
        }
        return .none
    }
}
