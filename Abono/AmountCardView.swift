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
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 18))
            Text(amount)
                .font(.title).bold()
        }
    }
}

struct AmountCardView_Previews: PreviewProvider {
    static var previews: some View {
        AmountCardView(title: "Weekly", amount: "$0.00")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
