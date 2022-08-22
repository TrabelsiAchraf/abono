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
            MainTabView()
                .preferredColorScheme(appearance.value)
        }
    }
}
