//
//  TabItemView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 02/08/2022.
//

import SwiftUI

struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .padding()
                .foregroundColor(isSelected ? Color.blue : Color.gray)
        }
    }
}
