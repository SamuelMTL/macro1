//
//  IconsNavigationView.swift
//  AppMacro
//
//  Created by Samu Lima on 20/05/23.
//

import SwiftUI

struct Icons:Identifiable {
    var id = UUID()
    var name:String
    var icon:String
}

var modelI = [Icons(name: "Dragao", icon: "Dragao_PNG"),Icons(name: "Bicho", icon: "Bicho_PNG"),Icons(name: "Barbaro", icon: "Barbaro_PNG"),Icons(name: "Druida", icon: "Druida_PNG"),Icons(name: "Barbaro", icon: "Barbaro_PNG"),Icons(name: "Barbaro", icon: "Barbaro_PNG")
]

struct IconsNavigationView: View {
    @Binding var icon: Icons
    @State var icons = modelI
    @Binding var selI:String
    @Binding var selN:String
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns){
                ForEach(0..<icons.count, id: \.self) { index in
                    VStack{
                        Text(icons[index].name)
                            .bold()
                            .foregroundColor(.white)
                        Circle()
                            .frame(height: 100)
                            .overlay{
                                Image(icons[index].icon)
                                    .resizable()
                                
                            }
                            .onTapGesture {
                                selI = icons[index].icon
                                selN = icons[index].name
                                print("foi")
                            }
                        
                        
                        
                    }
                    
                }
            }
        }
    }
}

struct IconsNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        IconsNavigationView(icon: .constant(modelI[0]), selI: .constant(""), selN: .constant(""))
    }
}
