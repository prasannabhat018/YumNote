//
//  SearchBar.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    let placeholder: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.iconColor)
                .padding(.leading, 18)
            
            TextField(placeholder, text: $searchText)
                .font(.appBody)
                .foregroundColor(Color.primaryText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 12)
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.iconColor)
                }
                .padding(.trailing, 12)
            }
        }
        .background(Color.cardBackground)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.secondaryText.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

#Preview {
    SearchBar(searchText: .constant(""), placeholder: "Search recipes")
} 