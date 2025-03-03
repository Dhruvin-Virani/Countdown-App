import 'package:flutter/material.dart';
import 'countdown_item.dart';
import '../utils/storage_helper.dart';

class CountdownProvider extends ChangeNotifier {
  List<CountdownItem> _countdowns = [];

  List<CountdownItem> get countdowns => _countdowns;

  // Add a new countdown to the list
  void addCountdown(CountdownItem countdown) {
    _countdowns.add(countdown);
    saveCountdowns(); // Save the updated list to storage
    notifyListeners(); // Notify listeners to update the UI
  }

  // Load existing countdowns from storage or initial data
  void loadCountdowns(List<CountdownItem> loadedCountdowns) {
    _countdowns = loadedCountdowns;
    notifyListeners(); // Notify listeners when data is loaded
  }

  // Save countdowns to storage
  void saveCountdowns() {
    // Save the list of countdowns using StorageHelper
    StorageHelper.saveCountdowns(_countdowns);
  }

  // Remove a countdown from the list
  void removeCountdown(CountdownItem countdown) {
    _countdowns.remove(countdown);
    saveCountdowns(); // Save the updated list to storage
    notifyListeners(); // Notify listeners to update the UI
  }
}

