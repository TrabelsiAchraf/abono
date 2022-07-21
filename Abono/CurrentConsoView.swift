//
//  CurrentConsoView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 01/07/2022.
//

import SwiftUI

struct CurrentConsoView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Already paid")
                    .font(.system(size: 16)).bold()
                Spacer()
                Button {
                    
                } label: {
                    Text("See All")
                        .font(.system(size: 14)).bold()
                }
            }
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("20€ / 120€")
                            .font(.title2).bold()
                        Text("Current value")
                            .font(.caption)
                            .foregroundColor(Color.second)
                    }
                    Spacer()
                }
                .padding([.leading, .top], 20)
                
                ProgressBar(value: .constant(0.2))
                    .frame(height: 30)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 10) {
                    SubscriptionItemView(icon: "netflix_ic", name: "Netflix")
                    SubscriptionItemView(icon: "uber_eat_ic", name: "Uber Eat")
                }
                .padding()
            }
            .background(.white)
            .cornerRadius(15)
        }
    }
}

struct CurrentConsoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConsoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

private struct ProgressBar: View {
    @Binding var value: Float
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemTeal))
                
                Rectangle()
                    .frame(width: min(CGFloat(value)*geometry.size.width, geometry.size.width),
                                  height: geometry.size.height)
                    .foregroundColor(Color(.systemBlue))
            }
            .cornerRadius(45.0)
        }
    }
}
