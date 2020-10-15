//
//  CardView.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 18.08.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct CardView: View{
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View{
        GeometryReader{geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize)-> some View{
        if card.isFaceUp || !card.isMatched{
            ZStack{
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90),clockwise: true)
                    .padding(5)
                    .opacity(opacity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    private let opacity = Double(0.4)
    private let cornerRadius = CGFloat(10)
    private let edgeLineWidth = CGFloat(3)
    private func fontSize(for size: CGSize)->CGFloat{
        min(size.width, size.height) * 0.7
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return CardView(card: game.cards[0])
    }
}
