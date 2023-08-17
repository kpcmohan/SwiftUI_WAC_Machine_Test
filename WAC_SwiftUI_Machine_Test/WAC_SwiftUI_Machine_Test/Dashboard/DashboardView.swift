//
//  DashboardView.swift
//  WAC_SwiftUI_Machine_Test
//
//  Created by Chandra Mohan on 18/08/23.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: String.SystemImages.home)
                        Text(String.Texts.home)
                    }
                    .tag(0)
                Text(String.Texts.categories)
                    .tabItem {
                        Image(systemName: String.SystemImages.grid)
                        Text(String.Texts.categories)
                    }
                    .tag(1)
                Text(String.Texts.offers)
                    .tabItem {
                        Image(systemName: String.SystemImages.percent)
                        Text(String.Texts.offers)
                    }
                    .tag(2)
                Text(String.Texts.cart)
                    .tabItem {
                        Image(systemName: String.SystemImages.cart)
                        Text(String.Texts.cart)
                    }
                    .tag(3)
                Text(String.Texts.account)
                    .tabItem {
                        Image(systemName: String.SystemImages.person)
                        Text(String.Texts.account)
                    }
                    .tag(4)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
