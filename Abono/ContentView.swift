//
//  ContentView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    var gridItems: [GridItem] = [GridItem()]

    var body: some View {
        VStack {
            ZStack {
               Color(red: 240/255, green: 242/255, blue: 249/255, opacity: 1.0)
                
                VStack {
                    TopAmountSectionView(
                        firstAmount: .init(title: "Weekly", amount: "$0.00"),
                        secondAmount: .init(title: "Monthly", amount: "$5.99"),
                        thirdAmount: .init(title: "Yearly", amount: "$67.94")
                    )
                    .padding(.bottom, 30)
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: gridItems, alignment: .center, spacing: 20) {
                            ForEach((1...4), id: \.self) { number in
                                SubscriptionCardView()
                            }
                        }
                        .background(Color(red: 240/255, green: 242/255, blue: 249/255, opacity: 1.0))
                    }
                    .padding(.horizontal, 10)
                }
            }
            .ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(.white)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
