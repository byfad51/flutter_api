import 'package:ecommerce/app_settings.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/products.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce',
      theme: ThemeData(
          primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(centerTitle: true, color: Color(0x2B673EFF))
      ),
      home: MyHomePage()
      // const MyProductsPage(title: 'E Commerce'),
    );
  }
}

