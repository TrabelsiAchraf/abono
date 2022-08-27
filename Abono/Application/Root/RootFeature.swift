//
//  RootFeature.swift
//  Abono
//
//  Created by Achraf Trabelsi on 25/08/2022.
//

import ComposableArchitecture

struct RootState {
    var dashboardState = DashboardState()
}

enum RootAction {
    case dashboardAction(DashboardAction)
}

struct RootEnvironment { }

let rootReducer = Reducer<
    RootState,
    RootAction,
    SystemEnvironment<RootEnvironment>
>.combine(
    dashboardReducer.pullback(
        state: \.dashboardState,
        action: /RootAction.dashboardAction,
        environment: { _ in .live(environment: DashboardEnvironment())
        }
    )
)
