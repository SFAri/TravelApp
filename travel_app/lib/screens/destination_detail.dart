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
        title: Text(AppLocalizations.of(context)!.getString(widget.destination['nameKey']!)),
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
                  AppLocalizations.of(context)!.getString(widget.destination['nameKey']!),
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
              AppLocalizations.of(context)!.getString(widget.destination['descriptionKey']),
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

extension on AppLocalizations {
  String getString(key) {
    switch (key) {
      case 'place_name_0':
        return place_name_0;
      case 'place_desc_0':
        return place_desc_0;
      case 'place_name_1':
        return place_name_1;
      case 'place_desc_1':
        return place_desc_1;
      case 'place_name_2':
        return place_name_2;
      case 'place_desc_2':
        return place_desc_2;
      case 'place_name_3':
        return place_name_3;
      case 'place_desc_3':
        return place_desc_3;
      case 'place_name_4':
        return place_name_4;
      case 'place_desc_4':
        return place_desc_4;
      case 'place_name_5':
        return place_name_5;
      case 'place_desc_5':
        return place_desc_5;
      case 'place_name_6':
        return place_name_6;
      case 'place_desc_6':
        return place_desc_6;
      case 'place_name_7':
        return place_name_7;
      case 'place_desc_7':
        return place_desc_7;
      case 'place_name_8':
        return place_name_8;
      case 'place_desc_8':
        return place_desc_8;
      case 'place_name_9':
        return place_name_9;
      case 'place_desc_9':
        return place_desc_9;
      case 'place_name_10':
        return place_name_10;
      case 'place_desc_10':
        return place_desc_10;
      case 'place_name_11':
        return place_name_11;
      case 'place_desc_11':
        return place_desc_11;
      case 'place_name_12':
        return place_name_12;
      case 'place_desc_12':
        return place_desc_12;
      case 'place_name_13':
        return place_name_13;
      case 'place_desc_13':
        return place_desc_13;
      case 'place_name_14':
        return place_name_14;
      case 'place_desc_14':
        return place_desc_14;
      case 'place_name_15':
        return place_name_15;
      case 'place_desc_15':
        return place_desc_15;
      case 'place_name_16':
        return place_name_16;
      case 'place_desc_16':
        return place_desc_16;
      case 'place_name_17':
        return place_name_17;
      case 'place_desc_17':
        return place_desc_17;
      case 'place_name_18':
        return place_name_18;
      case 'place_desc_18':
        return place_desc_18;
      case 'place_name_19':
        return place_name_19;
      case 'place_desc_19':
        return place_desc_19;
      case 'place_name_20':
        return place_name_20;
      case 'place_desc_20':
        return place_desc_20;
      case 'place_name_21':
        return place_name_21;
      case 'place_desc_21':
        return place_desc_21;
      case 'place_name_22':
        return place_name_22;
      case 'place_desc_22':
        return place_desc_22;
      case 'place_name_23':
        return place_name_23;
      case 'place_desc_23':
        return place_desc_23;
      case 'place_name_24':
        return place_name_24;
      case 'place_desc_24':
        return place_desc_24;
      case 'place_name_25':
        return place_name_25;
      case 'place_desc_25':
        return place_desc_25;
      case 'place_name_26':
        return place_name_26;
      case 'place_desc_26':
        return place_desc_26;
      case 'place_name_27':
        return place_name_27;
      case 'place_desc_27':
        return place_desc_27;
      case 'place_name_28':
        return place_name_28;
      case 'place_desc_28':
        return place_desc_28;
      case 'place_name_29':
        return place_name_29;
      case 'place_desc_29':
        return place_desc_29;
      case 'place_name_30':
        return place_name_30;
      case 'place_desc_30':
        return place_desc_30;
      case 'place_name_31':
        return place_name_31;
      case 'place_desc_31':
        return place_desc_31;
      case 'place_name_32':
        return place_name_32;
      case 'place_desc_32':
        return place_desc_32;
      case 'place_name_33':
        return place_name_33;
      case 'place_desc_33':
        return place_desc_33;
      case 'place_name_34':
        return place_name_34;
      case 'place_desc_34':
        return place_desc_34;
      case 'place_name_35':
        return place_name_35;
      case 'place_desc_35':
        return place_desc_35;
      default:
        return '';
    }
  }
}
