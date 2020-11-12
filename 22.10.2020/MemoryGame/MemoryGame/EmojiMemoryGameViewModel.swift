//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 31.07.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import Foundation


class EmojiMemoryGameViewModel: ObservableObject{
    
    @Published private var model: MemoryGameModel<String>
    
    var theme = themes.randomElement()!
    
    private static func createMemoryGame(theme: Theme)->MemoryGameModel<String>{
        let emojiis: Array<String> = theme.emojis.shuffled()
        return  MemoryGameModel<String>(numberOfPairsOfCards: theme.numberOfPairs ?? Int.random(in: 4...6)){
            index in
            return emojiis[index]
        }
    }
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame(theme: theme)
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGameModel<String>.Card>{
        return model.cards
    }
    
    var points: Int {
        return model.points
    }
    
    var highscore: Int{
        return model.highscore
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card: card)
    }
    
    func resetGame(){
        theme = themes.randomElement()!
        model = EmojiMemoryGameViewModel.createMemoryGame(theme: theme)
    }
    
}
