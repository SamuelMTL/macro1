//
//  AppMacroApp.swift
//  AppMacro
//
//  Created by Samu Lima on 15/05/23.
//

import SwiftUI

@main
struct AppMacroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(cenario: .constant(model[0]), fundo: .constant(""), icon: .constant(modelI[0]))
        }
    }
}
