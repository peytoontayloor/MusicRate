//
//  ContentView.swift
//  Echoic
//

import SwiftUI
import SwiftData

struct Rating{
    var song: String
    var artist: String
    var album: String
    var rating: Int
    var comment: String
}

struct RatingEntry: View{
    @State private var newRating = Rating(song: "", artist: "", album: "", rating: 0, comment: "")
    @State private var rateList: [Rating] = []
    
    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("Song Details")){
                    TextField("Song", text: $newRating.song)
                    TextField("Artist", text: $newRating.artist)
                    TextField("Album", text: $newRating.album)
                }
                Section(header: Text("Rating")){
                    Stepper(value: $newRating.rating, in: 0...5){
                        Text("Rating: \(newRating.rating)")
                    }
                }
                Section(header: Text("Comment")){
                    TextField("Comment", text: $newRating.comment)
                }
                Section {
                    Button("Submit Rating"){
                        //save to datastructure or database here
                        let new = newRating
                        rateList.append(new)
                        print(rateList)
                    }
                }
            }
            .navigationTitle("Add Rating")
        }
    }
}
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Welcome")
                    .padding()
                    .font(.custom("Times New Roman", size: 70))
                    .cornerRadius(8.0)
                    .offset(y: -15)
                
                /*ZStack{
                    Image("MusicSheet")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 450)
                        .cornerRadius(20.0)
                        .offset(y: -20)
    
                }*/
                
                
                NavigationLink(destination: Catalog()){
                    Text("Catalog")
                        .font(.custom("Times New Roman", size: 30))
                        .frame(width: 150)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(Color.black)
                        .cornerRadius(8.0)
                        .offset(y: -20)
                }
                
                NavigationLink(destination: RatingEntry()){
                    Text("Rate")
                        .font(.custom("Times New Roman", size: 30))
                        .frame(width: 150)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(Color.black)
                        .cornerRadius(8.0)
                        .offset(y: 0)
                }
            }
            
        }
    }
}


struct Catalog: View {
    var body: some View {
        VStack{
            Text("Catalog")
                .offset(y: -300)
                .font(.custom("Times New Roman", size: 30))
            
        }
        .navigationBarTitle("Catalog", displayMode: .inline)
    }
}

struct Rate: View {
    var body: some View {
        VStack{
            Text("Rate")
        }
        .navigationBarTitle("Rate", displayMode: .inline)
    }
}
    
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
