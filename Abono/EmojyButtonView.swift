//
//  EmojyButtonView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 21/07/2022.
//

import SwiftUI

struct EmojyButtonView: View {
    
    enum EmojyState: String {
        case veryHappy = "😁"
        case happy = "🙂"
        case unsatisfied = "😑"
        case unhappy = "😕"
        case angry = "😤"
    }
    
    let state: EmojyState
    @Binding var isOn: Bool
    var select: () -> Void
    
    var body: some View {
        Button {
            select()
            isOn.toggle()
        } label: {
            Circle()
                .fill(isOn ? Color.blue : Color.gray)
                .frame(width: 55, height: 55)
                .overlay(
                    Text(state.rawValue)
                        .font(.title)
                )
        }
    }
    
}

struct EmojyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EmojyButtonView(state: .veryHappy, isOn: .constant(true), select: {
            
        })
        .previewLayout(.sizeThatFits)
        .padding()
        EmojyButtonView(state: .veryHappy, isOn: .constant(false), select: {
            
        })
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
