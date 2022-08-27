//
//  AbonoApp.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct AbonoApp: App {
    
    @AppStorage("isDarkMode") private var appearance: Appearance = .system
    
    var body: some Scene {
        WindowGroup {
            MainTabView(
                store: Store(
                    initialState: RootState(),
                    reducer: rootReducer,
                    environment: .dev(environment: RootEnvironment())
                )
            )
            .preferredColorScheme(appearance.value)
        }
    }
}
