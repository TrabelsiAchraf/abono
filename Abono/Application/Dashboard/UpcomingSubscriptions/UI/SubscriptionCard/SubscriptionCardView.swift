//
//  SubscriptionCardView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI

struct SubscriptionCardView: View {
    
    let name: String
    let icon: String
    let amount: String
    let category: String
    let daysLeft: (progressValue: Float, progressColor: Color, text: String)
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .cornerRadius(10)
                Text(amount)
                    .font(.medium2).bold()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.medium2).bold()
                    Text(category)
                        .font(.caption)
                        .foregroundColor(Color.second)
                }
                Spacer()
            }
            
            HStack {
                ProgressCircleView(progress: daysLeft.progressValue,
                                   color: daysLeft.progressColor,
                                   text: daysLeft.text)
                Text("days left")
                    .font(.small).bold()
                Spacer()
            }
        }
        .padding()
        .background(Color.card)
        .cornerRadius(30)
    }
}

struct SubscriptionCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SubscriptionCardView(name: "Netflix",
                                 icon: "netflix_ic",
                                 amount: "$5,99 / mo",
                                 category: "Entertainment",
                                 daysLeft: (progressValue: 0.85, progressColor: .blue, text: "28"))
                .previewLayout(.sizeThatFits)
            .padding()
            SubscriptionCardView(name: "Netflix",
                                 icon: "netflix_ic",
                                 amount: "$5,99 / mo",
                                 category: "Entertainment",
                                 daysLeft: (progressValue: 0.85, progressColor: .blue, text: "28"))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}

