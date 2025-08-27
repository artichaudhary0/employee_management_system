# 🚀 Employee Management System

A modern, cross-platform employee management application built with Flutter. Manage your team efficiently with a clean, intuitive interface that works seamlessly across mobile, tablet, desktop, and web platforms.

## ✨ Features

### 👥 Employee Management
- **Add New Employees** - Quick and easy employee registration
- **Edit Employee Details** - Update information anytime
- **Delete Employees** - Remove employees with confirmation dialogs
- **View Employee List** - Clean, organized employee directory

### 📱 User Experience
- **Clean UI Design** - Modern, professional interface
- **Swipe to Delete** - Intuitive mobile gestures
- **Custom Date Picker** - Beautiful date selection with quick options
- **Role Selection** - Easy role assignment with bottom sheet
- **Empty State** - Friendly no-data illustrations

### 🎯 Smart Features
- **Current vs Previous Employees** - Automatic categorization
- **Date Validation** - Prevents future dates for joining/leaving
- **Confirmation Dialogs** - Prevents accidental deletions
- **Responsive Design** - Adapts to any screen size

### 🌐 Cross-Platform Support
- **📱 Mobile** - iOS & Android native experience
- **💻 Desktop** - Windows, macOS, Linux support
- **🌍 Web** - Progressive web app ready
- **📟 Tablet** - Optimized for larger screens

## 🛠️ Technical Stack

### Frontend
- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language
- **BLoC Pattern** - State management
- **Custom Widgets** - Reusable UI components

### Storage
- **SQLite** - Local database for mobile/desktop
- **SharedPreferences** - Web storage solution
- **Cross-platform Data** - Seamless data persistence

### Architecture
- **Clean Architecture** - Separation of concerns
- **Repository Pattern** - Data abstraction layer
- **Responsive Design** - Adaptive layouts
- **Custom Themes** - Consistent styling

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.6          # State management
  sqflite: ^2.3.3+1             # Local database
  shared_preferences: ^2.2.2     # Web storage
  flutter_svg: ^2.0.10+1        # SVG icons
  intl: ^0.19.0                  # Date formatting
  equatable: ^2.0.5             # Value equality
  responsive_builder: ^0.7.1     # Responsive design
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/employee_management_system.git
   cd employee_management_system
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # Mobile/Desktop
   flutter run
   
   # Web
   flutter run -d chrome
   ```

### Building for Production

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Desktop
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## 📱 Screenshots

### Mobile Experience
- Clean employee list with swipe gestures
- Intuitive add/edit forms
- Beautiful date picker interface
- Responsive design elements

### Web Experience
- Full-width layouts
- Desktop-optimized interactions
- Progressive web app capabilities
- Cross-browser compatibility

## 🎨 Design Features

### UI/UX Highlights
- **Material Design** - Following Google's design principles
- **Custom Color Scheme** - Professional blue theme
- **Roboto Typography** - Clean, readable fonts
- **Smooth Animations** - Delightful micro-interactions
- **Accessibility** - Screen reader friendly

### Responsive Breakpoints
- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px
- **Web**: Optimized layouts for all sizes

## 🔧 Project Structure

```
lib/
├── core/
│   ├── constants/          # App constants & themes
│   ├── responsive/         # Responsive utilities
│   └── routes/            # Navigation routes
├── data/
│   ├── datasources/       # Database helpers
│   ├── models/           # Data models
│   └── repositories/     # Data repositories
└── presentation/
    ├── bloc/             # State management
    ├── pages/            # Screen widgets
    └── widgets/          # Reusable components
```

## 🌟 Key Features Breakdown

### Employee Operations
- ✅ **CRUD Operations** - Complete data management
- ✅ **Data Validation** - Form validation & error handling
- ✅ **Date Restrictions** - No future dates allowed
- ✅ **Role Management** - Predefined role selection

### Platform Optimizations
- ✅ **Mobile Gestures** - Swipe to delete functionality
- ✅ **Web Compatibility** - Full-width layouts
- ✅ **Desktop Ready** - Native desktop experience
- ✅ **Tablet Support** - Optimized for larger screens

### Data Management
- ✅ **Local Storage** - Offline-first approach
- ✅ **Data Persistence** - Reliable data storage
- ✅ **Cross-platform Sync** - Consistent data across platforms
- ✅ **Performance** - Optimized database queries

## 🚀 Deployment

### Web Deployment (Netlify)
```bash
# Build for web
flutter build web --release

# Deploy to Netlify
netlify deploy --prod --dir build/web
```

### Mobile App Stores
- **Google Play Store** - Android APK/AAB
- **Apple App Store** - iOS IPA
- **Microsoft Store** - Windows MSIX

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [artichaudhary0](https://github.com/artichaudhary0)
- LinkedIn: [artichaudhary0](https://www.linkedin.com/in/artichaudhary0/)
- Email: chaudhary.aarti1998@gmail.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI guidelines
- Community contributors and testers
- Open source packages used in this project

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>⭐ Star this repo if you found it helpful!</p>
</div>