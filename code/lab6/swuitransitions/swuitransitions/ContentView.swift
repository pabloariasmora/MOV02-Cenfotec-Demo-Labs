//
//  ContentView.swift
//  swuitransitions
//
//  Created by Juan Pablo Arias Mora on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSquare = false
    
    var body: some View {
        VStack{
            Button ("Tap Me"){
                withAnimation{
                    self.isShowingSquare.toggle()
                }
            }
            if isShowingSquare{
                Rectangle()
                    .fill(Color.purple)
                    .frame(
                        width: 200,
                        height: 200,
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
