//
//  SetJobsView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 04.03.2024.
//

import SwiftUI

struct SetJobsView: View {
    
    @State var jobs: [SetJobsModel] = mocks
    var router = SetJobsRouter()
    @State var selectedIndex: Int? = nil

    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                Text("Выберите вакансию")
                    .font(Font.custom("SF Pro Display", size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.bottom, 10)
                
                
                ForEach(jobs.indices, id: \.self) { index in
                    SetJobsCellView(model: jobs[index], isSelected: $jobs[index].isSelected)
                        .onTapGesture {
                            selectedIndex = index
                            updateSelection(index: index)
                        }
                }
                 
                DefaultButton(buttonTitle: "Отправить отклик") {
                }
                .padding()
            }
        }
    }
    
    
    private func updateSelection(index: Int) {
        jobs.indices.forEach { i in
            jobs[i].isSelected = i == index
        }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.fromHex("#0F172A").ignoresSafeArea()
    }
}

struct SetJobsView_Previews: PreviewProvider {
    static var previews: some View {
        SetJobsView(jobs: mocks)
    }
}

private var mocks: [SetJobsModel] = [
    SetJobsModel(id: 1, 
                 position: "Мобилограф",
                 salary: "170 000 - 250 000 ₸",
                 location: "Алматы",
                 experience: "От 1 до  лет", 
                 isSelected: false),
    
    SetJobsModel(id: 2,
                 position: "Мобилограф",
                 salary: "170 000 - 250 000 ₸",
                 location: "Алматы",
                 experience: "От 1 до 3 лет",
                 isSelected: false)
]
