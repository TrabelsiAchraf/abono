//
//  UpcomingSubscriptionsView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI

struct UpcomingSubscriptionsView: View {
    
    struct Subscription {
        let id = UUID()
        let name: String
        let icon: String
        let amount: String
        let daysLeft: (progressValue: Float, progressColor: Color, text: String)
    }
    let subs: [Subscription] = [Subscription(name: "Netflix", icon: "netflix_ic", amount: "$13,99 / mo",
                                             daysLeft: (progressValue: 0.85, progressColor: .blue, text: "28")),
                                Subscription(name: "Uber Eat", icon: "uber_eat_ic", amount: "$3,99 / mo",
                                             daysLeft: (progressValue: 0.25, progressColor: .red, text: "8")),
                                Subscription(name: "Amazon Prime", icon: "prime_ic", amount: "$5,99 / mo",
                                             daysLeft: (progressValue: 0.50, progressColor: .yellow, text: "15"))]
    
    var subscriptionCardTapped: (Subscription) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("Upcoming")
                    .font(.medium2).bold()
                Spacer()
                NavigationLink {
//                    AllSubscriptionsView()
                } label: {
                    Text("See All")
                        .font(.medium1).bold()
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(subs, id: \.id) { subscription in
                        SubscriptionCardView(name: subscription.name,
                                             icon: subscription.icon,
                                             amount: subscription.amount,
                                             daysLeft: (progressValue: subscription.daysLeft.progressValue,
                                                        progressColor: subscription.daysLeft.progressColor,
                                                        text: subscription.daysLeft.text)
                        ).onTapGesture {
                            subscriptionCardTapped(subscription)
                        }
                    }
                }
                .background(Color.defaultBackground)
            }
        }
    }
}

struct UpcomingSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingSubscriptionsView(subscriptionCardTapped: { subs in })
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

