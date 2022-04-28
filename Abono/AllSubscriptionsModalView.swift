//
//  AllSubscriptionsModalView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

enum ModalStatus {
    case opened, closed
}

struct AllSubscriptionsModalView: View {
    
    @Binding var status: ModalStatus
    @State private var searchText = ""
    var sheetButtonTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("All Subscriptions")
                    .font(.title2).bold()
                Spacer()
                Button {
                    sheetButtonTapped()
                } label: {
                    Text(status == .opened ? "Close" : "See more")
                        .font(.title2).bold()
                    Image(systemName: status == .opened ? "arrow.down" : "arrow.up")
                }
            }
            
            TextField("Search for ...", text: $searchText)
                .font(.title2)
                .padding()
                .foregroundColor(.black)
                .background(Color(red: 240/255, green: 242/255, blue: 249/255, opacity: 1.0))
                .clipShape(Capsule())
            
            List {
                ForEach(0..<10) { _ in
                    SubscriptionItemView()
                        .padding(.vertical, 10)
                }
            }
            .listStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

struct AllSubscriptionsModalView_Previews: PreviewProvider {
    static var previews: some View {
        AllSubscriptionsModalView(status: .constant(.opened), sheetButtonTapped: {
            debugPrint("Sheet button tapped !")
        })
    }
}

