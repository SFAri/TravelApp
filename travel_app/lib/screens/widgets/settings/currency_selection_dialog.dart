import 'package:flutter/material.dart';

class CurrencySelectionDialog extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final void Function(String currency) onCurrencySelected;

  const CurrencySelectionDialog({
    super.key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencySelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencies.length,
      controller: ScrollController(
        initialScrollOffset: currencies.indexOf(selectedCurrency) * 50.0,
      ),
      itemBuilder: (context, index) {
        final currency = currencies[index];
        return Column(
          children: [
            ListTile(
              title: Text(currency),
              trailing:
                  selectedCurrency == currency
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
              onTap: () {
                onCurrencySelected(currency);
                Navigator.pop(context);
              },
            ),
            if (index < currencies.length - 1)
              Divider(
                height: 1,
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: Colors.grey[300],
              ),
          ],
        );
      },
    );
  }
}
