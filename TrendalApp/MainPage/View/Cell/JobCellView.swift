//
//  JobCellView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 05.02.2024.
//

import Foundation
import SwiftUI

struct JobCellView: View {
    @State
    var model: JobModel
    
    var body: some View {
        VStack (alignment: .leading) {
            companyAndLike
            jobPostionAndSalary
            locationAndExperience
            jobTags
            sendResponse
            dateAndViewed
        }
        .padding()
        .foregroundColor(Color.white)
        .background(Color.mainBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    private var companyAndLike: some View {
        HStack {
            Image(model.companyImage)
            Text(model.companyName).font(.system(size: 13))
            Spacer()
            LikeAnimationView()
        }
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
    }
    
    private var jobTags: some View {
        HStack {
            Button("Полный рабочий день", action: {})
                .background(Color.monoTags)
                .buttonStyle(.bordered)
                .cornerRadius(10)
            Button("Гибкий график", action: {})
                .background(Color.monoTags)
                .buttonStyle(.bordered)
                .cornerRadius(10)
        }
        .padding(.top, 5)
        .font(.system(size: 13))
    }
    
    private var sendResponse: some View {
        DefaultButton(buttonTitle: "Отправить отклик")
            .padding(.top, 5)
            .font(.system(size: 15))
    }
    
    private var dateAndViewed: some View {
        HStack {
            DateView(date: model.date)
            Spacer()
            ViewedView(viewed: model.viewed)
        }.padding(.top, 5)
        .font(.system(size: 12))
        .foregroundColor(Color.gray)
    }
}

struct JobCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            VStack {
                JobCellView(
                    model: JobModel(
                        id: 1,
                        companyImage: "atlassian",
                        companyName: "Airba Fresh Food Tech Company",
                        position: "Мобилограф",
                        salary: "170 000 - 250 000 ₸",
                        location: "Алматы",
                        experience: "От 1 до 3 лет",
                        date: "2024-02-06T12:00:00",
                        viewed: true
                    )
                )
                .padding(.bottom, 20)
                .shadow(radius: 20)
                
                JobCellView(
                    model: JobModel(
                        id: 2,
                        companyImage: "atlassian",
                        companyName: "Airba Fresh Food Tech Company",
                        position: "Мобилограф",
                        salary: "170 000 - 250 000 ₸",
                        location: "Алматы",
                        experience: "Без опыта работы",
                        date: "2024-05-16T12:00:00",
                        viewed: false
                    )
                )
                .padding(.bottom, 20)
                .shadow(radius: 20)
                JobCellView(
                    model: JobModel(
                        id: 3,
                        companyImage: "atlassian",
                        companyName: "Airba Fresh Food Tech Company",
                        position: "Мобилограф",
                        salary: "170 000 - 250 000 ₸",
                        location: "Алматы",
                        experience: "От 3 до 6 лет",
                        date: "2024-12-010T12:00:00",
                        viewed: false
                    )
                )
                .padding(.bottom, 20)
                .shadow(radius: 20)
                Spacer()
            }
            
        }
        .listStyle(PlainListStyle())
        
    }
}

