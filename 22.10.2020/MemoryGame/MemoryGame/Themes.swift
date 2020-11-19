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
        color: .blue),
    Theme(
        name: "Sports",
        emojis: ["🧗","🏌️","🏊","⛹️","🤼","🤹","🧘","🤽","🚵","🏋️","🚴","🤸"],
        color: .red),
    Theme(
        name: "Images",
        emojis: ["1","2","3","4","5","6","7","8","9","10","11","12","14","15","16"],
        color: .green),
]
