//
//  MenuView.swift
//  AppMacro
//
//  Created by Samu Lima on 17/05/23.
//

import SwiftUI

struct MenuView: View {
    @State var isButtonClicked = false
    
    @Binding var cenario: Cenarios
    @State var cenarios = model
    
    @Binding var icon: Icons
    @State var icons = modelI
    
    var body: some View {
        
            VStack{
                Button(action: {
                    isButtonClicked.toggle()
                }) {
                    Circle()
                        .frame(width: 80)
                        .foregroundColor(.clear)
                        .overlay{
                            isButtonClicked ? Image("Olho1") : Image("Olho2")
                        }
                }
                if isButtonClicked {
                    VStack{
                        NavigationLink{
                            IconsView(icon: $icon)
                        }label: {
                            Circle()
                                .frame(width: 60)
                                .foregroundColor(Color.yellow)
                        }
                        NavigationLink{
                            CenarioView(cenario: $cenario, selecaoI: "", icon: $icon)
                        }label: {
                            Circle()
                                .frame(width: 60)
                                .foregroundColor(Color.yellow)
                        }
                        
                    }
                    
                }
            }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(cenario: .constant(model[0]), icon: .constant(modelI[0]))
    }
}
