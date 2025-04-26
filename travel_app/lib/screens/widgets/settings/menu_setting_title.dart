import 'package:flutter/material.dart';

class MenuSettingTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  const MenuSettingTitle({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blue),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black),
      ),
      trailing: hasSwitch
          ? Switch(
              value: switchValue,
              onChanged: onSwitchChanged,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      subtitle!,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                  ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Theme.of(context).cardColor,
      onTap: onTap,
    );
  }
}
