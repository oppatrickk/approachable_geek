# Profile
Coding Project for Approachable Geek

![Flutter](https://img.shields.io/badge/Flutter-3.38.0-blue?style=plastic&logo=flutter) ![Android Studio](https://img.shields.io/badge/Android_SDK-33.0.0-green?style=plastic&logo=Android)


---

## Table of Contents
- [Demo Video](#demo-video)
- [Getting Started](#getting-started)
- [AI Usage](#ai-usage)
- [Overview](#overview)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Screenshots](#screenshots)

---

## Demo Video


[demo_video](https://github.com/user-attachments/assets/ced8634f-4e9a-456a-aae5-bef36886f60d)



---

## Getting Started
This project uses **Flutter 3.38.0**.  

<details>
  <summary>(Optional) FVM Setup</summary>

```bash
fvm install 3.38.0
fvm use 3.38.0
fvm global 3.38.0
```

</details>

```bash
# Project Setup
flutter pub get

# Run build_runner to generate code generated files
dart run build_runner build --delete-conflicting-outputs
```

After running the commands, you can launch the project in VS Code with the Mobile configuration already set up.

To build a release APK, run:

```bash
flutter build apk --release --no-tree-shake-icons --target lib/main.dart -v
```

This will generate a release-ready APK in the `build/app/outputs/flutter-apk/` directory.

## AI Usage
**All code** was written by **me** except for the following:
- `lib\core\utils\string_extension`
- `lib\core\utils\input_formatter`

These two files are for the *US Phone Input and Text formatter*. I asked AI to generate code that could parse the `E.164 format` into `US format (000) 000-0000`

## Overview
This project is a replication of a user Profile UI designed to demonstrate robust state management, local data persistence, and polished user experience patterns. The module features a view where users can view and edit their personal information, including Name, Email, Phone, About, and Profile Photo.

- **Profile Management**: View and edit user details (Name, Email, Phone, About).
- **Profile Picture**: Update profile photo using the device Camera or Gallery.
- **Form Validation**: Real-time validation to ensure data integrity before saving.
- **Smart Formatting**: Automatic phone number formatting (US E.164 standard).
- **Data Persistence**: User data is saved locally and persists across app restarts.
- **Mock Network UX**:
  - Shimmer Loading: Simulates data fetching on initial load.
  - Pull-to-Refresh: Simulates a network refresh action.

## Architecture
The app follows **clean architecture** with a **feature-first folder structure**, ensuring a clear separation of concerns.

- **Feature-First Structure:** Each feature contains its own UI, domain, and data components, keeping related code together.  
- **Clean Architecture Principles:** Business logic is decoupled from the UI, so the core functionality remains independent of presentation changes.  
- **Type-Safe Routing:** Using Auto Route, the app defines routes as strongly typed objects, eliminating string-based navigation errors.
- **Code Generation:** Reduces boilerplate for models, JSON serialization, and other repetitive tasks.  
- **Dependency Injection:** Promotes modularity, testability, and easier management of dependencies.

This setup ensures the app is **robust, maintainable, and ready for growth**, following industry best practices.

```
lib/
├── app/
├── core/
│   ├── enums/
│   ├── router/
│   ├── ui/
│   └── utils/
└── features/
    └── [feature_name]/
        ├── data/
        │   ├── datasources/
        │   ├── models/
        │   └── repositories/
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        └── presentation/
            ├── blocs/
            ├── components/
            ├── pages/
            └── widgets/
```

## State Management
The project uses the **BLoC (Business Logic Component) pattern** to manage state efficiently, ensuring a clear separation between UI and business logic.

**`ProfileBLoC`**
This BLoC serves as the central manager for the profile screen, handling user interactions and bridging the UI with the data layer. It utilizes **SharedPreferences** as a local persistent storage mechanism, ensuring that user data is retained even after the application is closed or restarted.

The BLoC handles two primary operations:
- **Get User Profile**
  - Mocking Network Latency: Upon initialization or refresh, the BLoC emits a Loading state to trigger the shimmer effect, simulating a network request.
  - Data Retrieval Strategy: It first attempts to asynchronously read keys from SharedPreferences.
    - First Run (Fallback): If the storage is empty (indicating a fresh install), the BLoC reads a default JSON file from the application assets to populate the initial user data.
    - Subsequent Runs: If local data exists, it prioritizes the saved SharedPreferences data to hydrate the UI.
- **Update User Profile**
  - Persistence: Once validated, the BLoC writes the new values to SharedPreferences, effectively "saving" the profile locally before updating the UI state to reflect the changes.

The decision to use **BLoC** was driven by several key considerations:

1. **Separation of Concerns**: By decoupling UI from business logic, components remain modular and easier to maintain.
2. **Predictable State Changes**: BLoC ensures that state transitions are explicit and controlled, reducing unexpected behaviors.
3. **Testability**: Each BLoC and Cubit can be tested independently from the UI, improving code quality and reliability.
4. **Scalability**: This architecture supports feature expansion without introducing tightly coupled code.
5. **Consistency**: Using a standardized state management approach ensures consistency across the app, making onboarding new developers easier.

This approach provides a maintainable and robust foundation for the shopping list app, balancing performance, clarity, and scalability.

## Screenshots
| Profile View | Loading (Shimmer)
| -------- | -------- | 
| <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/9789a882-9cd8-409d-9663-7720f03d4b40" /> | <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/53c2cc25-f408-4844-8945-3c7f3cd271d6" /> |

| Name | Phone |
| -------- | ------- |
| <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/211d698e-71ea-4f29-8003-7933a5d26153" /> | <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/a48f28ac-0f77-4140-8ad1-bf3eab797e53" /> |

| Email | About |
| -------- | ------- |
| <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/fbf5a5aa-19c0-420e-8976-17596663a593" /> | <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/2b4b92c6-4664-48aa-a256-c20f76f63a47" /> |

| Photo (Update) | Photo |
| -------- | ------- |
| <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/f9695083-16a0-4946-a3b3-1a0438565eb7" /> | <img width="434" height="968" alt="image" src="https://github.com/user-attachments/assets/cbe1a0ce-cc47-4832-a9dd-628313ff828a" /> |




