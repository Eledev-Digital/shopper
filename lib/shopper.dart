import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shopper/model/paymentCard.dart';

class Shopper {
  static const MethodChannel _channel = const MethodChannel('shopper');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> vaultCard(PaymentCard card) async {
    Map<String, String> cardMap = card.toMap();
    final String vaultedCard = await _channel.invokeMethod('vaulCard', cardMap);
    return vaultedCard;
  }

  // vault card method
  // let settings: Storefront.PaymentSettings
  // let cardClient: Card.Client

  // let creditCard = Card.CreditCard(
  // 	firstName:        "John",
  // 	middleName:       "Singleton",
  // 	lastName:         "Smith",
  // 	number:           "1234567812345678",
  // 	expiryMonth:      "07",
  // 	expiryYear:       "19",
  // 	verificationCode: "1234"
  // )

  // let task = cardClient.vault(creditCard, to: settings.cardVaultUrl) { token, error in
  //     if let token = token {
  //         // proceed to complete checkout with `token`
  //     } else {
  //         // handle error
  //     }
  // }
  // task.resume()

  // get payment body

}
