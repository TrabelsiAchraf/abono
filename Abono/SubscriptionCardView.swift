//
//  SubscriptionCardView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

struct SubscriptionCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image("netflix_ic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text("$5,99 / mo")
                    .font(.system(size: 20)).bold()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Netflix")
                        .font(.title2).bold()
                    Text("Entertainment")
                        .font(.title2)
                        .foregroundColor(Color(red: 196/255, green: 206/255, blue: 230/255, opacity: 1.0))
                }
                Spacer()
            }
            
            HStack {
                Text("days keft")
                    .bold()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
    }
}

struct SubscriptionCardView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionCardView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
