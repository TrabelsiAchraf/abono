//
//  AbonoApp.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

@main
struct AbonoApp: App {
    @AppStorage("isDarkMode") private var appearance: Appearance = .system
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("HOME")
                    }
                StatsView()
                    .tabItem {
                        Image(systemName: "plus.square.fill.on.square.fill")
                        Text("ADD")
                    }
                StatsView()
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                        Text("STATS")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("SETTINGS")
                    }
            }
            .preferredColorScheme(appearance.value)
        }
    }
}
