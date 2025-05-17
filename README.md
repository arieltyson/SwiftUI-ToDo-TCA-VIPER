# ToDo Architecture Demo: VIPER 📋

## Project Description 🎨

This project showcases a comparative implementation of a ToDo application using two modern iOS architecture patterns: VIPER and The Composable Architecture (TCA). It demonstrates how different architectural approaches can be applied to the same functionality, highlighting the strengths and patterns of each. The app provides a practical reference for iOS developers interested in architecture selection and offers clear examples of how these patterns organize code, manage state, and separate concerns.

<div align="center">
<img src="https://github.com/user-attachments/assets/ff63b610-4895-468c-b0e6-0a88072172c3" alt="ToDo App Screenshot" width="400" height="400" />
</div>

## Technologies Used 💻

This project is built with a carefully selected stack of modern iOS development tools and patterns:

- [x] Swift
- [x] SwiftUI
- [x] UIKit (in VIPER implementation)
- [x] The Composable Architecture (TCA)
- [x] VIPER Architecture
- [x] Clean Architecture
- [x] Dependency Injection
- [x] Protocol-Oriented Programming

## Architecture Overview 🏗️

The project contains two distinct implementations of the same ToDo app functionality:

```
├── VIPER Implementation
│ ├── Entity (Task model)
│ ├── Interactor (Business logic)
│ ├── Presenter (UI logic)
│ ├── View (SwiftUI integration)
│ └── Router (Navigation - implicit in this implementation)
│
└── TCA Implementation
├── State (Application state representation)
├── Action (User interactions and system events)
├── Environment (Dependencies)
├── Reducer (Business logic)
└── SwiftUI Views (UI representation)
```

## Skills Demonstrated 🥋

This project demonstrates several advanced iOS development techniques:

- **Architectural Comparison**: Side-by-side implementation of VIPER and TCA approaches to solve the same problem, facilitating learning and evaluation.
- **VIPER Implementation**: Demonstrates the classic separation of concerns with View, Interactor, Presenter, Entity, and Router components.
- **TCA Implementation**: Shows unidirectional data flow using the State/Action/Environment/Reducer pattern for predictable app behavior.
- **SwiftUI Integration**: Both architectures leverage SwiftUI for UI representation while applying different state management approaches.
- **Protocol-Oriented Design**: Extensive use of protocols to define clear boundaries between components and enable dependency injection.
- **UIKit + SwiftUI**: The VIPER implementation demonstrates how to bridge between UIKit architectural patterns and SwiftUI views.

## Running the Project 🚀

Clone the repository and open the project in Xcode. You can run either version of the app by selecting the corresponding entry point in the App configuration:

1. Choose the VIPER implementation to see the traditional iOS architecture approach.
2. Choose the TCA implementation to experience the modern functional approach.

Both implementations provide identical functionality: adding tasks, marking them as complete, and viewing your task list.

## Architecture Selection Guide 🧭

When choosing between these architectures for your own projects, consider:

**VIPER**
- Great for large teams with clear role separation
- Familiar to developers with UIKit background
- More verbose with explicit protocols and dependencies
- Works well in mixed UIKit/SwiftUI codebases

**TCA**
- Better suited for complex state management
- More testable with pure functions and predictable state
- Reduced boilerplate for simple features
- Natural fit for SwiftUI's declarative paradigm

## Next Steps 🔮

This foundation can be extended with:
- Persistence layer using CoreData, Realm, or SwiftData
- Additional UI features like task categories and due dates
- Network integration for cloud sync
- Side-by-side performance metrics
- Comprehensive testing examples for both architectures

## Contributing ⚙️

Contributions are welcome! If you have ideas for improving either architecture implementation, adding features, or enhancing the developer experience, feel free to:

1. Fork the repository  
2. Create your feature branch (`git checkout -b feature/amazing-feature`)  
3. Commit your changes (`git commit -m 'Add some amazing feature'`)  
4. Push to the branch (`git push origin feature/amazing-feature`)  
5. Open a Pull Request

## License 🪪

This project is licensed under the [MIT License](LICENSE), which allows you to use, modify, and distribute the code freely. Please attribute the original work appropriately if you use this project as a reference or starting point for your own.

---

<div align="center">
Built with ❤️ using Swift, SwiftUI, and modern iOS architecture patterns
</div>


