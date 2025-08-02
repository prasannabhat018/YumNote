//
//  ContentView.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                headerView
                searchBarView
                recipeListView
                Spacer()
            }
            .background(Color.appBackground)
            .navigationBarHidden(true)
            .overlay(addRecipeButtonOverlay)
        }
    }
    
    // MARK: - Header Section
    private var headerView: some View {
        Text("YumNote")
            .font(.appTitle)
            .foregroundColor(Color.primaryText)
            .padding(.top, 12)
            .padding(.bottom, 12)
    }
    
    // MARK: - Search Bar Section
    private var searchBarView: some View {
        SearchBar(searchText: $viewModel.searchText, placeholder: "Search recipes")
    }
    
    // MARK: - Recipe List Section
    private var recipeListView: some View {
        Group {
            if viewModel.isLoading {
                loadingView
            } else if let errorMessage = viewModel.errorMessage {
                errorView(message: errorMessage)
            } else if viewModel.recipes.isEmpty {
                emptyStateView
            } else {
                recipeScrollView
            }
        }
    }
    
    // MARK: - Loading State
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
                .scaleEffect(1.2)
            Spacer()
        }
    }
    
    // MARK: - Error State
    private func errorView(message: String) -> some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
                Text("Error")
                    .font(.appHeadline)
                    .foregroundColor(Color.primaryText)
                    .padding(.top, 8)
                Text(message)
                    .font(.appSubheadline)
                    .foregroundColor(Color.secondaryText)
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
            }
            .padding()
            Spacer()
        }
    }
    
    // MARK: - Empty State
    private var emptyStateView: some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "book.closed")
                    .font(.system(size: 40))
                    .foregroundColor(Color.iconColor)
                Text("No Recipes Found")
                    .font(.appHeadline)
                    .foregroundColor(Color.primaryText)
                    .padding(.top, 8)
                Text("Start by adding your first recipe!")
                    .font(.appSubheadline)
                    .foregroundColor(Color.secondaryText)
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
            }
            .padding()
            Spacer()
        }
    }
    
    // MARK: - Recipe Scroll View
    private var recipeScrollView: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.recipes) { recipe in
                    RecipeCard(recipe: recipe)
                        .onTapGesture {
                            handleRecipeTap(recipe)
                        }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 100) // Add padding for the floating button
        }
    }
    
    // MARK: - Add Recipe Button Overlay
    private var addRecipeButtonOverlay: some View {
        VStack {
            Spacer()
            AddRecipeButton {
                handleAddRecipeTap()
            }
        }
    }
    
    // MARK: - Action Handlers
    private func handleRecipeTap(_ recipe: Recipe) {
        // TODO: Navigate to recipe detail
        print("Tapped recipe: \(recipe.title)")
    }
    
    private func handleAddRecipeTap() {
        // TODO: Navigate to add recipe form
        print("Add new recipe tapped")
    }
}

#Preview {
    ContentView()
}
