//
//  RecipeListViewModel.swift
//  YumNote
//
//  Created by Prasanna Bhat on 02/08/25.
//

import Foundation
import Combine

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let dataService: RecipeDataServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(dataService: RecipeDataServiceProtocol = MockRecipeDataService()) {
        self.dataService = dataService
        setupSearchSubscription()
        loadRecipes()
    }
    
    private func setupSearchSubscription() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchQuery in
                self?.performSearch(query: searchQuery)
            }
            .store(in: &cancellables)
    }
    
    func loadRecipes() {
        isLoading = true
        errorMessage = nil
        
        dataService.fetchRecipes()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] recipes in
                    self?.recipes = recipes
                }
            )
            .store(in: &cancellables)
    }
    
    private func performSearch(query: String) {
        if query.isEmpty {
            loadRecipes()
        } else {
            isLoading = true
            errorMessage = nil
            
            dataService.searchRecipes(query: query)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] completion in
                        self?.isLoading = false
                        if case .failure(let error) = completion {
                            self?.errorMessage = error.localizedDescription
                        }
                    },
                    receiveValue: { [weak self] recipes in
                        self?.recipes = recipes
                    }
                )
                .store(in: &cancellables)
        }
    }
    
    func addRecipe(_ recipe: Recipe) {
        dataService.addRecipe(recipe)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] _ in
                    self?.loadRecipes()
                }
            )
            .store(in: &cancellables)
    }
    
    func deleteRecipe(id: UUID) {
        dataService.deleteRecipe(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] _ in
                    self?.loadRecipes()
                }
            )
            .store(in: &cancellables)
    }
} 