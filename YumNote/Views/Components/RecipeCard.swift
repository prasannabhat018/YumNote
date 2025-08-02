//
//  RecipeCard.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 16) {
            // Recipe Image
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.imagePlaceholderBackground)
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: getSystemImage(for: recipe.imageName))
                        .font(.system(size: 30))
                        .foregroundColor(Color.iconColor)
                )
            
            // Recipe Details
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.title)
                    .font(.appBody)
                    .foregroundColor(Color.primaryText)
                    .lineLimit(2)
                
                Text(recipe.preparationTime)
                    .font(.appCaption)
                    .foregroundColor(Color.secondaryText)
            }
            
            Spacer()
        }
        .padding(8)
        .background(Color.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
    
    private func getSystemImage(for imageName: String) -> String {
        switch imageName {
        case "stirfry":
            return "fork.knife"
        case "pasta":
            return "circle.fill"
        case "avocado_toast":
            return "leaf.fill"
        case "tacos":
            return "tortilla"
        default:
            return "photo"
        }
    }
}

#Preview {
    RecipeCard(recipe: Recipe(title: "Spicy Chicken Stir-Fry", preparationTime: "30 min", imageName: "stirfry"))
        .padding()
} 