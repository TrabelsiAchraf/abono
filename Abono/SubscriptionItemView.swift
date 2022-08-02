//
//  SubscriptionItemView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

struct SubscriptionItemView: View {
    let icon: String
    let name: String
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.medium2).bold()
                Text("30 September 2019")
                    .font(.caption)
                    .foregroundColor(Color.second)
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text("$5,99 / mo")
                .font(.medium2).bold()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.second)
        )
        .background(Color.card)
    }
}

struct SubscriptionItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SubscriptionItemView(icon: "netflix_ic", name: "Netflix")
                .previewLayout(.sizeThatFits)
            .padding()
            SubscriptionItemView(icon: "netflix_ic", name: "Netflix")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
