//
//  TrendalAppApp.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

@main
struct TrendalAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
