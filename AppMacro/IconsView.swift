//
//  IconsView.swift
//  AppMacro
//
//  Created by Samu Lima on 17/05/23.
//

import SwiftUI

struct IconsView: View {
    @Binding var icon: Icons
    @State var icons = model
    @State var selI:String = ""
    @State var selN:String = ""
    @State var fundo:String = ""
    

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        
                        if selN != "" {
                            Text(selN)
                                .foregroundColor(.white)
                                .bold()
                        } else {
                            Text("Nome")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        Circle()
                            .frame(width: 200)
                            .overlay{
                                Image(selI)
                                    .resizable()
                            }
                            .overlay{
                                if selI != "" {
                                    Image(systemName: "plus")
                                        .foregroundColor(.yellow)
                                        
                                }
                            }
                            .onTapGesture {
                                fundo = selI
                                print("foi2")
                                print(fundo)
                            
                            }
                            
                    }
                    Rectangle()
                        .frame(width: 50)
                        .foregroundColor(.clear)
                    
                    ScrollView{
                        Rectangle()
                            .frame(width: 430, height: 400)
                            .foregroundColor(.clear)
                            .overlay{
                                IconsNavigationView(icon: $icon, selI: $selI, selN: $selN)
                            }
                        
                        
                    }
                    
                }
                
                
            }
            .background(Color("background"))
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal){
                VStack{
                    Text("Icons")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                }
                
            }
        }
        
    }
    
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView(icon: .constant(modelI[0]))
    }
}
