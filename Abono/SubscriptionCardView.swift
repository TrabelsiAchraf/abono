//
//  SubscriptionCardView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

struct SubscriptionCardView: View {
    
    let name: String
    let icon: String
    let amount: String
    let daysLeft: (progressValue: Float, progressColor: Color, text: String)
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text(amount)
                    .font(.system(size: 18)).bold()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 16)).bold()
                    Text("Entertainment")
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
                    .font(.system(size: 12)).bold()
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
    }
}

struct SubscriptionCardView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionCardView(name: "Netflix",
                             icon: "netflix_ic",
                             amount: "$5,99 / mo",
                             daysLeft: (progressValue: 0.85, progressColor: .blue, text: "28"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
