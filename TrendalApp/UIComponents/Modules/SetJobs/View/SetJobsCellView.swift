//
//  SetJobsCellView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 05.03.2024.
//

import SwiftUI

struct SetJobsCellView: View {
    @State var model: SetJobsModel
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                jobPostionAndSalary
                locationAndExperience
            }
            Spacer()
            RadioButton(selected: $isSelected)
        }
        .padding()
        .foregroundColor(Color.white)
        .background(Color.mainGray)
        .border(isSelected ? Color.fromHex("#38BDF8") : Color.fromHex("#A8A8A8"), width: 2).cornerRadius(20)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
    
    
    private var jobPostionAndSalary: some View {
          HStack {
              VStack (alignment: .leading){
                  Text(model.position).font(.system(size: 14))
                  Spacer().frame(height: 5)
                  Text(model.salary).font(.system(size: 15))
              }
              .fontWeight(.bold)
          }
      }
      
      private var locationAndExperience: some View {
          HStack {
              LocationView(location: model.location)
              Text("·")
              ExperienceView(experience: model.experience)
          }
          .font(.system(size: 14))
          .foregroundColor(Color.gray)
          .padding(.top, 3)
      }
}


struct RadioButton: View {
    @Binding var selected: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(selected ? Color.blue : Color.clear)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                )
            if selected {
                Circle()
                    .fill(Color.white)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct SetJobsCellView_Previews: PreviewProvider {
    static var previews: some View {
        @State var mockState = false
        List {
            SetJobsCellView(
                model: SetJobsModel(
                    id: 1,
                    position: "Мобилограф",
                    salary: "170 000 - 250 000 ₸",
                    location: "Алматы",
                    experience: "От 1 до 3 лет",
                    isSelected: false
                ), isSelected: $mockState
            )
            SetJobsCellView(
                model: SetJobsModel(
                    id: 3,
                    position: "Мобилограф",
                    salary: "170 000 - 250 000 ₸",
                    location: "Алматы",
                    experience: "От 3 до 6 лет",
                    isSelected: false
                ), isSelected: $mockState
            )
        }
        .listStyle(PlainListStyle())
    }
}

