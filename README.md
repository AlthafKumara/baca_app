# 📚 Baca App (Library App)

A modern, full-featured library management application built with **Flutter**, designed to provide seamless experience for both administrators and users. This project leverages **GetX** for state management and **Supabase** for the backend.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-Purple?style=for-the-badge&logo=flutter&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)

## ✨ Features

- **🔐 Authentication**: Secure user login and registration flow.
- **👤 User Features**:
  - Explore library collection.
  - Manage profile.
  - View notifications.
- **🛠️ Admin Dashboard**:
  - Manage books and users.
  - Administrative tools.
- **📷 QR Code & Scanning**: Integrated QR scanning features using `mobile_scanner` and `qr_flutter` for efficient library operations.
- **📱 Responsive Design**: Built with `flutter_screenutil` to ensure pixel-perfect UI across different device sizes.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management & Routing**: [GetX](https://pub.dev/packages/get)
- **Backend**: [Supabase](https://supabase.com/)
- **UI/UX**: 
  - [Google Fonts](https://pub.dev/packages/google_fonts)
  - [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) for adaptivity.
- **Utilities**:
  - [Mobile Scanner](https://pub.dev/packages/mobile_scanner)
  - [Image Picker](https://pub.dev/packages/image_picker)
  - [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv) for environment management.

## 📁 Project Structure

The project follows a modular and scalable structure located mainly in `lib/A_newstructure`.

```
lib/
├── A_newstructure/       # Main Source Code (Active Architecture)
│   ├── configs/          # App configurations (Routes, Pages)
│   ├── constants/        # App-wide constants (Colors, Strings)
│   ├── env/              # Environment config
│   ├── features/         # Feature-based modules
│   │   ├── admin/        # Admin related features
│   │   ├── auth/         # Authentication features
│   │   ├── notification/ # Notification features
│   │   └── user/         # User related features
│   ├── shared/           # Shared widgets and resources
│   └── utils/            # Helper functions and utilities
├── main.dart             # Application entry point
└── my_app.dart           # App widget configuration
```

> **Note**: `lib/A_laststructure` contains legacy code and is currently inactive.

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (Version 3.10.0 or higher recommended).
- A [Supabase](https://supabase.com/) project set up.

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/baca_app.git
   cd baca_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Environment Setup**
   Create a `.env` file in the root directory (refer to `.env.example` if available) and add your Supabase credentials:
   ```env
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Run the App**
   ```bash
   flutter run
   ```


