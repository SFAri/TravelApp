import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/settings_provider.dart';
import 'package:travel_app/utils/formaters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DestinationDetailScreen extends StatefulWidget {
  final Map<String, dynamic> destination;

  const DestinationDetailScreen({super.key, required this.destination});

  @override
  State<DestinationDetailScreen> createState() => _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    final selectedCurrency = settingsProvider.selectedCurrency;
    final currentLocale = settingsProvider.appLocale;
    final selectedPattern = settingsProvider.selectedDateFormatPattern;

    // --- Định dạng lại openTime theo pattern đã chọn ---
    final String? openTimeString = widget.destination['openTime'];

    final String formattedOpenTime = Formatters.formatDateTimeString(
      openTimeString,
      selectedPattern, // Truyền pattern đã chọn
      currentLocale, // Truyền locale hiện tại
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination['name']!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.destination['imageUrl'])
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 20,
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  widget.destination['name']!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {  },
                  child: Text(widget.destination['category']!, style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.new_releases_rounded, color: Colors.amberAccent,),
                Text(
                  Formatters.formatCurrency(
                    Formatters.convertCurrency(widget.destination['price'].toDouble(), selectedCurrency),
                    selectedCurrency,
                    currentLocale,
                  ),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),

            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.descriptionSection,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)
              )
            ),
            Row(
              spacing: 20,
              children: [
                Text('- ${AppLocalizations.of(context)!.openTimeLabel}: ', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(formattedOpenTime)
              ],
            ),
            Row(
              spacing: 20,
              children: [
                Text('- ${AppLocalizations.of(context)!.phoneLabel}: ', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.destination['phone'])
              ],
            ),
            Text('- ${AppLocalizations.of(context)!.moreDetailLabel}: ', style: TextStyle(fontWeight: FontWeight.bold),),
            Text(
              widget.destination['description'],
              textAlign: TextAlign.left,
              overflow: TextOverflow.visible,
              maxLines: 200000,
            )
            // Thêm thông tin khác như giá vé, giờ mở cửa, v.v. ở đây
          ],
        ),
      ),
    );
  }
}
