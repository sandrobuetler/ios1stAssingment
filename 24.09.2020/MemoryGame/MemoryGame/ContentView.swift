//
//  ContentView.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 24.07.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.cards){card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }.frame(height: 100, alignment: .center)
            .padding()
    }
}



struct CardView: View{
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                Text(card.content)
                    .padding()
                    .font(.headline)
            }
            else{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
            }
        }.aspectRatio(0.75, contentMode: .fit)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
