//
//  AddRecipeButton.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import SwiftUI

struct AddRecipeButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: "plus")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.white)
                Text("Add New Recipe")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            .padding(.vertical, 16)
            .background(Color.accentRed)
            .cornerRadius(30)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

#Preview {
    VStack {
        Spacer()
        AddRecipeButton {
            print("Add recipe tapped")
        }
    }
} 
