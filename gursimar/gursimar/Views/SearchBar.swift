//
//  SearchBar.swift
//  gursimar
//
//  Created by Gursimar on 27/11/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)

            TextField("Search", text: $searchText)
                .padding(.vertical, 10)
                .padding(.trailing, 8)
                .onTapGesture {
                    isSearching = true
                }

            if isSearching {
                Button {
                    isSearching = false
                    searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
            }
        }
        .background(
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.7))
                    .frame(height: 36)
                
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
                .opacity(searchText.isEmpty ? 0 : 1)
            }
        )
        .padding(.horizontal)
        .navigationBarHidden(isSearching)
    }
}

#Preview {
    SearchBar(searchText: $searchText, isSearching: $isSearching).padding(.trailing, 0)
}
