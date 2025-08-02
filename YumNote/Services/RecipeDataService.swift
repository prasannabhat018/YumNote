//
//  RecipeDataService.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import Foundation
import Combine

// Protocol for recipe data operations
protocol RecipeDataServiceProtocol {
    func fetchRecipes() -> AnyPublisher<[Recipe], Error>
    func searchRecipes(query: String) -> AnyPublisher<[Recipe], Error>
    func addRecipe(_ recipe: Recipe) -> AnyPublisher<Recipe, Error>
    func updateRecipe(_ recipe: Recipe) -> AnyPublisher<Recipe, Error>
    func deleteRecipe(id: UUID) -> AnyPublisher<Void, Error>
}

// Mock implementation for development
class MockRecipeDataService: RecipeDataServiceProtocol {
    private var recipes: [Recipe] = [
        Recipe(title: "Spicy Chicken Stir-Fry", preparationTime: "30 min", imageName: "stirfry", category: "Asian", difficulty: "Medium"),
        Recipe(title: "Creamy Tomato Pasta", preparationTime: "45 min", imageName: "pasta", category: "Italian", difficulty: "Easy"),
        Recipe(title: "Avocado Toast with Egg", preparationTime: "20 min", imageName: "avocado_toast", category: "Breakfast", difficulty: "Easy"),
        Recipe(title: "Beef Tacos", preparationTime: "60 min", imageName: "tacos", category: "Mexican", difficulty: "Medium")
    ]
    
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        return Just(recipes)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func searchRecipes(query: String) -> AnyPublisher<[Recipe], Error> {
        let filteredRecipes = recipes.filter { recipe in
            recipe.title.localizedCaseInsensitiveContains(query)
        }
        return Just(filteredRecipes)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func addRecipe(_ recipe: Recipe) -> AnyPublisher<Recipe, Error> {
        recipes.append(recipe)
        return Just(recipe)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func updateRecipe(_ recipe: Recipe) -> AnyPublisher<Recipe, Error> {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index] = recipe
        }
        return Just(recipe)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func deleteRecipe(id: UUID) -> AnyPublisher<Void, Error> {
        recipes.removeAll { $0.id == id }
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
} 