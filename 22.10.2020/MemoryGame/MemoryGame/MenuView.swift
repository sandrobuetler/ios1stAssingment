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

    var dificulty = ["Leicht", "Mittel", "Schwer"]
    @State private var selectedDificulty = 0
    @State private var selectedGame = ""
    
    
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
                selectedGame = "Emoji"
                self.showsMenu = false
            }) {
                Text("Emoji")
            }
            Spacer()
            Button(action: {
                selectedGame = "Fotos"
                self.showsMenu = false
            }) {
                Text("Fotos")
            }
            Spacer()
            Button(action: {
                selectedGame = "Kontaktfotos"
                self.showsMenu = false
            }) {
                Text("Kontaktfotos")
            }
            Spacer()
            
            Picker(selection: $selectedDificulty, label: Text("Schwierigkeit")) {
                        ForEach(0 ..< dificulty.count) {
                           Text(self.dificulty[$0])
                        }
                     }
                    
                     //Text("You selected: \(dificulty[selectedDificulty])")
        }.pickerStyle(SegmentedPickerStyle())

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
