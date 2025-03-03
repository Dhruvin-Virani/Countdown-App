import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/countdown_item.dart';

class StorageHelper {
  static const String countdownsKey = 'countdowns';
  static const String isDarkModeKey = 'isDarkMode';

  /// Retrieve `SharedPreferences` instance
  static Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  /// Save countdowns list to SharedPreferences
  static Future<void> saveCountdowns(List<CountdownItem> countdowns) async {
    final prefs = await getPrefs();
    final List<String> countdownsJson = countdowns
        .map((countdown) => jsonEncode(countdown.toMap()))
        .toList();
    await prefs.setStringList(countdownsKey, countdownsJson);
  }

  /// Load countdowns list from SharedPreferences
  static Future<List<CountdownItem>> loadCountdowns() async {
    final prefs = await getPrefs();
    final List<String>? countdownsJson = prefs.getStringList(countdownsKey);

    if (countdownsJson == null) {
      return [];
    }

    return countdownsJson
        .map((json) => CountdownItem.fromMap(jsonDecode(json)))
        .toList();
  }

  /// Save theme preference to SharedPreferences
  static Future<void> saveThemePreference(bool isDarkMode) async {
    final prefs = await getPrefs();
    await prefs.setBool(isDarkModeKey, isDarkMode);
  }

  /// Load theme preference from SharedPreferences
  static Future<bool> loadThemePreference() async {
    final prefs = await getPrefs();
    return prefs.getBool(isDarkModeKey) ?? false; // Default to light mode
  }
}
