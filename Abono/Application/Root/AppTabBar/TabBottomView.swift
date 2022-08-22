//
//  TabBottomView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import SwiftUI

struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    var height: CGFloat = 55
    var width: CGFloat = UIScreen.main.bounds.width - 32
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            ForEach(tabbarItems.indices, id: \.self) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }
            }
        }
        .padding()
        .frame(height: height)
        .background(Color.card)
        .cornerRadius(50)
        .shadow(radius: 5, x: 0, y: 4)
    }
}
