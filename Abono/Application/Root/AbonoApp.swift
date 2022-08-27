//
//  AbonoApp.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI
import ComposableArchitecture
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct AbonoApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
