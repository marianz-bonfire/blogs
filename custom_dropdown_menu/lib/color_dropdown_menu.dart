import 'package:flutter/material.dart';

class ColorDropdownMenu extends StatefulWidget {
  final String selectedColor;
  final Function(String?) onChanged;
  const ColorDropdownMenu({super.key, required this.selectedColor, required this.onChanged});

  @override
  State<ColorDropdownMenu> createState() => _ColorDropdownMenuState();
}

class _ColorDropdownMenuState extends State<ColorDropdownMenu> {
// List of colors with names
  final List<Map<String, dynamic>> _colors = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Purple', 'color': Colors.purple},
    {'name': 'Orange', 'color': Colors.orange},
  ];

  // Variable to hold the selected color
  Color _selectedColor = Colors.white;
  String? _selectedColorName;

  @override
  void initState() {
    super.initState();
    _selectedColor = _colors.firstWhere(
      (element) => element['name'] == widget.selectedColor,
      orElse: () => {'color': Colors.transparent}, // Fallback color
    )['color'];
    _selectedColorName = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        // Set the background color of the container dynamically
        //color: _selectedColor,
        decoration: BoxDecoration(
          color: _selectedColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
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
              hint: Text(_selectedColorName ?? 'Select a color'),
              onChanged: (String? selectedName) {
                widget.onChanged(selectedName);

                setState(() {
                  _selectedColorName = selectedName;
                  // Update background color based on the selected color
                  _selectedColor = _colors.firstWhere((element) => element['name'] == selectedName)['color'];
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
