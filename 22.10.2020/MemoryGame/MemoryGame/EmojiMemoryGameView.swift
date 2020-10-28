//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 24.07.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @State private var showMenu = false
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack{
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: cardRotationDuration)){
                        viewModel.choose(card: card)
                    }
                }
                .padding(cardViewPadding)
            }
            Button(action: {
                withAnimation(.easeInOut(duration: gameResetAnimationDuration)){
                    viewModel.resetGame()
                }
            }, label: {
                Text("New Game")
            })
            Button(action: {
                self.showMenu.toggle()
            }) {
                Text("Menu")
            }
            .sheet(isPresented: $showMenu ) {
                MenuView()
            }
        }
        .foregroundColor(Color.blue)
    }
}

struct MenuView: View {
    var body: some View {
        Text("Menu")
    }
}

// MARK: - Drawing Constants
private let cardRotationDuration = Double(0.75)
private let gameResetAnimationDuration = Double(2)
private let cardViewPadding = CGFloat(5)

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
