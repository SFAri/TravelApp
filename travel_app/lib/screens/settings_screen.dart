import 'package:flutter/material.dart';
import 'package:travel_app/screens/about_screen.dart';
import 'package:travel_app/screens/tutorial_screen.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_section.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Locale) onLocaleChanged; // Callback for locale change

  const SettingsScreen({super.key, required this.onLocaleChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late List<String> languages;

  final List<String> currencies = ['USD', 'VND', 'JPY'];

  final TextEditingController _langController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  String? _selectedLanguage;
  // String? _selectedCurrency;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Khởi tạo ngôn ngữ mặc định từ AppLocalization
    Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode; 
    switch (languageCode) {
      case 'en':
        _selectedLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
      case 'vi':
        _selectedLanguage = AppLocalizations.of(context)!.vietnameseLanguage;
        break;
      case 'ja':
        _selectedLanguage = AppLocalizations.of(context)!.japaneseLanguage;
        break;
      default:
        _selectedLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
    }
    _langController.text = _selectedLanguage!;
    languages = [
      AppLocalizations.of(context)!.englishLanguage,
      AppLocalizations.of(context)!.vietnameseLanguage,
      AppLocalizations.of(context)!.japaneseLanguage,
    ];
  }

  void _showSelectionDialog(
    List<String> options,
    TextEditingController controller,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(options[index]),
                  trailing: _selectedLanguage == options[index]
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedLanguage = options[index]; // Cập nhật biến thành viên
                      controller.text = _selectedLanguage!; // Cập nhật nội dung của controller
                    });

                    // Determine the new locale based on selection
                    Locale newLocale;
                    if (_selectedLanguage == AppLocalizations.of(context)!.englishLanguage) {
                      newLocale = const Locale('en');
                    } else if (_selectedLanguage == AppLocalizations.of(context)!.vietnameseLanguage) {
                      newLocale = const Locale('vi');
                    } else if (_selectedLanguage == AppLocalizations.of(context)!.japaneseLanguage) {
                      newLocale = const Locale('ja');
                    } else {
                      newLocale = const Locale('en'); // Default fallback
                    }
                    print('NEW LOCALE ---------$newLocale');
                    widget.onLocaleChanged(newLocale); // Call the callback
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.grey[300]),
              ],
            );
          },
          controller: ScrollController(
            initialScrollOffset: _selectedLanguage != null
                ? options.indexOf(_selectedLanguage!) * 32.0 // Chiều cao ước tính của ListTile
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
          title: Text(AppLocalizations.of(context)!.settingAppbar),
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
                    MenuSettingSection(title: AppLocalizations.of(context)!.generalInfomationSection),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          MenuSettingTitle(
                            icon: Icons.language,
                            title: AppLocalizations.of(context)!.chooseLanguageButton,
                            subtitle: _langController.text,
                            onTap:
                                () => _showSelectionDialog(
                                  languages,
                                  _langController,
                                  // _selectedLanguage,
                                ),
                          ),
                          // MenuSettingTitle(
                          //   icon: Icons.currency_exchange,
                          //   title: 'Tiền tệ',
                          //   subtitle: _currencyController.text,
                          //   onTap:
                          //       () => _showSelectionDialog(
                          //         currencies,
                          //         _currencyController,
                          //         _selectedCurrency,
                          //       ),
                          // ),
                          MenuSettingTitle(
                            icon: Icons.date_range,
                            title: AppLocalizations.of(context)!.chooseDateButton,
                            subtitle: 'dd/MM/yyyy',
                            onTap: () {},
                          ),
                          MenuSettingTitle(
                            icon: Icons.format_paint,
                            title: AppLocalizations.of(context)!.chooseThemeButton,
                            subtitle: 'Dark Mode',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    // Security Section
                    MenuSettingSection(title: AppLocalizations.of(context)!.securitySection),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          MenuSettingTitle(
                            icon: Icons.notifications,
                            title: AppLocalizations.of(context)!.chooseNotificationButton,
                            hasSwitch: true,
                            switchValue: enableNotifications,
                            onSwitchChanged: (value) {},
                          ),
                        ],
                      ),
                    ),

                    // Other Section (Based on second screen)
                    MenuSettingSection(title: AppLocalizations.of(context)!.otherSection),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          MenuSettingTitle(
                            icon: Icons.feedback_outlined,
                            title: AppLocalizations.of(context)!.chooseReportButton,
                            onTap: () {},
                          ),
                          MenuSettingTitle(
                            icon: Icons.help_outline,
                            title: AppLocalizations.of(context)!.chooseTutorialButton,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TutorialScreen(),
                                ),
                              );
                            },
                          ),
                          MenuSettingTitle(
                            icon: Icons.info_outline,
                            title: AppLocalizations.of(context)!.chooseAboutButton,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AboutScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
