//
//  BackButtonView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("arrowLeft")
                .resizable()
                .foregroundColor(Color.fromHex("#0F172A"))
                .frame(width: 24, height: 24, alignment: .center)
        }
        .frame(width: 32, height: 32)
        .onTapGesture {
            dismiss()
        }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}

struct BackButtonGroup<Content: View> : View {
    let rowContent: () -> Content
    
    init(rowContent: @escaping () -> Content) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.backgroundColor = UIColor.clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.red) //BYColor.byGreenColor.swiftUIColor
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red], for: .normal)
        
        self.rowContent = rowContent
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(Color.fromHex("#0F172A"))
                    .frame(height: 24)
                Group(content: rowContent)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButtonView()
                }
            }
        } else {
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(Color.clear)
                    .frame(height: 24)
                Group(content: rowContent)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButtonView()
                }
            }
        }
    }
}

