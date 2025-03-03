// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:countdown/main.dart';
//
// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());
//
//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:countdown/main.dart';
import 'package:provider/provider.dart';
import 'package:countdown/models/countdown_provider.dart';

void main() {
  testWidgets('Verify that theme toggle and countdown provider work correctly', (WidgetTester tester) async {
    // Initialize the app with isDarkMode set to false
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountdownProvider()),
          ChangeNotifierProvider(create: (_) => ThemeNotifier(false)),
        ],
        child: const MyApp(isDarkMode: false),
      ),
    );

    // Verify initial theme state
    expect(find.byIcon(Icons.nightlight_round), findsOneWidget);
    expect(find.byIcon(Icons.wb_sunny), findsNothing);

    // Toggle the theme to dark mode
    await tester.tap(find.byIcon(Icons.nightlight_round));
    await tester.pump();

    // Verify the theme toggle to dark mode
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    expect(find.byIcon(Icons.nightlight_round), findsNothing);

    // Verify that there are no countdowns initially
    expect(find.text('No countdowns yet. Add one!'), findsOneWidget);

    // Verify FAB is present for adding new countdowns
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Verify the add countdown button navigates to AddCountdownScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountdownProvider()),
          ChangeNotifierProvider(create: (_) => ThemeNotifier(false)),
        ],
        child: const MyApp(isDarkMode: false),
      ),
    );

    // Tap the Floating Action Button to add a countdown
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify navigation to AddCountdownScreen
    expect(find.text('Add Countdown'), findsOneWidget);
  });
}
