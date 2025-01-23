# 🏋️ FitMess: Your Ultimate Fitness Companion

## 📱 Project Overview

FitMess is a state-of-the-art mobile fitness application designed to revolutionize your workout experience. Built with cutting-edge technology, the app provides users with a seamless, intuitive platform for discovering, tracking, and executing diverse workout routines.

## 🚀 Technology Stack

- **Frontend**: Flutter (Dart)
- **State Management**: GetX
- **Backend & Authentication**: Supabase
- **Database**: PostgreSQL
- **Video Playback**: Better Player

## ✨ Key Features

- User Authentication
- Diverse Workout Styles
- Dynamic Exercise Listings
- Detailed Exercise Demonstrations
- Responsive UI Design

## 🏗️ Architecture

### MVC Architecture
The project follows the Model-View-Controller (MVC) architectural pattern, implemented using GetX CLI, ensuring:
- Separation of Concerns
- Modular Code Structure
- Enhanced Maintainability

### Project Structure
```
lib/
├── app/
│   ├── modules/
│   │   ├── auth/
│   │   ├── home/
│   │   ├── exercises/
│   │   └── workout_detail/
│   ├── services/
│   └── utils/
└── main.dart
```

## 🔐 Authentication Flow

### Supabase Integration
- Secure user registration
- Password-based authentication
- Session management

## 📊 Database Design

### Supabase PostgreSQL Schema
- Workout Styles Table
- Exercises Table
- Categories Table

## 🎨 UI/UX Highlights

- Dark Mode Design
- Responsive Layouts
- Smooth Transitions
- Intuitive Navigation
  
# Screenshots

<table>
  <tr>
    <td>
      <img src="/assets/auth.jpg" alt="Auth Screen" width="300">
    </td>
    <td>
      <img src="/assets/auth%20signup.png" alt="Signup Screen" width="300">
    </td>
      <td>
      <img src="/assets/workout%20listview.png" alt="Workout List View" width="300">
    </td>
  </tr>
  <tr>
    <td>
             <img src="/assets/workouts%20grid.png" alt="Workouts Grid View" width="300">
    </td>
    <td>
             <img src="/assets/workouts.png" alt="Workouts Screen" width="300">
    </td>
      <td>
      <img src="/assets/detail%20screen.png" alt="Exercise Detail Screen" width="300">
    </td>
  </tr>
</table>



## 🛠️ Setup & Installation

### Prerequisites
- Flutter SDK
- Dart
- Supabase Account

### Clone & Initialize
```bash
git clone https://github.com/yourusername/fitmess.git
cd fitmess
flutter pub get
```

### Configuration
1. Create Supabase Project
2. Update `supabase_config.dart`
3. Run Migrations

## 🚀 Run the Application
```bash
flutter run
```

## 🔍 Performance Optimizations

- Efficient state management with GetX
- Minimal widget rebuilds
- Lazy loading of resources

## 🔮 Future Roadmap

- [ ] Social Authentication
- [ ] Workout Progress Tracking
- [ ] Personalized Recommendations
- [ ] Offline Workout Mode


## 📧 Contact

**Zuraiz NAyyar**
- Email: malikzuraiz1214@gmail.com
- LinkedIn: <a href="https://www.linkedin.com/in/malik-zuraiz-nayyar-3815a8227/">Zuraiz Nayyar</a>
- GitHub: <a href="https://github.com/MalikZuraiz">MalikZuraiz</a>

## 🙏 Acknowledgements

- Flutter Team
- GetX Community
- Supabase
- Open-source Contributors
