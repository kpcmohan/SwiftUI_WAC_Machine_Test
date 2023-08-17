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
                        .frame(width: screenWidth / 2.3, height: 330)
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
            OfferAndFavView(productObject: productObject)
            
            if let imageUrl = productObject.image,
               let url = URL(string: imageUrl),
               let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            }
            
            expressView(productObject: productObject)
            
            PriceView(productObject: productObject)
            Spacer()
            HStack {
                Text(productObject.name ?? "-")
                    .font(Font.headline)
                    
                Spacer()
            }
            .padding([.leading,.bottom], 8)
            
           AddToCartButton()
                .padding(.bottom, 8)
            
            
        }
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}



struct OfferAndFavView: View {
    var productObject : Products
    var body: some View {
        HStack {
            if let offer = productObject.offer, offer > 0 {
                Text("\(offer)% \(String.Texts.off)")
                    .padding(4)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .font(.caption)
            }
            Spacer()
            Image(systemName: String.SystemImages.heart)
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
        .padding(.top, 16)
    }
}

struct expressView: View {
    var productObject : Products
    var body: some View {
        HStack {
            if productObject.isExpress ?? false {
                Image(systemName: String.SystemImages.shippingbox)
                    .foregroundColor(.green)
                    .padding(.top, 2)
            }
            Spacer()
        }
        .padding(.leading , 8)
    }
}

struct PriceView: View {
    var productObject : Products
    var body: some View {
        HStack {
            if let actualPrice = productObject.actualPrice,
               let offerPrice = productObject.offerPrice,
               actualPrice != offerPrice {
                VStack {
                    Text(actualPrice)
                        .foregroundColor(.gray)
                        .strikethrough()
                        .font(.subheadline)
                    Text(offerPrice)
                        .font(Font.body)
                }
            } else {
                VStack {
                    Text(productObject.offerPrice ?? "")
                        .font(.headline)
                }
            }
            Spacer()
        }
        .padding(.leading, 8)
    }
}

struct AddToCartButton: View {
    var body: some View {
        Button(String.Texts.add, action: {})
            .padding(.horizontal, 32)
            .padding(.vertical, 4)
            .background(Color.green)
            .cornerRadius(5)
            .foregroundColor(.white)
            .font(.system(size: 14))
    }
}
