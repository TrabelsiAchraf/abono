//
//  ContactUsView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 21/07/2022.
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
    @State private var feedbackSelection: [Bool] = [false, false, false, false, false]
    
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
                    
                    VStack {
                        Text("How to you feel ? (Optional)")
                        HStack {
                            EmojyButtonView(state: .veryHappy, isOn: $feedbackSelection[0], select: resetFeedBack)
                            EmojyButtonView(state: .happy, isOn: $feedbackSelection[1], select: resetFeedBack)
                            EmojyButtonView(state: .unsatisfied, isOn: $feedbackSelection[2], select: resetFeedBack)
                            EmojyButtonView(state: .unhappy, isOn: $feedbackSelection[3], select: resetFeedBack)
                            EmojyButtonView(state: .angry, isOn: $feedbackSelection[4], select: resetFeedBack)
                        }
                        .padding(.bottom, 10)
                        .padding(.top, 10)
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
    
    func resetFeedBack() {
        feedbackSelection = [false, false, false, false, false]
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

