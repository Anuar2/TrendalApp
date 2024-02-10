//
//  ContentView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var smsToken: String = ""
    var body: some View {
        VStack {
            SecondPage()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
