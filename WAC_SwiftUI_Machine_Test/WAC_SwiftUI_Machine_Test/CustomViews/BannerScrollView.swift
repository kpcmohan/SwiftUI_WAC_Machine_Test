//
//  BannerScrollView.swift
//  WAC_SwiftUI_Machine_Test
//
//  Created by Chandra Mohan on 17/08/23.
//

import SwiftUI
import Kingfisher

struct BannerScrollView: View {
    @State  var viewModel : ViewModel?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(viewModel?.bannerURLs ?? [], id: \.self) { bannerURL in
                    BannerView(bannerURL: bannerURL)
                        .frame(height: 180)
                        
                }
            }
            .padding(.horizontal, 8)
        }
    }
}


struct BannerView: View {
    let bannerURL: String
    
    var body: some View {
        
        KFImage(URL(string: bannerURL))
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
