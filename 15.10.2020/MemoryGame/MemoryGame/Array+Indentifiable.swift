//
//  Array+Index.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 12.08.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    
    func firstIndex(matching: Element)->Int?{
        for index in 0..<count{
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
