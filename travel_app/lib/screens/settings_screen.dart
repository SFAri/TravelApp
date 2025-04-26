import 'package:flutter/material.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_section.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_title.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> languages = [
    'Việt Nam',
    'English (US)',
    'English (UK)',
    'Français',
    '中文',
  ];

  final List<String> currencies = [
    'VND',
    'USD',
    'EUR',
    'GBP',
    'CNY',
  ];

  final TextEditingController _langController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  String? _selectedLanguage;
  String? _selectedCurrency;

  void _showSelectionDialog(List<String> options,
      TextEditingController controller, String? selected) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      builder: (context) {
        return ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(options[index]),
                  trailing: selected == options[index]
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    setState(() {
                      selected = options[index];
                      controller.text = selected!;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.grey[300],
                )
              ],
            );
          },
          controller: ScrollController(
            initialScrollOffset: selected != null
                ? options.indexOf(selected!) *
                    32.0 // Approximate height of a ListTile
                : 0.0,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // You can replace these with your real logic or use Provider/Bloc
    bool enableCustomTheme = false;
    bool enableNotifications = true;

    return Container(
      color: Colors.grey[200], // Set the background color here
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cài đặt'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Common Section
                      MenuSettingSection(title: 'Thông tin chung'),
                      Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              MenuSettingTitle(
                                icon: Icons.language,
                                title: 'Ngôn ngữ',
                                subtitle: _langController.text,
                                onTap: () => _showSelectionDialog(languages,
                                    _langController, _selectedLanguage),
                              ),
                              MenuSettingTitle(
                                  icon: Icons.currency_exchange,
                                  title: 'Tiền tệ',
                                  subtitle: _currencyController.text,
                                  onTap: () => _showSelectionDialog(currencies,
                                      _currencyController, _selectedCurrency)),
                              MenuSettingTitle(
                                icon: Icons.date_range,
                                title: 'Định dạng ngày/giờ',
                                subtitle: 'dd/MM/yyyy',
                                onTap: () {},
                              ),
                              MenuSettingTitle(
                                icon: Icons.format_paint,
                                title: 'Chủ đề',
                                subtitle: 'Dark Mode',
                                onTap: () {},
                              ),
                            ],
                          )),

                      // Security Section
                      MenuSettingSection(title: 'Security'),
                      Container(
                          color: Colors.white,
                          child: Column(children: [
                            MenuSettingTitle(
                              icon: Icons.notifications,
                              title: 'Bật/tắt thông báo',
                              hasSwitch: true,
                              switchValue: enableNotifications,
                              onSwitchChanged: (value) {},
                            ),
                          ])),

                      // Other Section (Based on second screen)
                      MenuSettingSection(title: 'Khác'),
                      Container(
                          color: Colors.white,
                          child: Column(children: [
                            MenuSettingTitle(
                              icon: Icons.feedback_outlined,
                              title: 'Để lại phản hồi',
                              onTap: () {},
                            ),
                            MenuSettingTitle(
                              icon: Icons.info_outline,
                              title: 'Về Travel Guide',
                              onTap: () {},
                            ),
                          ])),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
