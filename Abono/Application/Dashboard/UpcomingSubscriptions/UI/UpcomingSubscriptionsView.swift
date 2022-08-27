//
//  UpcomingSubscriptionsView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI
import ComposableArchitecture

struct UpcomingSubscriptionsView: View {
    
    let store: Store<UpcomingSubscriptionsState, UpcomingSubscriptionsAction>
    var subscriptionCardTapped: (UpcomingSubscriptionDataView) -> Void
    
    var body: some View {
        WithViewStore(store) { viewStore in
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
                        ForEach(viewStore.upcomingSubs, id: \.id) { subscription in
                            SubscriptionCardView(name: subscription.name,
                                                 icon: subscription.icon,
                                                 amount: subscription.amount,
                                                 category: subscription.category.rawValue,
                                                 daysLeft: (progressValue: 0.50,
                                                            progressColor: .red,
                                                            text: "15")
                            ).onTapGesture {
                                subscriptionCardTapped(subscription)
                            }
                        }
                    }
                    .background(Color.defaultBackground)
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct UpcomingSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingSubscriptionsView(
            store: Store(
                initialState: UpcomingSubscriptionsState(),
                reducer: upcomingSubsReducer,
                environment: .dev(
                    environment: UpcomingSubscriptionsEnvironment(
                        upcomingSubsRequest: dummyUpcomingSubsEffect
                    )
                )
            ),
            subscriptionCardTapped: { subs in }
        )
        .previewLayout(.fixed(width: 500.0, height: 250.0))
        .padding()
    }
}

