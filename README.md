# Stack Food

Stack Food is a modern Flutter application designed for food-related services, emphasizing a clean architecture and robust state management. It showcases best practices in Flutter development, including API integration, local data persistence, and a modular feature-driven structure.

##Screenshot 
![Alt Text](https://github.com/user-attachments/assets/04e7579e-113e-479d-a973-2e9b8ed6f30d)


## Libraries Used

-   `cupertino_icons`: ^1.0.8
-   `google_fonts`: ^6.2.1
-   `flutter_bloc`: ^9.1.1
-   `fpdart`: ^1.1.1
-   `get_it`: ^8.0.3
-   `hive`: ^2.2.3
-   `internet_connection_checker_plus`: ^2.7.2
-   `http`: ^1.4.0
-   `flutter_dotenv`: ^5.2.1

## Folder Structure

```
stack_food/
├── lib/
│   ├── init_dependencies.dart
│   ├── main.dart
│   ├── core/
│   │   ├── common/
│   │   ├── constants/
│   │   │   └── api_constants.dart
│   │   ├── error/
│   │   │   └── failure.dart
│   │   ├── theme/
│   │   │   ├── app_pallete.dart
│   │   │   ├── app_text_styles.dart
│   │   │   └── app_theme.dart
│   │   ├── usecases/
│   │   │   └── usecase.dart
│   │   └── utils/
│   └── features/
│       ├── Home/
│       │   ├── Data/
│       │   ├── Domain/
│       │   └── Presentation/
│       └── Other/

```

## Architecture Overview

This project follows a **Clean Architecture** approach, emphasizing separation of concerns for testability, maintainability, and scalability. It's structured into distinct layers:

1.  **Core Layer (`lib/core`)**:
    Contains foundational, shared elements independent of specific features. This includes `common` utilities, `constants` (like API endpoints), `error` handling (`failure.dart`), `theme` definitions, abstract `usecases` for business rules, and general `utils`.

2.  **Features Layer (`lib/features`)**:
    Implements main functionalities, with each sub-directory representing a self-contained feature (e.g., `Home`). Each feature typically has:
    *   **`Data`**: `models` for data structure, `datasources` for external interactions (remote APIs, local Hive), and `repositories/implementations` for data fetching and mapping.
    *   **`Domain`**: Pure Dart `entities`, abstract `repositories/abstracts` (interfaces), and specific `usecases` for feature business logic.
    *   **`Presentation`**: UI components (`pages`/`screens`, `widgets`) and state management (`blocs`/`cubits`) that interact with use cases.

3.  **Dependency Injection (`init_dependencies.dart`)**:
    Sets up and registers all dependencies using `get_it`, promoting loose coupling and testability.

4.  **Main Application Entry (`main.dart`)**:
    Initializes services, sets up dependency injection, configures the root widget, and defines initial routes.

This layered approach ensures business logic independence from UI and data implementation, making the application adaptable, testable, and scalable.

## Developer Guidelines

To get this project up and running on your local machine, follow these steps:

### Prerequisites

-   Flutter SDK (version 3.8.1 or higher)
-   Dart SDK (comes with Flutter SDK)
-   Git

### Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/Tahsin007/Food-App-Flutter-Bloc-Clean-Architecture.git
    cd stack_food
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Create a `.env` file:**

    Create a file named `.env` in the root of the project (next to `pubspec.yaml`) and add your environment variables. For example:

    ```
    API_KEY=your_api_key_here
    BASE_URL=your_base_url_here
    ```

    (Adjust variables as per your project's needs)

4.  **Run the application:**

    ```bash
    flutter run
    ```

    This will launch the application on your connected device or emulator.

### Running Tests

To run the widget tests:

```bash
flutter test
```

### Building for Production

To build the application for a specific platform (e.g., Android):

```bash
flutter build apk
```

For iOS:

```bash
flutter build ios
```

(Refer to Flutter documentation for more build options.)
