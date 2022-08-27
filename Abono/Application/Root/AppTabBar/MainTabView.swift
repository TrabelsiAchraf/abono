//
//  MainTabView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI
import ComposableArchitecture

struct MainTabView: View {
    
    @State private var selectedIndex: Int = 0
    let store: Store<RootState, RootAction>
    
    var body: some View {
        CustomTabView(tabs: TabType.allCases.map { $0.tabItem },
                      selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .home
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            DashboardView(
                store: store.scope(
                    state: \.dashboardState,
                    action: RootAction.dashboardAction)
            )
        case .stats:
            StatsView()
        case .settings:
            SettingsView()
        }
    }
    
    enum TabType: Int, CaseIterable {
        case home = 0
        case stats
        case settings
        
        var tabItem: TabItemData {
            switch self {
            case .home:
                return TabItemData(image: "house.fill")
            case .stats:
                return TabItemData(image: "chart.line.uptrend.xyaxis.circle.fill")
            case .settings:
                return TabItemData(image: "gearshape.fill")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(
            store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: .dev(environment: RootEnvironment())
            )
        )
        MainTabView(
            store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: .dev(environment: RootEnvironment())
            )
        )
        .preferredColorScheme(.dark)
    }
}
