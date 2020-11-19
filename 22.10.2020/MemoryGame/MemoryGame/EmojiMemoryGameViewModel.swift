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
        let defaults = UserDefaults.standard
        
        let dif: Int = defaults.integer(forKey: "Difficulty")
        
        var pairs: Int = 1
        if (dif == 0) {
            pairs = 6
        }
        if dif == 1 {
            pairs = 8
        }
        if dif == 2 {
            pairs = 10
        }
        
        let emojiis: Array<String> = theme.emojis.shuffled()
        return  MemoryGameModel<String>(numberOfPairsOfCards: pairs){
            index in
            return emojiis[index]
        }
    }
    
    init() {
        //let defaults = UserDefaults.standard
        //var dif = defaults.integer(forKey: "Difficulty")
        model = EmojiMemoryGameViewModel.createMemoryGame(theme: theme)
        //print(dif)
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
    
    var difficulty: Int {
        return model.difficulty
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
