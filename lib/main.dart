// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'screens/home_screen.dart';
// import 'models/countdown_provider.dart';
// import 'utils/storage_helper.dart';
// import 'models/countdown_item.dart';
// import 'utils/constants.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Load theme preference before the app starts
//   final isDarkMode = await StorageHelper.loadThemePreference();
//   final countdowns = await StorageHelper.loadCountdowns();
//
//   runApp(MyApp(isDarkMode: isDarkMode, countdowns: countdowns));
// }
//
// class MyApp extends StatelessWidget {
//   final bool isDarkMode;
//   final List<CountdownItem> countdowns;
//
//   const MyApp({
//     Key? key,
//     required this.isDarkMode,
//     required this.countdowns,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CountdownProvider()..loadCountdowns(countdowns),
//       child: MaterialApp(
//         title: 'Countdown App',
//         theme: lightTheme,
//         darkTheme: darkTheme,
//         themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
//         home: const HomeScreen(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/countdown_provider.dart';
import 'screens/home_screen.dart';
import 'utils/storage_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Countdown App',
            themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Load the theme from storage
  ThemeNotifier() {
    _loadTheme();
  }

  // Toggle the theme
  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await StorageHelper.getPrefs();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  // Load the theme setting from shared preferences
  void _loadTheme() async {
    final prefs = await StorageHelper.getPrefs();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'models/countdown_provider.dart';
// import 'screens/home_screen.dart';
// import 'utils/storage_helper.dart';
//
// void main() async {
//   // Ensure the widgets are bound before running the app
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final prefs = await StorageHelper.getPrefs();
//   final isDarkMode = prefs.getBool('isDarkMode') ?? false; // Default to light mode if not set
//
//   runApp(MyApp(isDarkMode: isDarkMode));
// }
//
// class MyApp extends StatelessWidget {
//   final bool isDarkMode;
//
//   const MyApp({Key? key, required this.isDarkMode}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // Provide CountdownProvider globally
//         ChangeNotifierProvider(
//           create: (_) => CountdownProvider(),
//         ),
//         // Provide ThemeNotifier for theme management
//         ChangeNotifierProvider(
//           create: (_) => ThemeNotifier(isDarkMode),
//         ),
//       ],
//       child: Consumer<ThemeNotifier>(
//         builder: (context, themeNotifier, child) {
//           return MaterialApp(
//             title: 'Countdown App',
//             themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//             theme: ThemeData.light(),
//             darkTheme: ThemeData.dark(),
//             home: const HomeScreen(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ThemeNotifier extends ChangeNotifier {
//   bool _isDarkMode;
//
//   bool get isDarkMode => _isDarkMode;
//
//   // Load the theme from storage
//   ThemeNotifier(this._isDarkMode);
//
//   // Toggle the theme
//   void toggleTheme() async {
//     _isDarkMode = !_isDarkMode;
//     final prefs = await StorageHelper.getPrefs();
//     await prefs.setBool('isDarkMode', _isDarkMode);
//     notifyListeners();
//   }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'models/countdown_provider.dart';
// import 'screens/home_screen.dart';
// import 'utils/storage_helper.dart';
//
// void main() async {
//   // Ensure Flutter bindings are initialized before accessing shared preferences
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Load the theme preference from shared preferences
//   final prefs = await StorageHelper.getPrefs();
//   final isDarkMode = prefs.getBool('isDarkMode') ?? false; // Default to light mode if not set
//
//   runApp(MyApp(isDarkMode: isDarkMode));
// }
//
// class MyApp extends StatelessWidget {
//   final bool isDarkMode;
//
//   const MyApp({Key? key, required this.isDarkMode}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // Provide CountdownProvider globally
//         ChangeNotifierProvider(
//           create: (_) => CountdownProvider(),
//         ),
//         // Provide ThemeNotifier for theme management
//         ChangeNotifierProvider(
//           create: (_) => ThemeNotifier(isDarkMode),
//         ),
//       ],
//       child: Consumer<ThemeNotifier>(
//         builder: (context, themeNotifier, child) {
//           return MaterialApp(
//             title: 'Countdown App',
//             themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//             theme: ThemeData.light(),
//             darkTheme: ThemeData.dark(),
//             home: const HomeScreen(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ThemeNotifier extends ChangeNotifier {
//   bool _isDarkMode;
//
//   bool get isDarkMode => _isDarkMode;
//
//   // Constructor to initialize the theme preference
//   ThemeNotifier(this._isDarkMode);
//
//   // Toggle the theme and save preference
//   void toggleTheme() async {
//     _isDarkMode = !_isDarkMode;
//     final prefs = await StorageHelper.getPrefs();
//     await prefs.setBool('isDarkMode', _isDarkMode);
//     notifyListeners();
//   }
// }
