# YumNote 📱

A beautiful, modern iOS recipe management app built with SwiftUI and MVVM architecture.

## 🍳 Features

- **Recipe Management**: Create, view, and organize your personal recipes
- **Search & Filter**: Find recipes quickly with real-time search
- **Modern UI**: Clean, warm design with System Rounded fonts
- **Modular Architecture**: Scalable MVVM pattern for easy maintenance
- **Responsive Design**: Optimized for all iOS devices

## 🏗️ Architecture

### **MVVM Pattern**
- **Models**: `Recipe` (lightweight) and `RecipeDetail` (comprehensive)
- **ViewModels**: `RecipeListViewModel` with Combine for reactive updates
- **Views**: Modular SwiftUI components
- **Services**: Protocol-based data layer for easy testing and extension

### **Key Components**
- `ContentView`: Main app interface
- `RecipeCard`: Reusable recipe display component
- `SearchBar`: Custom search with debouncing
- `AddRecipeButton`: Floating action button
- `RecipeDataService`: Mock data service (ready for real storage)

## 🎨 Design System

### **Colors**
- **Background**: Warm cream (`#FAF5EB`)
- **Primary Text**: Dark brown (`#663319`)
- **Secondary Text**: Light brown (`#996655`)
- **Accent**: Warm red (`#CC4D33`)

### **Typography**
- **Font**: System Rounded (friendly, approachable)
- **Hierarchy**: Title (32pt), Headline (20pt), Body (18pt), Caption (14pt)

## 🚀 Getting Started

### **Prerequisites**
- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

### **Installation**
1. Clone the repository
2. Open `YumNote.xcodeproj` in Xcode
3. Build and run on your device or simulator

## 📁 Project Structure

```
YumNote/
├── Models/
│   ├── Recipe.swift
│   └── RecipeDetail.swift
├── ViewModels/
│   └── RecipeListViewModel.swift
├── Services/
│   └── RecipeDataService.swift
├── Views/
│   └── Components/
│       ├── RecipeCard.swift
│       ├── SearchBar.swift
│       └── AddRecipeButton.swift
├── Extensions/
│   └── Color+Extensions.swift
└── ContentView.swift
```

## 🔧 Technical Details

### **Dependencies**
- SwiftUI (UI Framework)
- Combine (Reactive Programming)
- Foundation (Core Functionality)

### **Data Flow**
1. `RecipeDataService` provides data operations
2. `RecipeListViewModel` manages state and business logic
3. SwiftUI views observe and display data reactively

### **Future Enhancements**
- Core Data integration for local storage
- CloudKit sync for cross-device access
- Recipe detail views
- Image upload and management
- Recipe categories and filtering
- Nutritional information tracking

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Prasanna Bhat**
- Created with ❤️ for recipe enthusiasts

---

*Built with SwiftUI and modern iOS development practices* 