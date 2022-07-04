//
//  AbonoApp.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

@main
struct AbonoApp: App {
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
                        Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                        Text("STATS")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("SETTINGS")
                    }
            }
        }
    }
}
