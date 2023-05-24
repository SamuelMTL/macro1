//
//  ContentView.swift
//  AppMacro
//
//  Created by Samu Lima on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var currentScale:CGFloat = 1
    @State var angle = Angle(degrees: 0.0)
    @State var position:CGSize = .zero
    
    @Binding var cenario: Cenarios
    @State var cenarios = model
    
    @Binding var fundo:String
    
    @Binding var icon: Icons
    @State var icons = modelI
    
    static let myColor = Color("Background")
    
    //Gesto de rotacao
    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
    }
    
    //Gesto de zoom
    var zoom: some Gesture {
        MagnificationGesture()
            .onChanged { newScale in
                currentScale = newScale
            }
            .onEnded{ scale in
            }
    }
    
    //gesto de drag
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                position = gesture.translation
            }
            .onEnded { gesture in
                
            }
    }
    
    // corpo
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .overlay{
                                Image(fundo)
                                    .resizable()
                            }
                            .overlay{
                                Image("Untitled")
                                    .resizable()
                                
                            }
                        
                    }// fim ZStack
                    .foregroundColor(.gray)
                    .scaleEffect(currentScale)
                    .rotationEffect(self.angle)
                    .offset(position)
                    .gesture(drag)
                    .gesture(rotation)
                    .onTapGesture(count: 2) {
                        // isso vai levar o tabuleiro pra posição inicial com 2 cliques
                        currentScale = 1
                        angle = Angle(degrees: 0.0)
                        position = .zero
                    }
                    HStack {
                        Spacer()
                        VStack {
                            MenuView(cenario: $cenario, icon: $icon)
                            Spacer()
                        }
                    }
                }
            }//fim do VStack
            .padding()
            .background(Color("background"))
            .simultaneousGesture(zoom)
        }
        
        
    }// fim do body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cenario: .constant(model[0]), fundo: .constant(""), icon: .constant(modelI[0]))
    }
}

