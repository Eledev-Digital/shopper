import 'package:flutter/material.dart';
import 'package:shopper/shopper.dart';
import 'package:shopper/shopper_config.dart';

void main() async {
  ShopperConfig.setConfig(
    storeUrl: '',
    storefrontApiVersion: '2020-04',
    storefrontAccessToken: '',
  );

  ShopperStore store = ShopperStore.instance;
  final products = await store.getProducts(limit: 10);

  print(products.products[0].title);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Shopper'),
        ),
      ),
    );
  }
}
