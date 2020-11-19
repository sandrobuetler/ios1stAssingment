 //
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 24.07.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @State private var showMenu = true
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack{
            Grid(viewModel.cards) { card in
                CardView(card: card, viewModel: viewModel).onTapGesture {
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
                Text("Neues Spiel")
            }).padding(textPadding)
            Text("Punkte \(viewModel.points)")
            Text("Highscore \(viewModel.highscore)")
            Button(action: {
                self.showMenu.toggle()
            }, label: {
                Text("Menu")
            }).padding(textPadding)
            .sheet(isPresented: $showMenu ) {
                MenuView(viewModel: viewModel, showsMenu: $showMenu)
            }
        }
        .foregroundColor(viewModel.theme.color)
    }
}



// MARK: - Drawing Constants
private let cardRotationDuration = Double(0.75)
private let gameResetAnimationDuration = Double(2)
private let cardViewPadding = CGFloat(5)
private let textPadding = CGFloat(10)

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
