//
//  RecipeDetail.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import Foundation

struct RecipeDetail: Identifiable, Codable {
    let id: UUID // Same ID as the Recipe for connection
    let description: String
    let ingredients: [String]
    let instructions: [String]
    let servings: Int
    let cookingTime: String
    let prepTime: String
    let totalTime: String
    let nutritionInfo: NutritionInfo?
    let tags: [String]
    let notes: String?
    let lastModified: Date
    
    struct NutritionInfo: Codable {
        let calories: Int?
        let protein: Double?
        let carbs: Double?
        let fat: Double?
        let fiber: Double?
        let sugar: Double?
    }
    
    init(recipeId: UUID, description: String, ingredients: [String], instructions: [String], servings: Int, cookingTime: String, prepTime: String, nutritionInfo: NutritionInfo? = nil, tags: [String] = [], notes: String? = nil) {
        self.id = recipeId
        self.description = description
        self.ingredients = ingredients
        self.instructions = instructions
        self.servings = servings
        self.cookingTime = cookingTime
        self.prepTime = prepTime
        self.totalTime = "\(prepTime) + \(cookingTime)"
        self.nutritionInfo = nutritionInfo
        self.tags = tags
        self.notes = notes
        self.lastModified = Date()
    }
} 