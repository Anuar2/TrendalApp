//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var smsToken: String = ""
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.red
    }
    
    
    var body: some View {
        if isOnboarding {
            PhoneRegisterView()
        } else {
            TabView {
                JobsView(posts: [])
                    .tabItem {
                        Label("Вакансии", systemImage: "suitcase.fill")
                    }
                
                JobsView(posts: [])
                    .tabItem {
                        Label("Отклики", systemImage: "chart.line.uptrend.xyaxis.circle.fill")
                    }
                
                JobsView(posts: [])
                    .tabItem {
                        Label("Избранное", systemImage: "heart")
                    }
                
                JobsView(posts: [])
                    .tabItem {
                        Label("Профиль", systemImage: "person.crop.circle")
                    }
            }.accentColor(.primaryShade)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
