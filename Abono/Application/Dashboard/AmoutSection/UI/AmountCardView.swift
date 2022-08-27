//
//  AmountCardView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI

struct AmountCardView: View {
    
    var title: String
    var amount: String
    var isEnabled: Bool = true
    
    var body: some View {
        VStack(spacing: 2) {
            Text(title)
                .font(.large)
            Text(amount)
                .font(.xlarge).bold()
        }
        .foregroundColor(isEnabled ? .amountTitle : .gray)
    }
}

struct AmountCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AmountCardView(title: "Weekly", amount: "$0.00")
                .previewLayout(.sizeThatFits)
                .padding()
            AmountCardView(title: "Weekly", amount: "$0.00")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
        
        Group {
            AmountCardView(title: "Weekly", amount: "$0.00", isEnabled: false)
                .previewLayout(.sizeThatFits)
                .padding()
            AmountCardView(title: "Weekly", amount: "$0.00", isEnabled: false)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}

