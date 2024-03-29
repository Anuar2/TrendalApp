//
//  JobsView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 05.02.2024.
//

import SwiftUI

struct JobsView: View {
    @State var posts: [JobModel]
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(mocks, id: \.id) { mock in
                        JobCellView(model: mock)
                    }
                }
            }
            .padding()
            .background(Color.fromHex("#0F172A"))
        }.searchable(text: $searchText)

    }
}


struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        JobsView(posts: mocks)

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
        date: "2024-12-010T12:00:00",
        viewed: false
    ),
    JobModel(
        id: 2,
        companyImage: "atlassian",
        companyName: "Airba Fresh Food Tech Company",
        position: "Мобилограф",
        salary: "170 000 - 250 000 ₸",
        location: "Алматы",
        experience: "От 1 до 3 лет",
        date: "2024-12-010T12:00:00",
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
        date: "2024-12-010T12:00:00",
        viewed: false
    ),
    JobModel(
        id: 4,
        companyImage: "atlassian",
        companyName: "Almaz",
        position: "Мобилограф",
        salary: "170 000 - 250 000 ₸",
        location: "Алматы",
        experience: "От 1 до 3 лет",
        date: "2024-12-010T12:00:00",
        viewed: true
    )
]

