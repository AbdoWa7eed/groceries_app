
# Groceries App

A feature-packed mobile application designed to streamline grocery shopping, integrated with modern location services and optimized for efficiency.

## 📱 Features

- **Account Management**: Manage your account information, change passwords, and keep your profile up-to-date.
- **Authentication**: Secure login and registration with email/password and phone number OTP verification.
- **Shopping Cart**: Easily add and manage items in your cart, and the checkout process will be smooth.
- **Explore & Favorites**: Browse and discover grocery items, and save favorites for easy access.
- **Order Tracking**: View and manage your orders with detailed tracking information.
- **Location Services**: Use Google Maps and Geolocation to detect your location. The API key is stored securely in a `.env` file.
- **Search**: Use a floating search bar to find products efficiently.
- **Reviews**: Read and leave reviews, with user-specific options to edit them.
- **Payment Handling**: Use `webview_flutter` for secure payment processing with integration for Paymob.

## 🛠️ Tech Stack

- **Frontend**: Built with Flutter
- **State Management**: Bloc for efficient state management
- **Location**: Google Maps and Geolocator for real-time location services
- **Network**: Dio with Retrofit for API handling and Pretty Dio Logger for logging
- **Caching**: Cached Network Image for efficient image loading
- **Backend**: Dart Frog for backend services

## 📦 Dependencies

Here are the key packages used in the project:

- **State Management**: `flutter_bloc`, `bloc`, `equatable`
- **Networking**: `dio`, `retrofit`, `pretty_dio_logger`, `dartz` for functional programming
- **Location & Maps**: `google_maps_flutter`, `geolocator`
- **UI Enhancements**: `flutter_native_splash`, `flutter_svg`, `carousel_slider`, `shimmer`, `lottie`, `blur`, `material_floating_search_bar_2`
- **Form Handling**: `form_validator`, `intl_phone_number_input`, `pinput`
- **Storage**: `shared_preferences` for local storage, `flutter_dotenv` for environment variables
- **Miscellaneous**: `uuid`, `provider`, `timeline_tile`, `flutter_rating_bar`, `image_picker`, `fluttertoast`, `readmore`, `dart_jsonwebtoken`, `intl`, `webview_flutter`

## ⚙️ Installation and Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/AbdoWa7eed/groceries_app.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd groceries_app
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Set up API Keys**:
   - Create a `.env` file in the project root and add your Google Maps API key:
     
     ```
     GOOGLE_MAPS_API_KEY=your_api_key_here
     ```
5. **Configure Backend URL**:
   - The app works on the hostname `192.168.1.19` and port `8080`
   - If you want to change it, modify the `baseUrl` variable in the `lib/core/network/api_constants.dart` file from:
     
     ```bash
     static const String baseUrl = "http://192.168.1.19:8080/";
     ```
     
   - Set it to the hostname and port where your backend is running.

     
6. **Run the app**:
   ```bash
   flutter run
   ```

## 🗂️ Project Structure

```plaintext
lib/
│
├── core/               # Core utilities and helpers
├── features/           # All features organized in subdirectories
├── app.dart            # Main app widget
├── bloc_observer.dart  # Bloc observer for debugging
└── main.dart           # Entry point of the app
```

## 🔗 Backend Repository

The app communicates with a Dart Frog backend. You can find the backend repository [here](https://github.com/AbdoWa7eed/groceries_app_backend).

## 🤝 Contribution

We welcome contributions! Fork the repository, make your changes, and submit a pull request.

## 📬 Contact

For any inquiries or support, please reach out to [Abdelrahman Waheed](https://github.com/AbdoWa7eed).
