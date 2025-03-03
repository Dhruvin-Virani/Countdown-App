// import 'package:flutter/material.dart';
// import '../models/countdown_item.dart';
// import '../utils/constants.dart';
// import 'dart:io';
//
// class CountdownCard extends StatelessWidget {
//   final CountdownItem countdown;
//
//   const CountdownCard({Key? key, required this.countdown}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final remainingTime = countdown.endDate.difference(DateTime.now());
//     final daysRemaining = remainingTime.inDays;
//     final hoursRemaining = remainingTime.inHours % 24;
//     final minutesRemaining = remainingTime.inMinutes % 60;
//
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       color: countdown.color == Colors.transparent
//           ? null
//           : countdown.color, // Use selected color or transparent for image
//       child: Stack(
//         children: [
//           // Display background image if available
//           if (countdown.imagePath != null)
//             Positioned.fill(
//               child: Image.file(
//                 File(countdown.imagePath!),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           // Countdown content
//           Positioned.fill(
//             child: Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title
//                   Text(
//                     countdown.title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 8),
//                   // Description
//                   Text(
//                     countdown.description,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.white,
//                     ),
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const Spacer(),
//                   // Countdown timer
//                   Text(
//                     '$daysRemaining days, $hoursRemaining hours, $minutesRemaining minutes',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import '../models/countdown_item.dart'; // Import CountdownItem model for countdown data
//
// class CountdownCard extends StatelessWidget {
//   final CountdownItem countdown;
//
//   const CountdownCard({Key? key, required this.countdown}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the remaining time in days and hours
//     final remainingTime = _calculateRemainingTime(countdown.endDate);
//
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Curvy Rectangular Box for Days Remaining
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 borderRadius: BorderRadius.circular(12), // Curvy rectangular box
//               ),
//               child: Text(
//                 '${remainingTime['days']} Days',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             // Hours Remaining Text
//             Text(
//               '${remainingTime['hours']} Hours Left',
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Map<String, int> _calculateRemainingTime(DateTime targetDate) {
//     final now = DateTime.now();
//     final difference = targetDate.difference(now);
//
//     // Calculate days and hours remaining
//     final days = difference.inDays;
//     final hours = (difference.inHours - (days * 24));
//
//     return {'days': days, 'hours': hours};
//   }
// }
import 'package:flutter/material.dart';
import '../models/countdown_item.dart';
import '../models/countdown_provider.dart';
import 'package:provider/provider.dart';

class CountdownCard extends StatelessWidget {
  final CountdownItem countdown;

  const CountdownCard({Key? key, required this.countdown}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remainingTime = _calculateRemainingTime(countdown.endDate);

    return GestureDetector(
      onLongPress: () => _showOptionsDialog(context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                countdown.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),

              // Display the image if provided
              if (countdown.imagePath != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    countdown.imagePath!,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(height: 8.0),

              // Curvy Rectangular Box for Days Remaining
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: countdown.color, // Use the selected color
                  borderRadius: BorderRadius.circular(12), // Curvy rectangular box
                ),
                child: Text(
                  '${remainingTime['days']} Days',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              // Hours Remaining Text
              Text(
                '${remainingTime['hours']} Hours Left',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8.0),

              // Description
              Text(
                countdown.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Calculate days and hours remaining
  Map<String, int> _calculateRemainingTime(DateTime targetDate) {
    final now = DateTime.now();
    final difference = targetDate.difference(now);

    final days = difference.inDays;
    final hours = (difference.inHours - (days * 24));

    return {'days': days, 'hours': hours};
  }

  // Show a dialog to edit or delete the countdown
  void _showOptionsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text('Edit Countdown'),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _editCountdown(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete Countdown'),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _deleteCountdown(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Navigate to the edit screen
  void _editCountdown(BuildContext context) {
    // TODO: Implement the navigation to the edit countdown screen
    // Example:
    // Navigator.push(context, MaterialPageRoute(builder: (_) => EditCountdownScreen(countdown: countdown)));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit functionality is not implemented yet.')),
    );
  }

  // Delete the countdown and update the provider
  void _deleteCountdown(BuildContext context) {
    Provider.of<CountdownProvider>(context, listen: false).removeCountdown(countdown);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Countdown deleted successfully.')),
    );
  }
}
