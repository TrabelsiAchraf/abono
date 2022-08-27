//
//  AlreadyPaidFeature.swift
//  Abono
//
//  Created by Achraf Trabelsi on 26/08/2022.
//

import ComposableArchitecture

struct AlreadyPaidState: Equatable {
    var alreadyPaid: AlreadyPaidDataView
}

enum AlreadyPaidAction: Equatable {
    case onAppear
    case dataLoaded(Result<AlreadyPaidDataView, APIError>)
}

struct AlreadyPaidEnvironment {
    var alreadyPaidRequest: (JSONDecoder) -> Effect<AlreadyPaidDataView, APIError>
}

let alreadyPaidReducer = Reducer<
    AlreadyPaidState,
    AlreadyPaidAction,
    SystemEnvironment<AlreadyPaidEnvironment>
> { state, action, environment in
    switch action {
    case .onAppear:
        return environment.alreadyPaidRequest(environment.decoder())
            .receive(on: environment.mainQueue())
            .catchToEffect()
            .map(AlreadyPaidAction.dataLoaded)
    case let .dataLoaded(result):
        switch result {
        case .success(let alreadyPaid):
            state.alreadyPaid = alreadyPaid
        case .failure(let error):
            break
        }
        return .none
    }
}
