//
//  ContentView.swift
//  cognitolab
//
//  Created by Juan Pablo Arias Mora on 3/20/21.
//

import SwiftUI
import Amplify

class ContentViewModel: ObservableObject {
    @Published var logged = false
    
    func isLogged()->Bool{
        return logged
    }
}

struct ContentView: View {
    
    @StateObject var contentVM = ContentViewModel()
    
    var body: some View {
        NavigationView{
            if contentVM.isLogged() {
                Text("Logged")
                .toolbar {
                    Button("LogOut") {
                        self.logOut()
                    }
                }
            }else{
                VStack{
                    NavigationLink(destination:  SignUP()) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("SignUp").foregroundColor(Color.white)
                            Spacer()
                        }
                        }.padding().background(Color.green).cornerRadius(15.0)
                    NavigationLink(destination:  LoginView()) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("LogIn").foregroundColor(Color.white)
                            Spacer()
                        }
                        }.padding()
                    .background(Color.blue)
                    .cornerRadius(15.0)
                }.padding()
            }
        }
        .onAppear { self.fetchCurrentAuthSession() }
        .navigationBarTitle("Welcome")
        .environmentObject(self.contentVM)
        
    }
    func fetchCurrentAuthSession() {
        Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let session):
                print("Is user signed in - \(session.isSignedIn)")
                
                if session.isSignedIn {
                    self.contentVM.logged = true
                }
                
            case .failure(let error):
                print("Fetch session failed with error \(error)")
            }
        }
    }
    func logOut(){
        Amplify.Auth.signOut() { result in
            switch result {
            case .success:
                print("Successfully signed out")
                self.contentVM.logged = false
            case .failure(let error):
                print("Sign out failed with error \(error)")
                self.contentVM.logged = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
