import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatters {
  /// Định dạng tiền tệ với dấu phẩy
  // static String formatPrice(int price) {
  //   final formatter = NumberFormat('#,##0');
  //   return '${formatter.format(price)} VND';
  // }

  /// Định dạng ngày
  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String formatCurrency(
    double amount,
    String currencyCode,
    Locale locale,
  ) {
    // Tạo NumberFormat dựa trên locale VÀ currency code
    // Ví dụ: locale 'vi_VN' và currency 'VND' -> 25.000.000 ₫
    // Ví dụ: locale 'en_US' và currency 'USD' -> $1,000.00
    // Ví dụ: locale 'ja_JP' và currency 'JPY' -> ￥150,000
    // Currency code xác định ký hiệu tiền tệ.
    final format = NumberFormat.currency(
      locale: locale.toString(), // ví dụ: 'vi_VN', 'en_US', 'ja_JP'
      symbol: _getCurrencySymbol(
        currencyCode,
      ), // Lấy ký hiệu chuẩn cho mã tiền tệ
      decimalDigits: currencyCode == 'VND' ? 0 : 2, // Có thể tùy chỉnh số lẻ
    );
    return format.format(amount);
  }

  static String _getCurrencySymbol(String currencyCode) {
    switch (currencyCode) {
      case 'USD':
        return '\$';
      case 'JPY':
        return '¥';
      default:
        return '₫';
    }
  }

  static double convertCurrency(double price, String targetCurrency) {
    double usdToVndRate = 0.00004; // Tỉ giá USD sang VNĐ
    double jpyToVndRate = 0.0055; // Tỉ giá Yên Nhật sang VNĐ
    if (targetCurrency == 'USD') {
      return price * usdToVndRate;
    } else if (targetCurrency == 'JPY') {
      return price * jpyToVndRate;
    }
    return price; // Mặc định là VND
  }
}
