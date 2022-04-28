//
//  SubscriptionItemView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

struct SubscriptionItemView: View {
    var body: some View {
        HStack {
            Image("netflix_ic")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Netflix")
                    .font(.title2).bold()
                Text("Entertainment")
                    .font(.caption)
                    .foregroundColor(Color(red: 196/255, green: 206/255, blue: 230/255, opacity: 1.0))
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text("$5,99 / mo")
                .font(.system(size: 20)).bold()
        }
    }
}

struct SubscriptionItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionItemView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
