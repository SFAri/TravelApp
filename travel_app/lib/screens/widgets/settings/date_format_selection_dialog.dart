import 'package:flutter/material.dart';

class DateFormatSelectionDialog extends StatelessWidget {
  final Map<String, String> availableDateFormats;
  final String selectedPattern;
  final void Function(String pattern) onPatternSelected;

  const DateFormatSelectionDialog({
    super.key,
    required this.availableDateFormats,
    required this.selectedPattern,
    required this.onPatternSelected,
  });

  @override
  Widget build(BuildContext context) {
    final patterns = availableDateFormats.keys.toList();
    final initialIndex = patterns.indexOf(selectedPattern);
    final initialScrollOffset = initialIndex * 56.0;

    return ListView.builder(
      itemCount: patterns.length,
      controller: ScrollController(initialScrollOffset: initialScrollOffset),
      itemBuilder: (context, index) {
        final pattern = patterns[index];
        final example = availableDateFormats[pattern] ?? pattern;
        final isSelected = selectedPattern == pattern;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(pattern),
              subtitle: Text(example),
              trailing:
                  isSelected
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
              onTap: () {
                onPatternSelected(pattern);
                Navigator.pop(context);
              },
            ),
            if (index < patterns.length - 1)
              Divider(
                height: 1,
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: Colors.grey[300],
              ),
          ],
        );
      },
    );
  }
}
