# Flutter Bottom Navigation with Dynamic News Screen

This Flutter project implements a bottom navigation bar with three main screens (Home, Rewards, Profile). Additionally, it allows users to navigate to a **News Screen** when tapping a container on the Home Screen, while keeping the bottom navigation bar visible.

## Features
- **Bottom Navigation Bar** with Home, Rewards, and Profile screens.
- **News Screen** that appears dynamically when clicking the "Read News" container on the Home screen.
- **Persistent Bottom Navigation Bar**, even when switching to the News screen.
- **Back to Home** functionality from News screen.

## Video
https://github.com/user-attachments/assets/4000c4c3-b59e-4697-a828-7488400fd182



## Installation
### Prerequisites
- Flutter SDK installed
- Android Studio or VS Code

### Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/flutter-bottom-nav-news.git
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter-bottom-nav-news
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Project Structure
```
lib/
├── main.dart
├── bottom_nav.dart
├── home.dart
├── news.dart
├── profile.dart
└── rewards.dart
```

## How It Works
- **HomePage** contains a clickable container for "Read News".
- When tapped, it updates the `BottomNav` state to show the `NewsPage`.
- The **bottom navigation bar remains visible** while switching between screens.
- Clicking "Back to Home" returns to the Home Screen.

## Dependencies Used
- `flutter/material.dart`
- `flutter/cupertino.dart`

## Contributing
Feel free to contribute by submitting a pull request.

