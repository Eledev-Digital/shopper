import 'package:shopper/model/src/products/price.dart';

class DiscountAllocation {
  final Price allocatedAmount;

  DiscountAllocation({this.allocatedAmount});

  factory DiscountAllocation.fromJson(Map<String, dynamic> data) =>
      DiscountAllocation(
        allocatedAmount: Price.fromJson(data['allocatedAmount'] ?? {}),
      );
}
