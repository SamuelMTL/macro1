//
//  CenarioView.swift
//  AppMacro
//
//  Created by Samu Lima on 17/05/23.
//

import SwiftUI

struct CenarioView: View {
    @Binding var cenario: Cenarios
    @State var cenarios = model
    @State var selecaoI:String = ""
    @State var selecaoN:String = ""
    @State var fundo:String = ""
    
    @Binding var icon : Icons
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        
                        if selecaoN != "" {
                            Text(selecaoN)
                                .foregroundColor(.white)
                                .bold()
                        } else {
                            Text("Nome")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 180)
                            .overlay{
                                Image(selecaoI)
                                    .resizable()
                            }
                            .overlay{
                                if selecaoI != "" {
                                    Image(systemName: "plus")
                                        .foregroundColor(.yellow)
                                    
                                }
                            }
                            .onTapGesture {
                                fundo = selecaoI
                                print("foi2")
                                print(fundo)
                                
                            }
                        
                    }
                    Rectangle()
                        .foregroundColor(.green)
                    
                    ScrollView{
                        Rectangle()
                            .frame(width: 430, height: 400)
                            .foregroundColor(.clear)
                            .overlay{
                                CenariosNavigationView(cenario: $cenario, selecaoI: $selecaoI, selecaoN: $selecaoN)
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
                    Text("Cenários")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                }
                
            }
        }
        
    }
}

struct CenarioView_Previews: PreviewProvider {
    static var previews: some View {
        CenarioView(cenario: .constant(model[0]), icon: .constant(modelI[0]))
    }
}
