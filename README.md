## Malik Rehan - Mobile App Engineer (Flutter & Kotlin)

Professional portfolio website built with Flutter Web, showcasing 3+ years of experience in building production mobile applications in mobility and e-commerce domains.

## 🌐 Live Demo
Check out the live site here: https://malik-rehan-portfolio.web.app

## 🛠️ Tech Stack
- **Framework:** Flutter Web
- **Language:** Dart
- **State Management:** Riverpod
- **Hosting:** Firebase Hosting
- **Architecture:** Clean Architecture (Feature-first)

## 📂 Project Structure
This project follows a professional **Clean Architecture** approach for better scalability and separation of concerns:

- **core/**: Contains global constants, themes, network configurations, and shared utility functions.
- **features/**: Organized by functionality (e.g., `home` feature):
  - **data/**: Handles API data sources, models, and repository implementations.
  - **domain/**: Contains business logic with UseCases and Repository interfaces.
  - **presentation/**: Manages the UI layer:
    - `controller/`: **Riverpod** state management logic (e.g., `home_controller.dart`, `home_state.dart`).
    - `pages/`: Main UI screens.
    - `widgets/`: Feature-specific reusable components.

## 📱 Professional Background
I am a Mobile App Engineer with a proven track record of:
- Shipping apps serving **10,000+ active users**.
- Implementing **Real-time Location Tracking** (Pusher, Google Maps).
- Building **Offline-first systems** with Hive and Isar local storage.
- Full lifecycle management from **Figma-to-Code** to Play Store/App Store deployment.

## 🛠️ Installation & Setup
To run this project locally:

1. **Clone the repo:**
   ```bash
   git clone https://github.com/RehanMalik213/malik-rehan-portfolio.git
