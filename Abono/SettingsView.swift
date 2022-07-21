//
//  SettingsView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 03/07/2022.
//

import SwiftUI

struct SettingsView: View {
    
    let currencies = ["EUR", "AUD", "INR", "TRY"]
    @State private var selectedCurrency = "EUR"
    
    let appearances = ["System", "Dark", "Light"]
    @State private var selectedAppearance = "System"
    
    @State private var isNotificationOn: Bool = false
    let reminds = ["The same day", "1 day before", "2 days before",
                   "3 days before", "4 days before", "5 days before",
                   "6 days before", "7 days before", "8 days before", "9 days before"
    ]
    @State private var selectedRemind = "The same day"
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Default currency", selection: $selectedCurrency) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Appearance", selection: $selectedAppearance) {
                        ForEach(appearances, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("General")
                }
                
                Section {
                    Toggle(isOn: $isNotificationOn) {
                        Text("Receive Notifications")
                    }
                    Picker("Remind me", selection: $selectedRemind) {
                        ForEach(reminds, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Notifications")
                } footer: {
                    Text("Notifications can be received days before the payment date. This option will be used id the subscription does not have a notification set up")
                }
                
                Section {
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text("0.0.1(1)")
                    }
                    
                    HStack {
                        Text("Made with ❤️ by")
                        Button {
                            SocialMediaManager.showAdminTwitterProfile()
                        } label: {
                            Text("Achraf Trabelsi")
                        }
                    }
                    
                    NavigationLink("Terms & Privacy Policy") {
                        EmptyView()
                    }
                } header: {
                    Text("Information")
                }
                
                Section {
                    NavigationLink("Abono FAQ") {
                        EmptyView()
                    }
                    
                    NavigationLink("Contact Us") {
                        ContactUsView()
                    }
                } header: {
                    Text("Help")
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
