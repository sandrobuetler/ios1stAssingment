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
    //var numberOfPairs: Int?
    //@State var dif = 1
    

    
}


let themes: [Theme] = [
    Theme(
        name: "Europa",
        emojis: ["🇧🇪","🇨🇿","🇨🇭","🇩🇪","🇪🇸","🇪🇺","🇫🇷","🇬🇧","🇬🇷","🇦🇹","🇱🇮","🇮🇹"],
        color: .black),
    Theme(
        name: "Sports",
        emojis: ["🧗","🏌️","🏊","⛹️","🤼","🤹","🧘","🤽","🚵","🏋️","🚴","🤸"],
        color: .red),
]
