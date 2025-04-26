import 'package:intl/intl.dart';

class Formatters {
  /// Định dạng tiền tệ với dấu phẩy
  static String formatPrice(int price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price) + ' VND';
  }

  /// Định dạng ngày
  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}