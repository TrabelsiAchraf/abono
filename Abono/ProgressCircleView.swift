//
//  ProgressCircleView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress: Float
    @Binding var color: Color
    private let lineWidth: CGFloat = 5.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(Color.white)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
            
            Text(String(format: "%.0f", min(progress, 1.0)*100.0))
                .font(.system(size: 16))
                .bold()
        }
        .frame(width: 35, height: 35)
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: .constant(0.8), color: .constant(.blue))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
