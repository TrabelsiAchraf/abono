//
//  PieChartView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/04/2022.
//

import SwiftUI

struct PieChartView: View {
    let values: [Double]
    var colors: [Color]
    let names: [String]
    
    var backgroundColor: Color
    var innerRadiusFraction: CGFloat
    
    private var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg),
                                           endAngle: Angle(degrees: endDeg + degrees),
                                           text: String(format: "%.0f%%", value * 100 / sum),
                                           color: colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    ForEach(0..<values.count, id: \.self) { i in
                        PieSliceView(pieSliceData: slices[i])
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    
                    Circle()
                        .fill(backgroundColor)
                        .frame(width: geometry.size.width * innerRadiusFraction,
                               height: geometry.size.width * innerRadiusFraction)
                    
                    VStack {
                        Text("Analyze")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        Text("$\(String(values.reduce(0, +)))")
                            .font(.title)
                    }
                }
            }
            .foregroundColor(.black)
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(values: [12, 17, 3.5],
                     colors: [Color.blue, Color.green, Color.orange],
                     names: ["Rent", "Transport", "Education"],
                     backgroundColor: .white,
                     innerRadiusFraction: 0.6)
        .previewLayout(.sizeThatFits)
    }
}
