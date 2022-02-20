//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Bünyamin Kılıçer on 10.02.2022.
//

import SwiftUI
import CoreData

struct GetDataURL: View {
    @State private var results = [Result]()
    var body: some View {
        if #available(iOS 15.0, *) {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("invalid URL")
            return
        }
        
        do {
            if #available(iOS 15.0, *) {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    results = decodedResponse.results
                }
            } else {
                // Fallback on earlier versions
            }
            
        } catch {
            print("Invalid data")
        }
    }
}

struct GetDataURL_Previews: PreviewProvider {
    static var previews: some View {
        GetDataURL()
    }
}
