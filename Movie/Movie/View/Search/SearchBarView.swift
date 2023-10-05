//
//  SearchBarView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-29.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
  
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.black : Color.blue
                )
            TextField("Search by name..." , text: $searchText )
                .foregroundColor(Color.white)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x:10)
                        .foregroundColor(Color.blue)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                    
                    
                )
        }
        .font(.headline)
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
        .fill(Color.gray))
            
//                .overlay(
//                    ZStack {
//                        Image.CancelIcon
//                            .foregroundColor(.white)
//                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
//                            .onTapGesture {
//                                UIApplication.shared.endEditing()
//                                searchText = ""
//                            }
//                        Image.SearchIcon
//                            .opacity(searchText.isEmpty ? 1.0 : 0.0)
//                            .onTapGesture {
//                                searchText = ""
//                            }
//                    } , alignment: .trailing)
//                .padding()
//                .foregroundColor(.AppGrayColor2)
//                .background(
//                    RoundedRectangle(cornerRadius: 50)
//                        .fill(Color.AppGrayColor1)
//                        .shadow(color: Color.white, radius: 5, x: 0, y: 0)
//                )
//                .padding()
     //   }
        
            .preferredColorScheme(.dark)
            .background(Color.AppBackgroundColor)
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
