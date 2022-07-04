//
//  AmountCardView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

struct AmountCardView: View {
    
    var title: String
    var amount: String
    var isEnabled: Bool = true
    
    var body: some View {
        VStack(spacing: 2) {
            Text(title)
                .font(.system(size: 18))
            Text(amount)
                .font(.system(size: 26)).bold()
        }
        .foregroundColor(isEnabled ? .black : .gray)
    }
}

struct AmountCardView_Previews: PreviewProvider {
    static var previews: some View {
        AmountCardView(title: "Weekly", amount: "$0.00")
            .previewLayout(.sizeThatFits)
            .padding()
        
        AmountCardView(title: "Weekly", amount: "$0.00", isEnabled: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
