//
//  JobCellView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 05.02.2024.
//

import Foundation
import SwiftUI

struct JobCellView: View {
    var model: JobModel
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(model.companyImage)
                Text(model.companyName).font(.system(size: 13))
                Spacer()
                Image(systemName: "heart").foregroundColor(Color.fromHex("38BDF8"))
            }
            HStack {
                VStack (alignment: .leading){
                    Text(model.position).font(.system(size: 14))
                    Spacer().frame(height: 5)
                    Text(model.salary).font(.system(size: 15))
                }
                .fontWeight(.bold)
            }
            Spacer().frame(height: 5)
            HStack {
                Image(systemName: "mappin.circle.fill")
                Text(model.location)
                Text("·")
                Image(systemName: "suitcase.fill")
                Text(model.experience)
            }
            .font(.system(size: 14))
            .foregroundColor(Color.gray)
            HStack {
                Button("Полный рабочий день", action: {})
                    .background(Color.fromHex("334155"))
                    .buttonStyle(.bordered)
                    .cornerRadius(10)
                Button("Гибкий график", action: {})
                    .background(Color.fromHex("334155"))
                    .buttonStyle(.bordered)
                    .cornerRadius(10)
            }
            .padding(.top, 5)
            .font(.system(size: 13))
            HStack {
                Button(action: {}) {
                    Text("Отправить отклик")
                        .frame(maxWidth: .infinity)
                }
                .background(Color.fromHex("38BDF8"))
                .buttonStyle(.bordered)
                .controlSize(.large)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 5)
            .font(.system(size: 15))
            Spacer()
            HStack {
                Image(systemName: "calendar")
                Text(model.date)
                Spacer()
                Image(systemName: "eye.fill")
                Text("Просмотрено")
            }
            .font(.system(size: 12))
            .foregroundColor(Color.gray)
           
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.white)
        .background(
            Color.fromHex("1E293B")
        ).clipShape(RoundedRectangle(cornerRadius: 20))
        .scaleEffect(1)
        .animation(.linear(duration: 1), value: 1)
        
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
                        date: "28 сентября"
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
                        experience: "От 1 до 3 лет",
                        date: "28 сентября"
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
                        experience: "От 1 до 3 лет",
                        date: "28 сентября"
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

