//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 31.07.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import Foundation
import UIKit


class EmojiMemoryGameViewModel: ObservableObject{
    
    @Published private var model: MemoryGameModel<String>
    
    var theme = themes[0]
    var isIpad: Bool
    var gameThemeIndex: Int = 0;
    
    private static func createMemoryGame(theme: Theme)->MemoryGameModel<String>{
        let defaults = UserDefaults.standard
        var isIpad: Bool
        if UIDevice.current.userInterfaceIdiom == .pad {
            isIpad = true
            print(isIpad)
        }else {
            isIpad = false
            print(isIpad)
        }
        let dif: Int = defaults.integer(forKey: "Difficulty")
        
        var pairs: Int = 0
        if (dif == 0) {
            pairs = 4
            if isIpad == true {
                pairs = pairs + 2
            }
            
        }
        if dif == 1 {
            pairs = 6
            if isIpad == true {
                pairs = pairs + 4
            }
        }
        if dif == 2 {
            pairs = 8
            if isIpad == true {
                pairs = pairs + 4
            }
        }
        
        let emojiis: Array<String> = theme.emojis.shuffled()
        return  MemoryGameModel<String>(numberOfPairsOfCards: pairs){
            index in
            return emojiis[index]
        }
    }
    
    init() {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            isIpad = true
            print(isIpad)
        }else {
            isIpad = false
            print(isIpad)
        }
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
    
    var difficulty: Int {
        return model.difficulty
    }
    
    
    // MARK: - Intents
    
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card: card)
    }
    
    func resetGame(){
        model = EmojiMemoryGameViewModel.createMemoryGame(theme: theme)
    }
    func resetGame(gameTheme: Int){
        theme = themes[gameTheme]
        gameThemeIndex = gameTheme
        model = EmojiMemoryGameViewModel.createMemoryGame(theme: theme)
    }
    
}
