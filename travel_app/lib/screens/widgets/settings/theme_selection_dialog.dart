import 'package:flutter/material.dart';

class ThemeSelectionDialog extends StatelessWidget {
  final List<String> themes;
  final String selectedTheme;
  final void Function(String theme) onThemeSelected;

  const ThemeSelectionDialog({
    super.key,
    required this.themes,
    required this.selectedTheme,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: themes.length,
      controller: ScrollController(
        initialScrollOffset: themes.indexOf(selectedTheme) * 50.0,
      ),
      itemBuilder: (context, index) {
        final themeName = themes[index];
        return Column(
          children: [
            ListTile(
              title: Text(themeName),
              trailing:
                  selectedTheme == themeName
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
              onTap: () {
                onThemeSelected(themeName);
                Navigator.pop(context);
              },
            ),
            if (index < themes.length - 1)
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
