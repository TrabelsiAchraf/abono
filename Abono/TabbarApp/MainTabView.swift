//
//  TabBarApp.swift
//  Abono
//
//  Created by Achraf Trabelsi on 02/08/2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .home
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            ContentView()
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
                return TabItemData(image: "house.fill", title: "Home")
            case .stats:
                return TabItemData(image: "chart.line.uptrend.xyaxis.circle.fill", title: "STATS")
            case .settings:
                return TabItemData(image: "gearshape.fill", title: "SETTINGS")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
        MainTabView()
            .preferredColorScheme(.dark)
    }
}
