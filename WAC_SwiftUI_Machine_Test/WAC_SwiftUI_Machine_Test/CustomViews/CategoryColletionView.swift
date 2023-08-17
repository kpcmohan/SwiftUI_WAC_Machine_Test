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
            KFImage(URL(string: categoryObject.imageURL ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.3))
                .clipShape(Circle())
                
            Text(categoryObject.name ?? "-")
                .font(.headline)
        }
    }
}
