import 'package:flutter/material.dart';

class CountdownItem {
  final String title;           // The title of the countdown
  final DateTime startDate;     // Start date of the countdown
  final DateTime endDate;       // End date of the countdown
  final String description;     // Additional description for the countdown
  final Color color;            // Background color for the countdown card
  final String? imagePath;      // Path to the image used as background (nullable)

  CountdownItem({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.color,
    this.imagePath,
  });

  // Convert the object to a map for storage
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'description': description,
      'color': color.value, // Store color as an integer
      'imagePath': imagePath,
    };
  }

  CountdownItem copyWith({
    String? title,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    Color? color,
    String? imagePath,
  }) {
    return CountdownItem(
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      color: color ?? this.color,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  // Create a CountdownItem object from a map
  factory CountdownItem.fromMap(Map<String, dynamic> map) {
    return CountdownItem(
      title: map['title'] as String,
      startDate: DateTime.parse(map['startDate'] as String),
      endDate: DateTime.parse(map['endDate'] as String),
      description: map['description'] as String,
      color: Color(map['color'] as int),
      imagePath: map['imagePath'] as String?,
    );

  }
}
