//
//  Color+Extensions.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import SwiftUI

extension Color {
    // MARK: - Background Colors
    static let appBackground = Color(red: 0.98, green: 0.96, blue: 0.92) // Warm cream background
    static let searchBarBackground = Color(red: 0.95, green: 0.93, blue: 0.89) // Slightly darker cream
    static let imagePlaceholderBackground = Color(red: 0.95, green: 0.93, blue: 0.89) // Warmer background for image placeholder
    static let cardBackground = Color.white // White background for cards
    
    // MARK: - Text Colors
    static let primaryText = Color(red: 0.4, green: 0.2, blue: 0.1) // Dark brown text
    static let secondaryText = Color(red: 0.6, green: 0.4, blue: 0.3) // Lighter brown for secondary text
    
    // MARK: - Icon Colors
    static let iconColor = Color(red: 0.6, green: 0.4, blue: 0.3) // Lighter brown for icons
    
    // MARK: - Accent Colors
    static let accentRed = Color(red: 0.8, green: 0.3, blue: 0.2) // Warmer red that matches the theme
}

// MARK: - Font Extensions
extension Font {
    static func appFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .system(size: size, weight: weight, design: .rounded)
    }
    
    static let appTitle = appFont(size: 32, weight: .bold)
    static let appHeadline = appFont(size: 20, weight: .semibold)
    static let appBody = appFont(size: 18, weight: .medium)
    static let appSubheadline = appFont(size: 16, weight: .medium)
    static let appCaption = appFont(size: 14, weight: .medium)
    static let appButton = appFont(size: 17, weight: .semibold)
} 