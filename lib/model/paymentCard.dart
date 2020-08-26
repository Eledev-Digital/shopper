import 'package:flutter/foundation.dart';

class PaymentCard {
  final String firstName;

  /// optional
  final String middleName;

  final String lastName;

  /// long card number
  final String number;
  final String expiryMonth;
  final String expiryYear;

  /// security code on back of card.
  final String verificationCode;

  PaymentCard({
    @required this.firstName,
    this.middleName,
    @required this.lastName,
    @required this.number,
    @required this.expiryMonth,
    @required this.expiryYear,
    this.verificationCode,
  });

  Map<String, String> toMap() => {
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'number': number,
        'expiryMonth': expiryMonth,
        'expiryYear': expiryYear,
        'verificationCode': verificationCode
      };
}
