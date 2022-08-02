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
                        .padding(.bottom, 10)
                    
                    AlreadyPaidView()
                        .padding(.horizontal, 20)
                }
            }
            .background(Color.defaultBackground)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HeaderView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
