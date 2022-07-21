//
//  AllSubscriptionsModalView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

struct AllSubscriptionsView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Search for ...", text: $searchText)
                .font(.body)
                .padding()
                .foregroundColor(.black)
                .background(Color.defaultBackground)
                .clipShape(Capsule())
            
            ScrollView(showsIndicators: false) {
                ForEach(0..<10) { _ in
                    SubscriptionItemView(icon: "netflix_ic", name: "Netflix")
                        .padding(.vertical, 2)
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
        AllSubscriptionsView()
    }
}
