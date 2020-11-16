//
//  Themes.swift
//  MemoryGame
//
//  Created by Sandro Bütler on 12.11.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
    var numberOfPairs: Int?
}

let themes: [Theme] = [
    Theme(
        name: "Europa",
        emojis: ["🇧🇪","🇨🇿","🇨🇭","🇩🇪","🇪🇸","🇪🇺","🇫🇷","🇬🇧","🇬🇷","🇦🇹","🇱🇮","🇮🇹"],
        color: .black,
        numberOfPairs: 4),
    Theme(
        name: "Sports",
        emojis: ["🧗","🏌️","🏊","⛹️","🤼","🤹","🧘","🤽","🚵","🏋️","🚴","🤸"],
        color: .red,
        numberOfPairs: 10),
]
