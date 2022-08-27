//
//  AlreadyPaidView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI
import ComposableArchitecture

struct AlreadyPaidView: View {
    
    let store: Store<AlreadyPaidState, AlreadyPaidAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                HStack {
                    Text("Already paid")
                        .font(.medium2).bold()
                    Spacer()
                    NavigationLink {
                        //                    AllSubscriptionsView()
                    } label: {
                        Text("See All")
                            .font(.medium1).bold()
                    }
                }
                
                VStack {
                    HStack {
                        ProgressBar(value: .constant(0.2))
                            .frame(height: 5)
                            .padding(.horizontal, 20)
                        VStack(alignment: .leading) {
                            Text(viewStore.alreadyPaid.currentValue)
                                .font(.large).bold()
                                .foregroundColor(.white)
                            Text("December")
                                .font(.caption).bold()
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.currentPaidHeader)
                    
                    VStack(spacing: 10) {
                        ForEach(viewStore.alreadyPaid.paidSubscriptions, id: \.id) { subscription in
                            SubscriptionItemView(
                                icon: subscription.icon,
                                name: subscription.name,
                                amount: subscription.amount,
                                paymentDate: subscription.paymentDate
                            )
                        }
                    }
                    .padding()
                }
                .background(Color.card)
                .cornerRadius(15)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct CurrentConsoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlreadyPaidView(
                store: Store(
                    initialState: AlreadyPaidState(
                        alreadyPaid: AlreadyPaidDataView(
                            currentValue: "",
                            paidSubscriptions: []
                        )
                    ),
                    reducer: alreadyPaidReducer,
                    environment: .dev(
                        environment: AlreadyPaidEnvironment(
                            alreadyPaidRequest: dummyAlreadyPaidEffect
                        )
                    )
                )
            )
            .previewLayout(.fixed(width: 500.0, height: 350.0))
            .padding()
            AlreadyPaidView(
                store: Store(
                    initialState: AlreadyPaidState(
                        alreadyPaid: AlreadyPaidDataView(
                            currentValue: "",
                            paidSubscriptions: []
                        )
                    ),
                    reducer: alreadyPaidReducer,
                    environment: .dev(
                        environment: AlreadyPaidEnvironment(
                            alreadyPaidRequest: dummyAlreadyPaidEffect
                        )
                    )
                )
            )
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 500.0, height: 350.0))
            .padding()
        }
    }
}

private struct ProgressBar: View {
    
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemTeal))
                
                Rectangle()
                    .frame(width: min(CGFloat(value)*geometry.size.width, geometry.size.width),
                           height: geometry.size.height)
                    .foregroundColor(.progressView)
            }
            .cornerRadius(45.0)
        }
    }
}

