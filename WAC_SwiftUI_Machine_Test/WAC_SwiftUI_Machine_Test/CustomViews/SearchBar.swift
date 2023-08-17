//
//  SearchBar.swift
//  WAC_SwiftUI_Machine_Test
//
//  Created by Chandra Mohan on 17/08/23.
//

import SwiftUI


struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField("Search.", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                
                .padding(.horizontal, 4)
            
            Image(systemName: "barcode.viewfinder")
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
        
       
    }
    
}
