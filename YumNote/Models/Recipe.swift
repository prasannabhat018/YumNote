//
//  Recipe.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id = UUID()
    let title: String
    let preparationTime: String
    let imageName: String
    let dateCreated: Date
    
    // Optional fields for basic categorization
    let category: String?
    let difficulty: String?
    
    init(title: String, preparationTime: String, imageName: String, category: String? = nil, difficulty: String? = nil) {
        self.title = title
        self.preparationTime = preparationTime
        self.imageName = imageName
        self.category = category
        self.difficulty = difficulty
        self.dateCreated = Date()
    }
} 