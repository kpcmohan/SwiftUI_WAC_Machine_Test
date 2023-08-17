//
//  CategoryColletionView.swift
//  WAC_SwiftUI_Machine_Test
//
//  Created by Chandra Mohan on 17/08/23.
//

import SwiftUI
import Kingfisher

struct CategoryCollectionView: View {
    @State  var viewModel : ViewModel?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(viewModel?.allCategories ?? [], id: \.id) { categoryObject in
                    CategoryCell(categoryObject: categoryObject)
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
}

struct CategoryCell: View {
    let categoryObject: CategoryData
    
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .foregroundColor(randomColor()) // Use the randomColor function
                    .frame(width: 60, height: 60)
                KFImage(URL(string: categoryObject.imageURL ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
            }
            
            
            Text(categoryObject.name ?? "-")
                .font(.headline)
        }
    }
    private func randomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue).opacity(0.3)
    }
}
