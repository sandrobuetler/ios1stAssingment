//
//  MenuView.swift
//  MemoryGame
//
//  Created by Alejandro Garcia on 28.10.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

// Menu View
struct MenuView: View {
    @Binding var showsMenu: Bool
    
    var body: some View {
        VStack {
            Text("Menu")
            Spacer()
            Button(action: {
                self.showsMenu = false
            }) {
                Text("Game 1")
            }
            Spacer()
            Button(action: {
                self.showsMenu = false
            }) {
                Text("Game 2")
            }
            Spacer()
            Button(action: {
                self.showsMenu = false
            }) {
                Text("Game 3")
            }
            Spacer()
            
            Button(action: {
                self.showsMenu = false
            }) {
                Text("Hide Menu")
            }
        }
 
    }
}

