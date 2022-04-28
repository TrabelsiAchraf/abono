//
//  UpcomingSubscriptionsView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

struct UpcomingSubscriptionsView: View {
    
    var gridItems: [GridItem] = [GridItem()]
    
    var body: some View {
        VStack {
            HStack {
                Text("Upcoming")
                    .font(.title3).bold()
                Spacer()
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItems, alignment: .center, spacing: 20) {
                    ForEach((1...4), id: \.self) { number in
                        SubscriptionCardView()
                    }
                }
                .background(Color(red: 240/255, green: 242/255, blue: 249/255, opacity: 1.0))
            }
            .frame(minHeight: 100, maxHeight: .infinity)
        }
    }
}

struct UpcomingSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingSubscriptionsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
