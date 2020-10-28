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
    @State private var difficulty = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.showsMenu = false
            }) {
                Text("Menü schliessen")
            }
            //Text("Menu")
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
            
//            TODO: Binding muss gemacht werden
            Picker(selection: $difficulty, label: Text("Schwierigkeit")) {
                            Text("Leicht").tag(0)
                            Text("Mittel").tag(1)
                            Text("Schwierig").tag(2)
                        }.pickerStyle(SegmentedPickerStyle())

                        //Text("Level: \(difficulty)")

        }
 
    }
}

