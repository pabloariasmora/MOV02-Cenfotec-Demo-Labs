//
//  ContentView.swift
//  userdefaults
//
//  Created by Juan Pablo Arias Mora on 3/17/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("status") var logged = false
    
    var body: some View {
        NavigationView{
            if logged{
                VStack{
                    Text ("User Logged In")
                        .navigationTitle("Home")
                        .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                        .preferredColorScheme(.light)
                    Button(action:{
                        logged = false
                    }, label: {
                        Text("Logout")
                    })
                }
            }else{
                LoginView()
                    .preferredColorScheme(.light)
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
