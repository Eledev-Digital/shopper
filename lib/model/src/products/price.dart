import 'package:intl/intl.dart';

class Price {
  final String amount;
  final String currencyCode;
  final String formatted;
  static final NumberFormat formatter =
      NumberFormat.currency(locale: 'en_UK', symbol: '£');

  Price({
    this.amount,
    this.currencyCode,
    this.formatted,
  });

  factory Price.fromJson(Map<String, dynamic> data) => Price(
        amount: data['amount'],
        currencyCode: data['currencyCode'],
        formatted: _formatPrice(data['amount']),
      );

  static String _formatPrice(String priceString) {
    try {
      var price = double.parse(priceString);

      priceString = formatter.format(price);
    } catch (e) {}
    return priceString;
  }
}
