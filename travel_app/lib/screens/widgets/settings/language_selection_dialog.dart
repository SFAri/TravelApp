import 'package:flutter/material.dart';
import 'package:travel_app/providers/settings_provider.dart';

class LanguageSelectionDialog extends StatelessWidget {
  final List<String> languages;
  final String currentLanguage;
  final void Function(Locale newLocale) onLanguageSelected;

  const LanguageSelectionDialog({
    super.key,
    required this.languages,
    required this.currentLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: languages.length,
      controller: ScrollController(
        initialScrollOffset: languages.indexOf(currentLanguage) * 50.0,
      ),
      itemBuilder: (context, index) {
        final languageName = languages[index];
        return Column(
          children: [
            ListTile(
              title: Text(languageName),
              trailing:
                  currentLanguage == languageName
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
              onTap: () {
                Locale newLocale;
                if (languageName.contains('English')) {
                  newLocale = const Locale('en');
                } else if (languageName.contains('Vietnamese') ||
                    languageName.contains('Tiếng Việt')) {
                  newLocale = const Locale('vi');
                } else if (languageName.contains('Japanese') ||
                    languageName.contains('日本語')) {
                  newLocale = const Locale('ja');
                } else {
                  newLocale = const Locale('en');
                }
                onLanguageSelected(newLocale);
                Navigator.pop(context);
              },
            ),
            if (index < languages.length - 1)
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
