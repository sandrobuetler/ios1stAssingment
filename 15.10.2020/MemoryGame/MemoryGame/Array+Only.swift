//
//  Array+Only.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 17.08.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import Foundation

extension Array{
    
    var only:Element?{
        count == 1 ? first : nil
    }
    
}
