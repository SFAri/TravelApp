import 'package:flutter/material.dart';

class DestinationDetailScreen extends StatelessWidget {
  final Map<String, String> destination;

  const DestinationDetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(destination['imageUrl']!),
            SizedBox(height: 16),
            Text(
              destination['description']!,
              style: TextStyle(fontSize: 18),
            ),
            // Thêm thông tin khác như giá vé, giờ mở cửa, v.v. ở đây
          ],
        ),
      ),
    );
  }
}