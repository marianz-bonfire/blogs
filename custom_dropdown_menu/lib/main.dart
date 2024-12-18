import 'package:flutter/material.dart';

void main() {
  runApp(ColorDropdownApp());
}

class ColorDropdownApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorDropdownScreen(),
    );
  }
}

class ColorDropdownScreen extends StatefulWidget {
  @override
  _ColorDropdownScreenState createState() => _ColorDropdownScreenState();
}

class _ColorDropdownScreenState extends State<ColorDropdownScreen> {
  // List of colors with names
  final List<Map<String, dynamic>> _colors = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Purple', 'color': Colors.purple},
    {'name': 'Orange', 'color': Colors.orange},
  ];

  // Currently selected color
  Map<String, dynamic> _selectedColor = {'name': 'Red', 'color': Colors.red};
  String _selectedColorName = 'Red';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enhanced Dropdown Color Menu'),
        backgroundColor: _selectedColor['color'],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select a Color:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // Dropdown Button
            Container(
              // Set the background color of the container dynamically
              decoration: BoxDecoration(
                color: _selectedColor['color'],
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.0),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  // Define the dropdown items
                  items: _colors.map((colorMap) {
                    return DropdownMenuItem<String>(
                      value: colorMap['name'],
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            color: colorMap['color'], // Display color preview
                            margin: const EdgeInsets.only(right: 8),
                          ),
                          Text(colorMap['name']),
                        ],
                      ),
                    );
                  }).toList(),
                  // Hint text
                  hint: Text(
                    _selectedColorName,
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (String? selectedName) {
                    setState(() {
                      _selectedColorName = selectedName!;
                      // Update background color based on the selected color
                      _selectedColor = _colors.firstWhere((element) => element['name'] == selectedName);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
