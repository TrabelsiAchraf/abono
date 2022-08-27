//
//  ProgressBar.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/08/2022.
//

import SwiftUI

struct ProgressBar: View {
    
    var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemTeal))
                
                Rectangle()
                    .frame(width: min(CGFloat(value)*geometry.size.width, geometry.size.width),
                           height: geometry.size.height)
                    .foregroundColor(.progressView)
            }
            .cornerRadius(45.0)
        }
    }
}
