//
//  SetJobsView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 04.03.2024.
//

import SwiftUI

struct SetJobsView: View {
    
    @State var jobs: [SetJobsModel]
    var router = SetJobsRouter()
    
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
                
                LazyVStack {
                    ForEach(mocks, id: \.id) { mock in
                        SetJobsCellView(model: mock)
                    }
                }
                 
                DefaultButton(buttonTitle: "Отправить отклик") {
                    print("jopa")
                }
                .padding()
            }
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
                 isSelected: true),
    
    SetJobsModel(id: 2,
                 position: "Мобилограф",
                 salary: "170 000 - 250 000 ₸",
                 location: "Алматы",
                 experience: "От 1 до 3 лет",
                 isSelected: false)
]
