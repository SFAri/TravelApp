import 'package:flutter/material.dart';

class MenuSettingSection extends StatelessWidget {
  final String title;
  const MenuSettingSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
