# 🐾 Pet Finder App
---

## 🖼️ Screenshots


| Details Screen                       | Home Screen                           | Favorite Screen                        |
|-------------------------------------|--------------------------------------|------------------------------------|
| (![1](https://github.com/user-attachments/assets/d201bb9d-55d8-4ffa-8e5f-65335de4ea1d) | (![2](https://github.com/user-attachments/assets/bacadbf1-cc18-4212-b206-85979a72d648) | (![3](https://github.com/user-attachments/assets/51c10774-6af2-4738-aeac-e12859702420) |

---

A modern **Flutter** application for finding and discovering pets — built with **Clean Architecture** principles and powered by **BLoC state management**.

---

## ✨ Features

- 🐶 **Onboarding Experience:** Smooth introduction for new users
- 🐕 **Pet Discovery:** Browse and explore available pets with details
- 🐈 **Pet Categories:** Filter pets by various types
- 🔍 **Search Functionality:** Advanced search and filters
- 📚 **Breed Information:** Detailed breed models and info
- 📱 **Responsive Design:** Adaptive UI for all screen sizes
- ⚡ **Offline Caching:** Cached images for faster performance

---

## 🏗️ Architecture

This project follows **Clean Architecture** for better scalability and maintainability.

```
lib/
├── core/                                           
│   ├── api/                         
│   │   ├── api_consumer.dart
│   │   ├── api_interceptor.dart
│   │   ├── api_keys.dart
│   │   ├── dio_consumer.dart
│   │   └── end_point.dart
│   ├── database/                     
│   │   └── caache_helper.dart
│   ├── utils/                     
│   │   ├── colors.dart
│   │   ├── styles.dart
│   │ 
│   └── widgets/                     
├── features/
│   ├── home/                        # Home feature
│   │   ├── data/
│   │   │   ├── api_sources/
│   │   │   ├── mappers/
│   │   │   ├── models/
│   │   │   └── repos_impl/
│   │   ├── domain/
│   │   │   ├── entites/
│   │   │   └── repos/
│   │   ├── presentation/
│   │   │   ├── cubit/
│   │   │   └── screens/
│   │   │       └── widgets/
│   └── splash/                     
│       └── presentation/
│           └── screens/
```

---

## 🚀 Getting Started

### ✅ Prerequisites
- Flutter SDK **3.8.1+**
- Dart SDK (included with Flutter)
- Android Studio / VS Code
- iOS development tools (optional for iOS builds)




## 🧪 Code Generation

After making changes to annotated files, run:

**Watch mode (auto rebuild):**
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

**One-time build:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📂 Project Structure

### 🧠 Features
Each feature is self-contained and includes:
- **Data Layer:** APIs, Models, Mappers, Repositories Impl
- **Domain Layer:** Entity,  Repositories
- **Presentation Layer:** UI, Widgets, and Cubits

---




## 🔧 Configuration

### 🌍 API Configuration
Edit your API endpoints in:
```
lib/core/api/end_point.dart
```

### 🎨 Theme Configuration
Customize app colors, styles, and typography in:
```
lib/core/utils/
```

---




