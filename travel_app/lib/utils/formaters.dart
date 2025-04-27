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


  static String formatCurrency(double amount, Locale locale) {
    double usdToVndRate = 0.00004; // Tỉ giá USD sang VNĐ
    double jpyToVndRate = 0.0055; // Tỉ giá Yên Nhật sang VNĐ
    String currency;

    // Xác định mệnh giá dựa trên locale
    if (locale.languageCode == 'vi') {
      currency = 'VNĐ';
      amount = amount; // Giả sử giá là VNĐ
    } else if (locale.languageCode == 'en') {
      currency = 'USD';
      amount *= usdToVndRate; // Chuyển đổi từ USD sang VNĐ
    } else if (locale.languageCode == 'ja') {
      currency = 'JPY';
      amount *= jpyToVndRate; // Chuyển đổi từ Yên Nhật sang VNĐ
    } else {
      currency = 'VNĐ';
    }

    final formatter = NumberFormat.simpleCurrency(locale: locale.toString(), name: currency);
    return formatter.format(amount);
  }
}