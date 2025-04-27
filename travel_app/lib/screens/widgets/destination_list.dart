import 'package:flutter/material.dart';
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
                    title: Text(destination['name']),
                    subtitle: Text(destination['description']),
                    trailing: Text(Formatters.formatCurrency(destination['price'].toDouble(), Localizations.localeOf(context))),
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