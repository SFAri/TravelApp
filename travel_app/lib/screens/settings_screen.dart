import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/providers/settings_provider.dart';
import 'package:travel_app/screens/about_screen.dart';
import 'package:travel_app/screens/tutorial_screen.dart';
import 'package:travel_app/screens/widgets/settings/currency_selection_dialog.dart';
import 'package:travel_app/screens/widgets/settings/date_format_selection_dialog.dart';
import 'package:travel_app/screens/widgets/settings/language_selection_dialog.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_section.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travel_app/screens/widgets/settings/theme_selection_dialog.dart';
import 'package:travel_app/utils/formaters.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late List<String> languages;
  late List<String> currencies;
  late List<String> themes;
  late Map<String, String> availableDateFormats;
  final DateTime sampleDate = DateTime.parse("2025-12-31 00:00:00");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    languages = [
      AppLocalizations.of(context)!.englishLanguage,
      AppLocalizations.of(context)!.vietnameseLanguage,
      AppLocalizations.of(context)!.japaneseLanguage,
      AppLocalizations.of(context)!.koreanLanguage,
    ];

    currencies = ["VND", "USD", "JPY", "KRW"];
    themes = ["Light", "Dark", "System"];

    final localeString = Localizations.localeOf(context).toString();

    availableDateFormats = {
      'MM/dd/yyyy HH:mm': DateFormat(
        'MM/dd/yyyy',
        localeString,
      ).add_Hm().format(sampleDate), // Ví dụ: 12/31/2025 12:00
      'yyyy/MM/dd HH:mm': DateFormat(
        'yyyy/MM/dd',
        localeString,
      ).add_Hm().format(sampleDate), // Ví dụ: 2025/12/31 12:00
      'd MMM yyyy HH:mm': DateFormat(
        'd MMM yyyy',
        localeString,
      ).add_Hm().format(
        sampleDate,
      ), // Ví dụ: 31 Thg 12 2025 12:00 (vi) hoặc 31 Dec 2025 12:00 (en)
      'd MMMM yyyy HH:mm': DateFormat(
        'd MMMM yyyy',
        localeString,
      ).add_Hm().format(
        sampleDate,
      ), // Ví dụ: 31 Tháng 12 2025 12:00 (vi) hoặc 31 December 2025 12:00 (en)
      'MM/dd/yyyy hh:mm a': DateFormat(
        'MM/dd/yyyy',
        localeString,
      ).add_jm().format(sampleDate), // Ví dụ: 12/31/2025 12:00 AM
      'yyyy/MM/dd hh:mm a': DateFormat(
        'yyyy/MM/dd',
        localeString,
      ).add_jm().format(sampleDate), // Ví dụ: 2025/12/31 12:00 AM
      'd MMM yyyy hh:mm a': DateFormat(
        'd MMM yyyy',
        localeString,
      ).add_jm().format(
        sampleDate,
      ), // Ví dụ: 31 Thg 12 2025 12:00 AM (vi) hoặc 31 Dec 2025 12:00 AM (en)
      'd MMMM yyyy hh:mm a': DateFormat(
        'd MMMM yyyy',
        localeString,
      ).add_jm().format(
        sampleDate,
      ), // Ví dụ: 31 Tháng 12 2025 (vi) hoặc 31 December 2025 (en)
    };
  }

  // Dialog chọn ngôn ngữ
  void _showLanguageSelectionDialog(SettingsProvider settingsProvider) {
    // Lấy locale hiện tại từ Provider để biết ngôn ngữ nào đang được chọn
    Locale currentLocale = settingsProvider.appLocale;
    print('current locale ------- $currentLocale');
    String currentSelectedLanguage;
    switch (currentLocale.languageCode) {
      case 'en':
        currentSelectedLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
      case 'vi':
        currentSelectedLanguage =
            AppLocalizations.of(context)!.vietnameseLanguage;
        break;
      case 'ja':
        currentSelectedLanguage =
            AppLocalizations.of(context)!.japaneseLanguage;
      case 'ko':
        currentSelectedLanguage = AppLocalizations.of(context)!.koreanLanguage;
        break;
      default:
        currentSelectedLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
    }

    showModalBottomSheet(
      context: context,
      builder:
          (context) => LanguageSelectionDialog(
            languages: languages,
            currentLanguage: currentSelectedLanguage,
            onLanguageSelected: (locale) {
              settingsProvider.changeLocale(locale);
            },
          ),
    );
  }

  // Dialog chọn tiền tệ
  void _showCurrencySelectionDialog(SettingsProvider settingsProvider) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => CurrencySelectionDialog(
            currencies: currencies,
            selectedCurrency: settingsProvider.selectedCurrency,
            onCurrencySelected: (currency) {
              settingsProvider.changeCurrency(currency);
            },
          ),
    );
  }

  // Dialog chọn định dạng ngày giờ
  void _showDateFormatSelectionDialog(SettingsProvider settingsProvider) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => DateFormatSelectionDialog(
            availableDateFormats: availableDateFormats,
            selectedPattern: settingsProvider.selectedDateFormatPattern,
            onPatternSelected: (pattern) {
              settingsProvider.changeDateFormat(pattern);
            },
          ),
    );
  }

  // Dialog chọn them mode
  void _showThemeModeSelectionDialog(SettingsProvider settingsProvider) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => ThemeSelectionDialog(
            themes: themes,
            selectedTheme: settingsProvider.selectedTheme,
            onThemeSelected: (theme) {
              setState(() {
                settingsProvider.changeTheme(theme);
              });
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lắng nghe thay đổi từ SettingsProvider
    // Dùng context.watch để widget này tự động build lại khi state thay đổi
    final settingsProvider = context.watch<SettingsProvider>();
    final selectedPattern = settingsProvider.selectedDateFormatPattern;

    // Xác định tên ngôn ngữ hiển thị dựa trên locale từ Provider
    String displayLanguage;
    switch (settingsProvider.appLocale.languageCode) {
      case 'en':
        displayLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
      case 'vi':
        displayLanguage = AppLocalizations.of(context)!.vietnameseLanguage;
        break;
      case 'ja':
        displayLanguage = AppLocalizations.of(context)!.japaneseLanguage;
        break;
      case 'ko':
        displayLanguage = AppLocalizations.of(context)!.koreanLanguage;
        break;
      default:
        displayLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
    }

    bool enableNotifications = false;

    return Container(
      color: Colors.grey[200],
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
                    MenuSettingSection(
                      title:
                          AppLocalizations.of(
                            context,
                          )!.generalInformationSection,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          MenuSettingTitle(
                            icon: Icons.language,
                            title:
                                AppLocalizations.of(
                                  context,
                                )!.chooseLanguageButton,
                            subtitle:
                                displayLanguage, // Hiển thị ngôn ngữ từ Provider
                            onTap:
                                () => _showLanguageSelectionDialog(
                                  context.read<SettingsProvider>(),
                                ),
                          ),
                          MenuSettingTitle(
                            icon: Icons.currency_exchange,
                            title:
                                AppLocalizations.of(
                                  context,
                                )!.chooseCurrencyButton,
                            subtitle:
                                settingsProvider
                                    .selectedCurrency, // Hiển thị tiền tệ từ Provider
                            onTap:
                                () => _showCurrencySelectionDialog(
                                  context.read<SettingsProvider>(),
                                ),
                          ),
                          MenuSettingTitle(
                            icon: Icons.date_range,
                            title:
                                AppLocalizations.of(context)!.chooseDateButton,
                            subtitle: Formatters.getDisplayPatternString(
                              selectedPattern,
                            ),
                            onTap:
                                () => _showDateFormatSelectionDialog(
                                  context.read<SettingsProvider>(),
                                ),
                          ),
                          MenuSettingTitle(
                            icon: Icons.format_paint,
                            title:
                                AppLocalizations.of(context)!.chooseThemeButton,
                            subtitle: settingsProvider.selectedTheme,
                            onTap:
                                () => _showThemeModeSelectionDialog(
                                  context.read<SettingsProvider>(),
                                ),
                          ),
                        ],
                      ),
                    ),

                    // Security Section
                    MenuSettingSection(
                      title: AppLocalizations.of(context)!.securitySection,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          MenuSettingTitle(
                            icon: Icons.notifications,
                            title:
                                AppLocalizations.of(
                                  context,
                                )!.chooseNotificationButton,
                            hasSwitch: true,
                            switchValue: enableNotifications,
                            onSwitchChanged: (value) {
                              setState(() {
                                enableNotifications = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // Other Section (Based on second screen)
                    MenuSettingSection(
                      title: AppLocalizations.of(context)!.otherSection,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          MenuSettingTitle(
                            icon: Icons.feedback_outlined,
                            title:
                                AppLocalizations.of(
                                  context,
                                )!.chooseReportButton,
                            onTap: () {},
                          ),
                          MenuSettingTitle(
                            icon: Icons.help_outline,
                            title:
                                AppLocalizations.of(
                                  context,
                                )!.chooseTutorialButton,
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
                            title:
                                AppLocalizations.of(context)!.chooseAboutButton,
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
