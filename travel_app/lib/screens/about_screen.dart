import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutAppBar),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/travel_guide_vn.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.version,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                ),
                Text(
                  '1.0.0',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.aboutSection,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.aboutDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.featureSection,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '- ${AppLocalizations.of(context)!.featureDescription1}\n'
              '- ${AppLocalizations.of(context)!.featureDescription2}\n'
              '- ${AppLocalizations.of(context)!.featureDescription3}\n'
              '- ${AppLocalizations.of(context)!.featureDescription4}\n'
              '- ${AppLocalizations.of(context)!.featureDescription5}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.developerSection,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.developerDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                AppLocalizations.of(context)!.thankYou,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
