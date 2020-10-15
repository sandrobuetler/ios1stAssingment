//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 24.07.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
        }
    }
}

struct CardView: View{
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View{
        GeometryReader{geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize)-> some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                    .foregroundColor(.blue)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            else{
                if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.blue)
                }
            }
        }.aspectRatio(0.75, contentMode: .fit)
            .padding(5)
    }
    
    // MARK: - Drawing Constants
    let cornerRadius = CGFloat(10)
    let edgeLineWidth = CGFloat(3)
    func fontSize(for size: CGSize)->CGFloat{
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}
