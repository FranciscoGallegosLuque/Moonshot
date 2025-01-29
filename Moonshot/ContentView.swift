//
//  ContentView.swift
//  Moonshot
//
//  Created by Francisco Manuel Gallegos Luque on 28/01/2025.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(.example)
//                .resizable()
//                .scaledToFit() // .scaledToFit() hace otra cosa
////                .frame(width: 300, height: 300)
//                .containerRelativeFrame(.horizontal) { size, axis in
//                    size * 0.8 }
//        }
////        .clipped()
//    }
//}

//struct CustomText: View {
//    let text: String
//    
//    var body: some View {
//        Text(text)
//    }
//    
//    init(text: String) {
//        print("Creating a new CustomText")
//        self.text = text
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        ScrollView (.horizontal){
//            LazyHStack(spacing: 10) { //el lazy no te muestra todo el view de una
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            NavigationLink{
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//                .navigationTitle("SwiftUI")
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            List(0..<100) { row in
//                NavigationLink("Row \(row)") {
//                    Text("Detail \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }    }
//}

//struct User: Codable {
//    let name: String
//    let address: Address
//}
//
//struct Address: Codable {
//    let street: String
//    let city: String
//}
//
//struct ContentView: View {
//    var body: some View {
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "adress": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//            
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
//    }
//}

//struct ContentView: View {
////    let layout = [
////        GridItem(.fixed(80)),
////        GridItem(.fixed(80)),
////        GridItem(.fixed(80))
////    ]
//    
//    let layout = [
//        GridItem(.adaptive(minimum: 80))
//    ]
//    
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
////        ScrollView(.horizontal) {
////            LazyHGrid(rows: layout) {
////                ForEach(0..<1000) {
////                    Text("Item \($0)")
////                } //esta es la version horizontal
////            }
////        }
//    }
//}

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                              


                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))

                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)    
        }

    }
}

#Preview {
    ContentView()
}
