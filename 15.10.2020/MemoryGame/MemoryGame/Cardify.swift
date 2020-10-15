//
//  Cardify.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 19.08.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier{
    
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                content
            }
            else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
    }
}

extension View{
    
    func cardify(isFaceUp: Bool)-> some View{
        return modifier(Cardify(isFaceUp: isFaceUp))
    }
}
