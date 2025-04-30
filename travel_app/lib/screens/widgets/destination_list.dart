import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/settings_provider.dart';
import 'package:travel_app/screens/destination_detail.dart';
import 'package:travel_app/utils/formaters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DestinationListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> destinations;

  const DestinationListWidget({super.key, required this.destinations});

  @override
  State<DestinationListWidget> createState() => _DestinationListWidgetState();
}

class _DestinationListWidgetState extends State<DestinationListWidget> {
  List<Map<String, dynamic>> filteredDestinations = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredDestinations = widget.destinations;
  }

  void _filterDestinations(String query) {
    final filtered = widget.destinations.where((destination) {
      return destination['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      this.query = query;
      filteredDestinations = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    final selectedCurrency = settingsProvider.selectedCurrency;
    final currentLocale = settingsProvider.appLocale;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.hintSearchbar,
              border: OutlineInputBorder(),
            ),
            onChanged: _filterDestinations,
          ),
        ),
        Expanded(
          child: filteredDestinations.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.noValue,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: filteredDestinations.length,
              itemBuilder: (context, index) {
                final destination = filteredDestinations[index];
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 80,
                      child: Image.asset(destination['imageUrl'])
                    ),
                    title: Text(AppLocalizations.of(context)!.getString(destination['nameKey'])),
                    subtitle: Text(AppLocalizations.of(context)!.getString(destination['descriptionKey'])),
                    trailing: Text(
                      Formatters.formatCurrency(
                          Formatters.convertCurrency(destination['price'].toDouble(), selectedCurrency),
                          selectedCurrency,
                          currentLocale,
                        )
                      ),
                    onTap: () {
                      // Navigate to detail screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationDetailScreen(
                            destination: destination,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
        ),
      ],
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