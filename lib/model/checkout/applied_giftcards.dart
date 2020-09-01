import 'package:shopper/model/products/price.dart';

class AppliedGiftCards {
  final Price amountUsed;
  final Price balance;
  final String id;

  AppliedGiftCards({this.amountUsed, this.balance, this.id});

  factory AppliedGiftCards.fromJson(Map<String, dynamic> data) {
    return AppliedGiftCards(
      id: data['id'],
      amountUsed: Price.fromJson(data['amountUsedV2']),
      balance: Price.fromJson(data['balanceV2']),
    );
  }
}
