//
//  ContentView.swift
//  Abono
//
//  Created by Achraf Trabelsi on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bottomSheetShown = false
    
    var body: some View {
        GeometryReader { geometry in
            Spacer()
            Color(red: 240/255, green: 242/255, blue: 249/255, opacity: 1.0)
                .ignoresSafeArea()
            
            VStack {
                TopAmountSectionView(
                    firstAmount: .init(title: "Weekly", amount: "$0.00"),
                    secondAmount: .init(title: "Monthly", amount: "$5.99"),
                    thirdAmount: .init(title: "Yearly", amount: "$67.94")
                )
                .frame(height: geometry.frame(in: .global).height * 0.1)
                
                UpcomingSubscriptionsView()
                    .frame(height: geometry.frame(in: .global).height * 0.3)
                    .padding(.horizontal, 10)
            }
            
            BottomSheetView(
                isOpen: $bottomSheetShown,
                maxHeight: geometry.frame(in: .global).height * 1
            ) {
                AllSubscriptionsModalView(status: bottomSheetShown ? .constant(.opened) : .constant(.closed), sheetButtonTapped: {
                    bottomSheetShown.toggle()
                })
                .background(Color.white)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
