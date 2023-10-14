import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/provider/provider_class.dart';
import 'package:sampleproviderproject/view/home_screen/shop_homepage.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShopHome(),
      ),
    );
  }
}
