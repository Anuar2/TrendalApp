//
//  JobView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 05.02.2024.
//

import SwiftUI

struct JobView: View {
    var posts: [JobModel]
    
    var body: some View {
        List {
            ForEach(mocks, id: \.id) { mock in
                JobCellView(model: mock)
            }
        }
        .listStyle(.plain)
    }
}


struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView(posts: mocks)

    }
}

private var mocks: [JobModel] = [
    JobModel(
        id: 1,
        companyImage: "atlassian",
        companyName: "Airba Fresh Food Tech Company",
        position: "Мобилограф",
        salary: "170 000 - 250 000 ₸",
        location: "Алматы",
        experience: "От 1 до 3 лет",
        date: "28 сентября",
        viewed: true
    ),
    JobModel(
        id: 2,
        companyImage: "atlassian",
        companyName: "Airba Fresh Food Tech Company",
        position: "Мобилограф",
        salary: "170 000 - 250 000 ₸",
        location: "Алматы",
        experience: "От 1 до 3 лет",
        date: "28 сентября",
        viewed: true
    ),
    JobModel(
        id: 3,
        companyImage: "atlassian",
        companyName: "Airba Fresh Food Tech Company",
        position: "Мобилограф",
        salary: "170 000 - 250 000 ₸",
        location: "Алматы",
        experience: "От 1 до 3 лет",
        date: "28 сентября",
        viewed: true
    ),
    JobModel(
        id: 4,
        companyImage: "atlassian",
        companyName: "Airba Fresh Food Tech Company",
        position: "Мобилограф",
        salary: "170 000 - 250 000 ₸",
        location: "Алматы",
        experience: "От 1 до 3 лет",
        date: "28 сентября",
        viewed: true
    )
]

