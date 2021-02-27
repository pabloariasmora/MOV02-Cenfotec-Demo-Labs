//
//  ContentView.swift
//  api
//
//  Created by Juan Pablo Arias Mora on 2/24/21.
//

import SwiftUI


struct ContentView: View {
    
    @State var results = [CatFact]()
  
    var body: some View {
        List(results, id: \._id) { item in
            VStack(alignment: .leading) {
                Text(item.text)
            }
        }.onAppear(perform: loadData)
    }
    
  
    func loadData() {
        guard let url = URL(string: "https://cat-fact.herokuapp.com/facts") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        // The shared singleton session object.
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([CatFact].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
    
}


