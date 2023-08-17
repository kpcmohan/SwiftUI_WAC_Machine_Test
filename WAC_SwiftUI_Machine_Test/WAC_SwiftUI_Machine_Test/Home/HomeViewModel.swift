//
//  HomeViewModel.swift
//  WAC_SwiftUI_Machine_Test
//
//  Created by Chandra Mohan on 17/08/23.
//

import Foundation
import SwiftUI
class ViewModel: ObservableObject {
    @Published var homeDataModel: HomeData?
    @Published var orderArray = [String()]
    @Published var bannerURLs = [String()]
    @Published var allCategories = [CategoryData]()
    @Published var allProducts = [Products]()
    
    func fetchData(completion: @escaping () -> Void) {
        let urlString = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [self] data, _, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(HomeData.self, from: data)
                    let homeData = decodedData.homeData
                    
                    // Fetch Order Array
                    DispatchQueue.main.async {
                        self.orderArray = homeData.map { $0.type }
                        self.homeDataModel = decodedData
                        
                        
                        
                        // Fetch Banner urls
                        let banners = homeData.filter { $0.type == .Keys.banners }
                        self.bannerURLs = banners.flatMap { $0.values.map { $0.banner_url ?? "" } }
                        
                        let categories = homeData.filter { $0.type == .Keys.category }
                        let products = homeData.filter { $0.type == .Keys.products }
                        
                        self.allCategories = categories.flatMap { $0.values.map { CategoryData(id: $0.id, name: $0.name, imageURL: $0.image_url) } }
                        
                        self.allProducts = products.flatMap { $0.values.map { Products(id: $0.id, name: $0.name, image: $0.image, actualPrice: $0.actual_price, offerPrice: $0.offer_price, offer: $0.offer, isExpress: $0.is_express) } }
                        
                        completion()
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion()
                    }
                    print("Error decoding data: \(error)")
                }
            }else{
                DispatchQueue.main.async {
                    completion()
                }
            }
        }.resume()
    }
    
    func createView(for type: String,screenWidth: CGFloat) -> AnyView {
        switch type {
        case .Keys.category:
            return AnyView(
                CategoryCollectionView(viewModel: self)
                    .frame(height: 100)
            )
        case .Keys.banners:
            return AnyView(
                
                BannerScrollView(viewModel : self)
                    .frame(height: 180)
                
            )
        case .Keys.products:
            return AnyView(
                
                ProductCollectionView(products: self.allProducts, screenWidth: screenWidth)
                    .frame(height: 330)
            )
        default:
            return AnyView(
                Color.red
                    .frame(height: 100)
            )
        }
    }
}
