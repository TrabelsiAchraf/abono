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
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text("$5,99 / mo")
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
                ProgressCircleView(progress: .constant(0.8), color: .constant(.blue))
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
        SubscriptionCardView(name: "Netflix", icon: "netflix_ic")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
