//
//  TopAmountSectionView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

struct TopAmountSectionView: View {
    
    let firstAmount: AmountDataView
    let secondAmount: AmountDataView
    let thirdAmount: AmountDataView
    
    var body: some View {
        HStack {
            Spacer()
            AmountCardView(title: firstAmount.title, amount: firstAmount.amount, isEnabled: false)
            Spacer()
            AmountCardView(title: secondAmount.title, amount: secondAmount.amount)
            Spacer()
            AmountCardView(title: thirdAmount.title, amount: thirdAmount.amount)
            Spacer()
        }
    }
}

struct AmountDataView {
    var title: String
    var amount: String
}

struct TopAmountSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TopAmountSectionView(
            firstAmount: .init(title: "Weekly", amount: "$0.00"),
            secondAmount: .init(title: "Monthly", amount: "$5.99"),
            thirdAmount: .init(title: "Yearly", amount: "$67.94")
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
