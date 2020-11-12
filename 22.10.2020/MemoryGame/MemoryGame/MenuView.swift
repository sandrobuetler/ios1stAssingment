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
                Text("Emojy")
            }
            Spacer()
            Button(action: {
                self.showsMenu = false
            }) {
                Text("Fotos")
            }
            Spacer()
            Button(action: {
                self.showsMenu = false
            }) {
                Text("Kontakte")
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
