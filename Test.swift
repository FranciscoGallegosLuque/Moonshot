//
//  Test.swift
//  Moonshot
//
//  Created by Francisco Manuel Gallegos Luque on 29/01/2025.
//

import SwiftUI

struct MainView: View {
    let planets = [
        ("Earth", "earth_image"),
        ("Moon", "moon_image"),
        ("Sun", "sun_image")
    ]
    
    var body: some View {
        NavigationStack {
            List(planets, id: \.0) { planet in
                NavigationLink(destination: DetailView(planet: planet.0, imageName: planet.1)) {
                    HStack {
                        Image(planet.1)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        Text(planet.0)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Planets")
        }
    }
}

struct DetailView: View {
    let planet: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(planet)
                .font(.largeTitle)
                .bold()
        }
        .padding()
        .navigationTitle(planet)
    }
}

#Preview {
    MainView()
}
