//
//  ContactUsView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/08/2022.
//

import SwiftUI

struct ContactUsView: View {
    
    @State private var showingAlert = false
    
    let helpReasons = ["I'd like to request a new feature",
                       "I have a question",
                       "I have feedback on the app",
                       "Something's not working",
                       "Something else"]
    @State private var selectedHelpReason = "EUR"
    
    @State private var tellUsTextField: String = ""
    @State private var isOn: Bool = false
    
    enum EmojyState: String {
        case veryHappy = "😁"
        case happy = "🙂"
        case unsatisfied = "😑"
        case unhappy = "😕"
        case angry = "😤"
    }
    
    private var feedbacks: [EmojyState] = [.angry, .unhappy, .unsatisfied, .happy, .veryHappy]
    @State private var selectedFeedback: EmojyState = .happy
    
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("How can we help ?", selection: $selectedHelpReason) {
                        ForEach(helpReasons, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Tell us what's going on", text: $tellUsTextField)
                    
                    Button {
                        
                    } label: {
                        Text("Have you read our FAQ yet ?")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("How to you feel ?")
                        Picker("How can we help ?", selection: $selectedFeedback) {
                            ForEach(feedbacks, id: \.self) {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 55, height: 55)
                                    .overlay(
                                        Text($0.rawValue)
                                            .font(.title)
                                    )
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                } header: {
                    Text("Contact Us")
                } footer: {
                    VStack {
                        Button {
                            showingAlert = true
                        } label: {
                            Text("Send me")
                                .frame(width: 150, height: 70)
                                .background(Color.progressView)
                                .foregroundColor(.white)
                                .font(.large.bold())
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                        }
                        .padding(.top, 30)
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                }
            }
        }
        .alert("Message sent", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactUsView()
            ContactUsView()
                .preferredColorScheme(.dark)
        }
    }
}

