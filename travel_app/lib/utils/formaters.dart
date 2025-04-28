import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatters {
  /// Định dạng tiền tệ với dấu phẩy
  // static String formatPrice(int price) {
  //   final formatter = NumberFormat('#,##0');
  //   return '${formatter.format(price)} VND';
  // }

  /// Định dạng ngày giờ
  static String formatDateTimeString(
    String? inputString,
    String outputPattern,
    Locale outputLocale, {
    String inputPattern =
        'yyyy-MM-dd HH:mm', // Đặt pattern đầu vào cố định ở đây
  }) {
    if (inputString == null || inputString.isEmpty) {
      return ''; // Hoặc trả về null tùy logic bạn muốn
    }

    try {
      // Parse chuỗi đầu vào với pattern cố định
      final DateTime parsedDateTime = DateFormat(
        inputPattern,
      ).parseStrict(inputString);

      // Tạo formatter cho đầu ra với pattern và locale mong muốn
      final DateFormat outputFormatter = DateFormat(
        outputPattern,
        outputLocale.toString(),
      );

      // Format và trả về chuỗi kết quả
      return outputFormatter.format(parsedDateTime);
    } catch (e) {
      return inputString; // Trả về chuỗi gốc nếu có lỗi
    }
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
      decimalDigits: currencyCode == 'VND' ? 0 : 2,
    );
    return format.format(amount);
  }

  static String _getCurrencySymbol(String currencyCode) {
    switch (currencyCode) {
      case 'USD':
        return '\$';
      case 'VND':
        return '₫';
      case 'JPY':
        return '¥';
      default:
        return '\$'; // Mặc định là USD
    }
  }

  static double convertCurrency(double priceInUsd, String targetCurrency) {
    const double vndToUsdRate = 0.000038; // Tỉ giá USD sang USD
    const double jpyToUsdRate = 0.007; // Tỉ giá Yên Nhật sang USD
    const double usdToVndRate = 1 / vndToUsdRate;
    const double usdToJpyRate = 1 / jpyToUsdRate;

    double convertedAmount;
    // Thực hiện chuyển đổi
    if (targetCurrency == 'VND') {
      convertedAmount = priceInUsd * usdToVndRate;
    } else if (targetCurrency == 'JPY') {
      convertedAmount = priceInUsd * usdToJpyRate;
    } else if (targetCurrency == 'USD') {
      convertedAmount = priceInUsd;
    } else {
      convertedAmount = priceInUsd;
    }
    return convertedAmount;
  }

  static String getDisplayPatternString(String pattern) {
    String displayString;
    int timeMarkerIndex = pattern.indexOf('hh:');
    if (timeMarkerIndex == -1) {
      timeMarkerIndex = pattern.indexOf('HH:');
    }

    if (timeMarkerIndex != -1) {
      int splitIndex = pattern.lastIndexOf(' ', timeMarkerIndex);
      if (splitIndex != -1) {
        String datePart = pattern.substring(0, splitIndex);
        String timePart = pattern.substring(splitIndex + 1);
        displayString = '$datePart\n$timePart';
      } else {
        displayString = pattern;
      }
    } else {
      displayString = pattern;
    }
    return displayString;
  }
}
