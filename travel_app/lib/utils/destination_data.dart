// lib/utils/destination_data.dart

import 'package:travel_app/utils/constants/image_string.dart';

final List<Map<String, dynamic>> destinations = [
  {
    'name': 'Ho Guom',
    'description': 'A historic lake in Hanoi',
    'price': 10000,
    'openTime': '2025-04-26 08:00',
    'phone': '0123456789',
    'imageUrl': CImages.daLat, // Đường dẫn đến hình ảnh
    'category': 'Cultural',
  },
  {
    'name': 'Thap Eiffel',
    'description': 'A landmark in Paris',
    'price': 20000,
    'openTime': '2025-04-26 09:00',
    'phone': '0987654321',
    'imageUrl': CImages.phuYen,
    'category': 'Cultural',
  },
  {
    'name': 'Tuong Nu Than Tu Do',
    'description': 'A symbol of freedom in the USA',
    'price': 30000,
    'openTime': '2025-04-26 10:00',
    'phone': '0212345678',
    'imageUrl': CImages.hue,
    'category': 'Historical',
  },
  {
    'name': 'Vinh Ha Long',
    'description': 'A natural wonder of the world',
    'price': 25000,
    'openTime': '2025-04-26 08:30',
    'phone': '0345678901',
    'imageUrl': CImages.haLong,
    'category': 'Nature',
  },
];