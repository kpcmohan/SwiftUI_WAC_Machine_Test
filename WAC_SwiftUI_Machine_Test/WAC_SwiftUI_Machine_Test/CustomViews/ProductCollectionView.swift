//
//  ProductCollectionView.swift
//  WAC_SwiftUI_Machine_Test
//
//  Created by Chandra Mohan on 17/08/23.
//

import SwiftUI

struct ProductCollectionView: View {
    let products: [Products]
    let screenWidth: CGFloat
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(products, id: \.id) { productObject in
                    ProductCell(productObject: productObject)
                        .frame(width: screenWidth / 2.3, height: 320)
                }
            }
            .padding(16)
        }
    }
}
struct ProductCollectionView_Preview: PreviewProvider {
    static var previews: some View {
        ProductCollectionView(products: [Products(id: 1, name: "Sony 4K Ultra HD Android Smart LED TV KD43X7500F 43", image: "https://i.ibb.co/sj39CdF/750679-01-jpg-300-Wx300-H.jpg", actualPrice: "$ 1200", offerPrice: "$ 1000", offer: 10, isExpress: true)], screenWidth: 350)
    }
}


struct ProductCell: View {
    let productObject: Products
    
    var body: some View {
        VStack {
            //Spacer()
            HStack{
                if let offer = productObject.offer, offer > 0 {
                    Text("\(offer)% \(String.Texts.off)")
                        .padding(4)
                        .background(Color.red)
                        .font(.caption)
                    
                    
                }
                Spacer()
                Image(systemName: String.SystemImages.heart) // Barcode scanner icon
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                
            }
            .padding(.top, 16)
            
            Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: productObject.image ?? "")!))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Spacer()
            HStack{
                if productObject.isExpress ?? false {
                    Image(systemName: String.SystemImages.shippingbox)
                        .foregroundColor(.green)
                        .padding(.top, 2)
                }
                Spacer()
            }.padding(.leading , 8)
            HStack{
                if let actualPrice = productObject.actualPrice, let offerPrice = productObject.offerPrice, actualPrice != offerPrice {
                    VStack{
                        Text(actualPrice)
                            .foregroundColor(.gray)
                            .strikethrough()
                            .font(.subheadline)
                        Text(offerPrice)
                            .font(Font.body)
                    }
                } else {
                    VStack{
                        Text(productObject.offerPrice ?? "")
                            .font(.headline)
                    }
                }
                Spacer()
            }
            .padding(.leading, 8)
            Spacer()
            HStack{
                Text(productObject.name ?? "-")
                    .font(Font.headline)
                    .lineLimit(2)
                    
                
                Spacer()
            }
            .padding([.leading,.bottom],8)
            
            
        }
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

