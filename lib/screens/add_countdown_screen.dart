// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';
// import '../models/countdown_item.dart';
// import '../models/countdown_provider.dart';
// import '../utils/storage_helper.dart';
// import '../utils/constants.dart';
//
// class AddCountdownScreen extends StatefulWidget {
//   const AddCountdownScreen({Key? key}) : super(key: key);
//
//   @override
//   _AddCountdownScreenState createState() => _AddCountdownScreenState();
// }
//
// class _AddCountdownScreenState extends State<AddCountdownScreen> {
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   DateTime? _startDate = DateTime.now(); // Default start date is current date
//   DateTime? _endDate;
//   Color _backgroundColor = Colors.blue; // Default background color
//   String? _imagePath; // Image path for the background image
//   final List<Color> _availableColors = [
//     Colors.blue,
//     Colors.green,
//     Colors.orange,
//     Colors.red,
//     Colors.purple,
//     Colors.yellow,
//     Colors.cyan,
//   ];
//
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Countdown'),
//         backgroundColor: _backgroundColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title TextField (Optional)
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.grey.shade200,
//                 ),
//                 child: TextField(
//                   controller: _titleController,
//                   decoration: const InputDecoration(
//                     labelText: 'Title (Optional)',
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.all(16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Date Inputs (Start Date and End Date)
//               Row(
//                 children: [
//                   // Start Date
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.grey.shade200,
//                       ),
//                       child: TextButton(
//                         onPressed: () async {
//                           final DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: _startDate!,
//                             firstDate: DateTime(2000),
//                             lastDate: DateTime(2101),
//                           );
//                           if (picked != null && picked != _startDate) {
//                             setState(() {
//                               _startDate = picked;
//                             });
//                           }
//                         },
//                         child: Text(
//                           'Start Date: ${_startDate?.toLocal().toString().split(' ')[0] ?? 'Select Start Date'}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   // End Date
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.grey.shade200,
//                       ),
//                       child: TextButton(
//                         onPressed: () async {
//                           final DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: _endDate ?? DateTime.now(),
//                             firstDate: DateTime(2000),
//                             lastDate: DateTime(2101),
//                           );
//                           if (picked != null && picked != _endDate) {
//                             setState(() {
//                               _endDate = picked;
//                             });
//                           }
//                         },
//                         child: Text(
//                           'End Date: ${_endDate?.toLocal().toString().split(' ')[0] ?? 'Select End Date'}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // Description TextField (Optional)
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.grey.shade200,
//                 ),
//                 child: TextField(
//                   controller: _descriptionController,
//                   decoration: const InputDecoration(
//                     labelText: 'Description (Optional)',
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.all(16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Color Selection (7 color options)
//               const Text('Select Background Color:'),
//               const SizedBox(height: 8),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: _availableColors.map((color) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _backgroundColor = color;
//                         });
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.all(8.0),
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: color,
//                           shape: BoxShape.circle,
//                           border: _backgroundColor == color
//                               ? Border.all(color: Colors.black, width: 3)
//                               : null,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Image Picker (Optional)
//               const Text('Insert Background Image (Optional):'),
//               const SizedBox(height: 8),
//               GestureDetector(
//                 onTap: () async {
//                   final pickedFile = await _picker.pickImage(
//                     source: ImageSource.gallery, // You can also choose ImageSource.camera
//                   );
//                   if (pickedFile != null) {
//                     setState(() {
//                       _imagePath = pickedFile.path;
//                     });
//                   }
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text(
//                       _imagePath == null
//                           ? 'Tap to Select Image'
//                           : 'Image Selected',
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Submit Button to add countdown
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Validate inputs
//                     if (_endDate == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('End Date is required')),
//                       );
//                       return;
//                     }
//
//                     // Create the new CountdownItem
//                     final newCountdown = CountdownItem(
//                       title: _titleController.text,
//                       startDate: _startDate!,
//                       endDate: _endDate!,
//                       description: _descriptionController.text,
//                       color: _backgroundColor,
//                       imagePath: _imagePath,
//                     );
//
//                     // Add the countdown to the provider
//                     Provider.of<CountdownProvider>(context, listen: false)
//                         .addCountdown(newCountdown);
//
//                     // Save the updated list of countdowns
//                     StorageHelper.saveCountdowns(
//                       Provider.of<CountdownProvider>(context, listen: false)
//                           .countdowns,
//                     );
//
//                     // Pop the screen and go back to the previous screen
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add Countdown'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../models/countdown_item.dart';
import '../models/countdown_provider.dart';
import '../utils/storage_helper.dart';

class AddCountdownScreen extends StatefulWidget {
  const AddCountdownScreen({Key? key}) : super(key: key);

  @override
  _AddCountdownScreenState createState() => _AddCountdownScreenState();
}

class _AddCountdownScreenState extends State<AddCountdownScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _startDate = DateTime.now(); // Default start date is current date
  DateTime? _endDate;
  Color _backgroundColor = Colors.blue; // Default background color
  String? _imagePath; // Image path for the background image
  final ImagePicker _picker = ImagePicker();

  final List<Gradient> _availableGradients = [
    const LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
    const LinearGradient(colors: [Colors.green, Colors.lightGreenAccent]),
    const LinearGradient(colors: [Colors.orange, Colors.deepOrangeAccent]),
    const LinearGradient(colors: [Colors.red, Colors.redAccent]),
    const LinearGradient(colors: [Colors.purple, Colors.deepPurpleAccent]),
    const LinearGradient(colors: [Colors.yellow, Colors.amberAccent]),
    const LinearGradient(colors: [Colors.cyan, Colors.tealAccent]),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Countdown'),
        backgroundColor: _backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title TextField (Optional)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
                ),
                child: TextField(
                  controller: _titleController,
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Title (Optional)',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.grey.shade400 : Colors.black54,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Date Inputs (Start Date and End Date)
              Row(
                children: [
                  // Start Date
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _startDate!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != _startDate) {
                            setState(() {
                              _startDate = picked;
                            });
                          }
                        },
                        child: Text(
                          'Start Date: ${_startDate?.toLocal().toString().split(' ')[0] ?? 'Select Start Date'}',
                          style: TextStyle(
                            fontSize: 16,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // End Date
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _endDate ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != _endDate) {
                            setState(() {
                              _endDate = picked;
                            });
                          }
                        },
                        child: Text(
                          'End Date: ${_endDate?.toLocal().toString().split(' ')[0] ?? 'Select End Date'}',
                          style: TextStyle(
                            fontSize: 16,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Description TextField (Optional)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
                ),
                child: TextField(
                  controller: _descriptionController,
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Description (Optional)',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.grey.shade400 : Colors.black54,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Color Selection (Gradient options)
              const Text('Select Background Color:'),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _availableGradients.map((gradient) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _backgroundColor = gradient.colors.first; // Default to first color
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: gradient,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                          border: _backgroundColor == gradient.colors.first
                              ? Border.all(color: Colors.black, width: 3)
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // Image Picker (Optional)
              const Text('Insert Background Image (Optional):'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.gallery, // You can also choose ImageSource.camera
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _imagePath = pickedFile.path;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      _imagePath == null
                          ? 'Tap to Select Image'
                          : 'Image Selected',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Submit Button to add countdown
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_endDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('End Date is required')),
                      );
                      return;
                    }
                    final newCountdown = CountdownItem(
                      title: _titleController.text,
                      startDate: _startDate!,
                      endDate: _endDate!,
                      description: _descriptionController.text,
                      color: _backgroundColor,
                      imagePath: _imagePath,
                    );
                    Provider.of<CountdownProvider>(context, listen: false)
                        .addCountdown(newCountdown);
                    StorageHelper.saveCountdowns(
                      Provider.of<CountdownProvider>(context, listen: false)
                          .countdowns,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Add Countdown'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
