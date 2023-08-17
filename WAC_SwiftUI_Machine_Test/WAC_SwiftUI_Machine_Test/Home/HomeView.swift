//
//  HomeView.swift
//  WAC_SwiftUI_Machine_Test
//
//  Created by Chandra Mohan on 17/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var isLoading = true
    @State private var searchText = ""

    var body: some View {
        VStack {
            if isLoading {
                ProgressView(String.Texts.loading)
            } else {
                GeometryReader { geometry in
                    
                    ScrollView {
                        SearchBar(text: $searchText)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal, 16)
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.orderArray, id: \.self) { sectionType in
                                viewModel.createView(for: sectionType,  screenWidth: geometry.size.width)
                                    .id(sectionType)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
              viewModel.fetchData {
                isLoading = false
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




