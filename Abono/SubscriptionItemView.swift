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
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 16)).bold()
                Text("30 September 2019")
                    .font(.caption)
                    .foregroundColor(Color(red: 196/255, green: 206/255, blue: 230/255, opacity: 1.0))
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text("$5,99 / mo")
                .font(.system(size: 18)).bold()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 196/255, green: 206/255, blue: 230/255, opacity: 1.0))
        )
        .background(.white)
    }
}

struct SubscriptionItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionItemView(icon: "netflix_ic", name: "Netflix")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
