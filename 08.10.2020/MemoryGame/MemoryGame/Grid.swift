//
//  Grid.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 12.08.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{

    var items: [Item]
    var viewForItem: (Item)->ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item)->ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }

    var body: some View {
        GeometryReader{geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout)-> some View{
        ForEach(items) {item in
            body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout)-> some View{
        let index = items.firstIndex(matching: item)!
        return Group{
            viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index))
        }
    }
}


struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        
        let card1 = MemoryGameModel<String>.Card(content: "A", id: 1)
        let card2 = MemoryGameModel<String>.Card(content: "B", id: 2)
        let card3 = MemoryGameModel<String>.Card(content: "C", id: 3)
        let card4 = MemoryGameModel<String>.Card(content: "D", id: 4)
        return Grid([card1, card2, card3, card4], viewForItem: { card in
                CardView(card: card)
        })
    }
}
