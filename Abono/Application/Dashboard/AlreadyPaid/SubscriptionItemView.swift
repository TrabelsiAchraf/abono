//
//  SubscriptionItemView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI

struct SubscriptionItemView: View {
    
    let icon: String
    let name: String
    let amount: String
    let paymentDate: String
    
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
                Text(paymentDate)
                    .font(.caption)
                    .foregroundColor(Color.second)
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text(amount)
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
            SubscriptionItemView(
                icon: "netflix_ic",
                name: "Netflix",
                amount: "$12,99 / mo",
                paymentDate: "11 Janvier 2022"
            )
            .previewLayout(.sizeThatFits)
            .padding()
            SubscriptionItemView(
                icon: "netflix_ic",
                name: "Netflix",
                amount: "$12,99 / mo",
                paymentDate: "11 Janvier 2022"
            )
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}

