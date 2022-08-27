//
//  DashboardView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI
import ComposableArchitecture

struct DashboardView: View {
    
    let store: Store<DashboardState, DashboardAction>
    @State private var showingAddSubscriptionSheet = false
    
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
                    
                    UpcomingSubscriptionsView(
                        store: store.scope(
                            state:\.upcomingSubsState,
                            action: DashboardAction.upcomingSubscriptionAction
                        ), subscriptionCardTapped: { subscription in
                            showingAddSubscriptionSheet.toggle()
                        }
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    
                    AlreadyPaidView(
                        store: store.scope(
                            state: \.alreadyPaidState,
                            action: DashboardAction.alreadyPaidAction
                        )
                    )
                    .padding(.horizontal, 20)
                }
            }
            .background(Color.defaultBackground)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HeaderView(
                        addButtonTapped: {
                            showingAddSubscriptionSheet.toggle()
                        },
                        profilButtonTapped: {
                            
                        })
                    .sheet(isPresented: $showingAddSubscriptionSheet) {
                        AddSubscriptionView()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView(
                store: Store(
                    initialState: DashboardState(),
                    reducer: dashboardReducer,
                    environment: .dev(environment: DashboardEnvironment())
                )
            )
            DashboardView(
                store: Store(
                    initialState: DashboardState(),
                    reducer: dashboardReducer,
                    environment: .dev(environment: DashboardEnvironment())
                )
            )
            .preferredColorScheme(.dark)
        }
    }
}
