//
//  GenderSelect.swift
//  TrendalApp
//
//  Created by Anuar on 12.10.2023.
//

import SwiftUI

enum Gender {
    case male
    case female
}

struct GenderSelect: View {
    @State private var selectedGender: Gender? = nil

    var body: some View {
        ZStack {
            HStack(spacing: 22) {
                VStack {
                    Image("maleIcon")
                        .scaleEffect(selectedGender == .male ? 1.2 : 1.0)
                    Text("Мужской")
                        .foregroundColor(selectedGender == .male ? Color.fromHex("#38BDF8") : Color.gray)
                }
                .padding(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(selectedGender == .male ? Color.fromHex("#38BDF8") : Color.gray, lineWidth: 1)
                )
                .onTapGesture {
                    withAnimation {
                        selectedGender = .male
                    }
                }
                
                Spacer()

                VStack {
                    Image("femaleIcon")
                        .scaleEffect(selectedGender == .female ? 1.2 : 1.0)
                    Text("Женский")
                        .foregroundColor(selectedGender == .female ? Color.fromHex("#38BDF8") : Color.gray)
                }
                .padding(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(selectedGender == .female ? Color.fromHex("#38BDF8") : Color.gray, lineWidth: 1)
                )
                .onTapGesture {
                    withAnimation {
                        selectedGender = .female
                    }
                }
            }
        }
    }
}


struct GenderSelect_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelect()
    }
}
