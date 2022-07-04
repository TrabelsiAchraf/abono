//
//  ContentView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    TopAmountSectionView(
                        firstAmount: .init(title: "Weekly", amount: "$0.00"),
                        secondAmount: .init(title: "Monthly", amount: "$5.99"),
                        thirdAmount: .init(title: "Yearly", amount: "$67.94")
                    )
                    .padding(.vertical, 20)
                    
                    UpcomingSubscriptionsView()
                        .padding(.horizontal, 20)
                    
                    CurrentConsoView()
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                }
            }
            .background(Color(red: 240/255, green: 242/255, blue: 249/255, opacity: 1.0))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HeaderView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
