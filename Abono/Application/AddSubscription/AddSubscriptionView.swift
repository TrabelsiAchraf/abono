//
//  AddSubscriptionView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/08/2022.
//

import SwiftUI

struct AddSubscriptionView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var nameTextField: String = ""
    @State private var amountTextField: String = ""
    @State private var subscriptionDate = Date()
    @State private var isNotificationOn: Bool = false
    
    private let reminds = [
        "The same day", "1 day before", "2 days before",
        "3 days before", "4 days before", "5 days before",
        "6 days before", "7 days before", "8 days before", "9 days before"
    ]
    @State private var selectedRemind = "The same day"
    
    private let categories = [
        "Entertainment", "Photo & Video",
        "E-Commerce", "Education",
        "Food & Drinks", "Music",
        "Transportation", "Games", "Other"
    ]
    @State private var selectedCategory = "Entertainment"
    
    private let billingCycles = [
        "Monthly", "Weekly", "Annual"
    ]
    @State private var selectedBillingCycle = "Monthly"
    
    
    var body: some View {
        NavigationView {
            Form(content: {
                Section {
                    TextField("Name", text: $nameTextField)
                    TextField("0", text: $amountTextField)
                        .keyboardType(.decimalPad)
                    
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Informations")
                }
                
                Section {
                    DatePicker(selection: $subscriptionDate, in: ...Date(),
                               displayedComponents: [.date]) {
                        Text("Payment date")
                    }
                    
                    Picker("Billing Cycle", selection: $selectedBillingCycle) {
                        ForEach(billingCycles, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Date Details")
                }
                
                Section {
                    Toggle(isOn: $isNotificationOn) {
                        Text("Custom Notifications")
                    }
                    Picker("Remind me", selection: $selectedRemind) {
                        ForEach(reminds, id: \.self) {
                            Text($0)
                        }
                    }
                    .disabled(!isNotificationOn)
                } header: {
                    Text("Notifications")
                }
            })
            .navigationTitle("New Subscription")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct AddSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddSubscriptionView()
            AddSubscriptionView()
                .preferredColorScheme(.dark)
        }
    }
}

