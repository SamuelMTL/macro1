//
//  CenariosNavigationView.swift
//  AppMacro
//
//  Created by Samu Lima on 18/05/23.
//

import SwiftUI

struct Cenarios:Identifiable {
    var id = UUID()
    var name:String
    var icon:String
}

var model = [Cenarios(name: "Taverna" , icon: "taverna"), Cenarios(name: "exemplo", icon: "cry"),Cenarios(name: "bleh", icon: "bleh"), Cenarios(name: "kirby", icon: "kirby")]

struct CenariosNavigationView: View {
    @Binding var cenario: Cenarios
    @State var cenarios = model
    @Binding var selecaoI:String
    @Binding var selecaoN:String
    
     
    let columns = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns){
                ForEach(0..<cenarios.count, id: \.self) { index in
                    VStack{
                        Text(cenarios[index].name)
                                    .bold()
                                    .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width:200 ,height: 100)
                            .overlay{
                                Image(cenarios[index].icon)
                                    .resizable()
                                
                            }
                            .onTapGesture {
                                selecaoI = cenarios[index].icon
                                selecaoN = cenarios[index].name
                                print("foi")
                            }
                            
                            
                            
                    }
                    
                }
            }
        }
    }
}

struct CenariosNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CenariosNavigationView(cenario: .constant(model[0]), selecaoI: .constant(""), selecaoN: .constant(""))
    }
}
