//
//  HeaderView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 03/07/2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
