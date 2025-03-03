// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../main.dart';
// import '../models/countdown_item.dart';
// import '../models/countdown_provider.dart';
// import '../widgets/countdown_card.dart';
// import '../utils/constants.dart';
// import '../utils/storage_helper.dart';
// import 'add_countdown_screen.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool isGridView = true; // Tracks the current view mode (grid or list)
//
//   @override
//   Widget build(BuildContext context) {
//     final countdowns = Provider.of<CountdownProvider>(context).countdowns;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Countdowns'),
//         actions: [
//           // Toggle light/dark mode
//           IconButton(
//             icon: Icon(Theme.of(context).brightness == Brightness.dark
//                 ? Icons.wb_sunny
//                 : Icons.nightlight_round),
//             onPressed: () async {
//               final isDarkMode =
//                   Theme.of(context).brightness == Brightness.dark;
//               final prefs = await StorageHelper.getPrefs();
//               await prefs.setBool('isDarkMode', !isDarkMode);
//               setState(() {
//                 final themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
//                 MyApp.of(context)?.setThemeMode(themeMode);
//               });
//             },
//           ),
//
//           // Toggle grid/list view
//           IconButton(
//             icon: Icon(isGridView ? Icons.list : Icons.grid_view),
//             onPressed: () {
//               setState(() {
//                 isGridView = !isGridView;
//               });
//             },
//           ),
//         ],
//       ),
//
//       // Floating Action Button for adding a new countdown
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddCountdownScreen()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//
//       // Body of the screen
//       body: countdowns.isEmpty
//           ? const Center(
//         child: Text('No countdowns yet. Add one!'),
//       )
//           : Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: isGridView
//             ? GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Two columns in grid view
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             childAspectRatio: 1, // Square-like cards
//           ),
//           itemCount: countdowns.length,
//           itemBuilder: (context, index) {
//             return CountdownCard(countdown: countdowns[index]);
//           },
//         )
//             : ListView.builder(
//           itemCount: countdowns.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: CountdownCard(countdown: countdowns[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/countdown_item.dart';
// import '../models/countdown_provider.dart';
// import '../widgets/countdown_card.dart';
// import 'add_countdown_screen.dart';
// import '../main.dart'; // Importing MyApp for theme handling
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool isGridView = true; // Tracks the current view mode (grid or list)
//
//   @override
//   Widget build(BuildContext context) {
//     final countdowns = Provider.of<CountdownProvider>(context).countdowns;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Countdowns'),
//         actions: [
//           // Toggle light/dark mode
//           IconButton(
//             icon: Icon(Theme.of(context).brightness == Brightness.dark
//                 ? Icons.wb_sunny
//                 : Icons.nightlight_round),
//             onPressed: () {
//               // Toggle the theme
//               context.read<ThemeNotifier>().toggleTheme();
//             },
//           ),
//
//           // Toggle grid/list view
//           IconButton(
//             icon: Icon(isGridView ? Icons.list : Icons.grid_view),
//             onPressed: () {
//               setState(() {
//                 isGridView = !isGridView;
//               });
//             },
//           ),
//         ],
//       ),
//
//       // Floating Action Button for adding a new countdown
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddCountdownScreen()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//
//       // Body of the screen
//       body: countdowns.isEmpty
//           ? const Center(
//         child: Text('No countdowns yet. Add one!'),
//       )
//           : Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: isGridView
//             ? GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Two columns in grid view
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             childAspectRatio: 1, // Square-like cards
//           ),
//           itemCount: countdowns.length,
//           itemBuilder: (context, index) {
//             return CountdownCard(countdown: countdowns[index]);
//           },
//         )
//             : ListView.builder(
//           itemCount: countdowns.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: CountdownCard(countdown: countdowns[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/countdown_item.dart';
// import '../models/countdown_provider.dart';
// import '../widgets/countdown_card.dart';
// import 'add_countdown_screen.dart';
// import '../main.dart'; // Importing MyApp for theme handling
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool isGridView = true; // Tracks the current view mode (grid or list)
//
//   @override
//   Widget build(BuildContext context) {
//     // Fetching countdown list from the provider
//     final countdowns = Provider.of<CountdownProvider>(context).countdowns;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Countdowns'),
//         actions: [
//           // Toggle light/dark mode
//           IconButton(
//             icon: Icon(Theme.of(context).brightness == Brightness.dark
//                 ? Icons.wb_sunny
//                 : Icons.nightlight_round),
//             onPressed: () {
//               // Toggle the theme using the ThemeNotifier
//               context.read<ThemeNotifier>().toggleTheme();
//             },
//           ),
//
//           // Toggle grid/list view
//           IconButton(
//             icon: Icon(isGridView ? Icons.list : Icons.grid_view),
//             onPressed: () {
//               setState(() {
//                 isGridView = !isGridView;
//               });
//             },
//           ),
//         ],
//       ),
//
//       // Floating Action Button for adding a new countdown
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddCountdownScreen()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//
//       // Body of the screen: Display countdowns
//       body: countdowns.isEmpty
//           ? const Center(
//         child: Text('No countdowns yet. Add one!'),
//       )
//           : Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: isGridView
//             ? GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Two columns in grid view
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             childAspectRatio: 1, // Square-like cards
//           ),
//           itemCount: countdowns.length,
//           itemBuilder: (context, index) {
//             return CountdownCard(countdown: countdowns[index]);
//           },
//         )
//             : ListView.builder(
//           itemCount: countdowns.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: CountdownCard(countdown: countdowns[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/countdown_provider.dart';
import '../widgets/countdown_card.dart';
import 'add_countdown_screen.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGridView = true; // Tracks the current view mode (grid or list)

  @override
  Widget build(BuildContext context) {
    final countdowns = Provider.of<CountdownProvider>(context).countdowns;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdowns'),
        actions: [
          // Toggle light/dark mode
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.dark
                ? Icons.wb_sunny
                : Icons.nightlight_round),
            onPressed: () {
              // Toggle the theme
              context.read<ThemeNotifier>().toggleTheme();
            },
          ),
          // Toggle grid/list view
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),

      // Floating Action Button for adding a new countdown
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCountdownScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),

      // Body of the screen
      body: countdowns.isEmpty
          ? const Center(
        child: Text('No countdowns yet. Add one!'),
      )
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(  // Makes the body scrollable
          child: isGridView
              ? GridView.builder(
            shrinkWrap: true, // Prevents infinite height error
            physics: const NeverScrollableScrollPhysics(), // Disables grid scroll
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns in grid view
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1, // Square-like cards
            ),
            itemCount: countdowns.length,
            itemBuilder: (context, index) {
              return CountdownCard(countdown: countdowns[index]);
            },
          )
              : ListView.builder(
            shrinkWrap: true, // Prevents infinite height error
            physics: const NeverScrollableScrollPhysics(), // Disables list scroll
            itemCount: countdowns.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CountdownCard(countdown: countdowns[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

