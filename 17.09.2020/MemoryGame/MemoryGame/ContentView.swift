//
//  ContentView.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 24.07.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            ForEach(0..<5){index in
                CardView(isFaceUp: index % 2 == 0, character: "🙈")
            }
        }.frame(height: 100, alignment: .center)
            .padding()
    }
}



struct CardView: View{
    
    var isFaceUp: Bool
    var character: String
    
    var body: some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                Text(character)
                    .padding()
                    .font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
