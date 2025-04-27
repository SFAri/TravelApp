import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/settings_provider.dart';
import 'package:travel_app/screens/about_screen.dart';
import 'package:travel_app/screens/tutorial_screen.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_section.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late List<String> languages;
  late List<String> currencies;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    languages = [
      AppLocalizations.of(context)!.englishLanguage,
      AppLocalizations.of(context)!.vietnameseLanguage,
      AppLocalizations.of(context)!.japaneseLanguage,
    ];

    currencies = ["VND", "USD", "JPY"];
  }

  void _showLanguageSelectionDialog(SettingsProvider settingsProvider) {
    // Lấy locale hiện tại từ Provider để biết ngôn ngữ nào đang được chọn
    Locale currentLocale = settingsProvider.appLocale;
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
        break;
      default:
        currentSelectedLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final languageName = languages[index];
            return Column(
              children: [
                ListTile(
                  title: Text(languageName),
                  trailing:
                      currentSelectedLanguage == languageName
                          ? const Icon(Icons.check, color: Colors.blue)
                          : null,
                  onTap: () {
                    // Xác định locale mới dựa trên tên ngôn ngữ được chọn
                    Locale newLocale;
                    if (languageName ==
                        AppLocalizations.of(context)!.englishLanguage) {
                      newLocale = const Locale('en');
                    } else if (languageName ==
                        AppLocalizations.of(context)!.vietnameseLanguage) {
                      newLocale = const Locale('vi');
                    } else if (languageName ==
                        AppLocalizations.of(context)!.japaneseLanguage) {
                      newLocale = const Locale('ja');
                    } else {
                      newLocale = const Locale('en'); // Default language
                    }

                    // Gọi phương thức thay đổi trong Provider
                    settingsProvider.changeLocale(newLocale);
                    print('NEW LOCALE ---------$newLocale');
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.grey[300]),
              ],
            );
          },
          // Tính toán scroll offset dựa trên ngôn ngữ hiện tại từ Provider
          controller: ScrollController(
            initialScrollOffset:
                languages.contains(currentSelectedLanguage)
                    ? languages.indexOf(currentSelectedLanguage) *
                        50.0 // Ước tính chiều cao ListTile + Divider
                    : 0.0,
          ),
        );
      },
    );
  }

  // Hàm chọn tiền tệ - sửa đổi để dùng Provider
  void _showCurrencySelectionDialog(SettingsProvider settingsProvider) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return ListView.builder(
          itemCount: currencies.length, // Sử dụng danh sách mã tiền tệ
          itemBuilder: (context, index) {
            final currencyCode = currencies[index];
            return Column(
              children: [
                ListTile(
                  title: Text(currencyCode), // Hiển thị mã tiền tệ
                  trailing:
                      settingsProvider.selectedCurrency == currencyCode
                          ? const Icon(Icons.check, color: Colors.blue)
                          : null,
                  onTap: () {
                    settingsProvider.changeCurrency(currencyCode);
                    print('NEW CURRENCY---------$currencyCode');
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.grey[300]),
              ],
            );
          },
          // Tính toán scroll offset dựa trên tiền tệ hiện tại từ Provider
          controller: ScrollController(
            initialScrollOffset:
                settingsProvider.selectedCurrency != null
                    ? currencies.indexOf(settingsProvider.selectedCurrency) *
                        50.0 // Ước tính chiều cao ListTile + Divider
                    : 0.0,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lắng nghe thay đổi từ SettingsProvider
    // Dùng context.watch để widget này tự động build lại khi state thay đổi
    final settingsProvider = context.watch<SettingsProvider>();

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
      default:
        displayLanguage = AppLocalizations.of(context)!.englishLanguage;
        break;
    }

    bool enableNotifications = true;

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
                            subtitle: 'dd/MM/yyyy',
                            onTap: () {},
                          ),
                          MenuSettingTitle(
                            icon: Icons.format_paint,
                            title:
                                AppLocalizations.of(context)!.chooseThemeButton,
                            subtitle: 'Dark Mode',
                            onTap: () {},
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
                            onSwitchChanged: (value) {},
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
