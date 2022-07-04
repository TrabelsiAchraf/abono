//
//  UpcomingSubscriptionsView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

struct UpcomingSubscriptionsView: View {
    
    struct Subscription {
        let id = UUID()
        let name: String
        let icon: String
    }
    let subs: [Subscription] = [Subscription(name: "Netflix", icon: "netflix_ic"),
                                Subscription(name: "Uber Eat", icon: "uber_eat_ic"),
                                Subscription(name: "Netflix", icon: "netflix_ic")]
    
    var body: some View {
        VStack {
            HStack {
                Text("Upcoming")
                    .font(.system(size: 16)).bold()
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(subs, id: \.id) { subscription in
                        SubscriptionCardView(name: subscription.name, icon: subscription.icon)
                    }
                }
                .background(Color(red: 240/255, green: 242/255, blue: 249/255, opacity: 1.0))
            }
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
