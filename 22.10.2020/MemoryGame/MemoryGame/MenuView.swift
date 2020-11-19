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
                Image(systemName: "xmark.circle")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    .padding(10)
            }

            Text("Menu")
            Spacer()
            Button(action: {
                
                viewModel.resetGame(gameTheme: 0)
                self.showsMenu = false
            }) {
                HStack {
                        Image(systemName: "flag.fill")
                        Text("Flaggen")
                    }
            }.buttonStyle(GradientButtonStyle())
            
        
            
            Spacer()
            Button(action: {
                viewModel.resetGame(gameTheme: 1)
                self.showsMenu = false
            }) {
                HStack {
                        Image(systemName: "stopwatch.fill")
                        Text("Sports")
                    }
            }.buttonStyle(GradientButtonStyle())
        
            
            Spacer()
            Button(action: {
                viewModel.resetGame(gameTheme: 2)
                self.showsMenu = false
            }) {
                HStack {
                        Image(systemName: "photo.fill")
                        Text("Fotos")
                    }
            }.buttonStyle(GradientButtonStyle())
            
            Spacer()
            
            Picker(selection: $selectedDificulty, label: Text("Schwierigkeit")) {
                        ForEach(0 ..< dificulty.count) {
                           Text(self.dificulty[$0])
                        }
            }
            
        }.pickerStyle(SegmentedPickerStyle())
        
        .onReceive([self.selectedDificulty].publisher.first()) {dificulty in
            self.pickerChange(dificulty: dificulty)
        }
        .foregroundColor(viewModel.theme.color)
    }
    
    func pickerChange(dificulty: Int) {
        defaults.set(dificulty, forKey: "Difficulty")
     }
    
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10.0)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
