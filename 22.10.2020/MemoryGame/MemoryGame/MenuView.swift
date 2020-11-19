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
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    let defaults = UserDefaults.standard
    @Binding var showsMenu: Bool

    var dificulty = ["Leicht", "Mittel", "Schwer"]
    @State var selectedDificulty: Int = 0;
    
    
    

    
    var body: some View {
        VStack {
            Button(action: {
                self.showsMenu = false
                viewModel.resetGame()
            }) {
                Text("Menü schliessen")
            }
            //Text("Menu")
            Spacer()
            Button(action: {
                
                self.showsMenu = false
            }) {
                Text("Emoji")
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
        
        .onReceive([self.selectedDificulty].publisher.first()) {dificulty in
            self.pickerChange(dificulty: dificulty)
        }

    }
    
    // Just an example function below
    func pickerChange(dificulty: Int) {
           print(dificulty)
        //let defaults = UserDefaults.standard
        defaults.set(dificulty, forKey: "Difficulty")
     }
    
}





struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
