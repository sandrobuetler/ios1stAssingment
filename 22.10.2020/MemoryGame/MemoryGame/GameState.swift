//
//  GameState.swift
//  MemoryGame
//
//  Created by Alejandro Garcia on 19.11.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import Foundation

class GameState: ObservableObject {
    @Published var highscore = 0
    @Published var difficulty = 0
}
