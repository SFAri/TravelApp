import 'package:flutter/material.dart';
import 'package:travel_app/screens/widgets/navigation_menu.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqItems = [
      {
        'question': AppLocalizations.of(context)!.faqQuestion1,
        'answer': AppLocalizations.of(context)!.faqAnswer1,
      },
      {
        'question': AppLocalizations.of(context)!.faqQuestion2,
        'answer': AppLocalizations.of(context)!.faqAnswer2,
      },
      {
        'question': AppLocalizations.of(context)!.faqQuestion3,
        'answer': AppLocalizations.of(context)!.faqAnswer3,
      },
      {
        'question': AppLocalizations.of(context)!.faqQuestion4,
        'answer': AppLocalizations.of(context)!.faqAnswer4,
      },
      {
        'question': AppLocalizations.of(context)!.faqQuestion5,
        'answer': AppLocalizations.of(context)!.faqAnswer5,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.tutorialAppBar),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.tutorialTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.live_help_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.hintSearchText,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.faqSection,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...faqItems.map(
                    (item) => Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          item['question']!,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              item['answer']!,
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.copyWith(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.findByCatogarySection,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        MenuSettingTitle(
                          icon: Icons.home,
                          title: AppLocalizations.of(context)!.homeAppbar,
                          onTap: () {
                            // Navigate to home screen
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => NavigationMenu(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                        MenuSettingTitle(
                          icon: Icons.help_rounded,
                          title: AppLocalizations.of(context)!.tutorialSection,
                          onTap: () {},
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.headset_mic),
      ),
    );
  }
}
