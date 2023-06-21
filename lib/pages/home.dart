import 'package:ecommerce/app_settings.dart';
import 'package:ecommerce/pages/auth.dart';
import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/pages/products.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedBottom = 1;

  void setSelect(int value){
    _selectedBottom = value;
    setState(() {});
  }

  Widget getPage(){
    if(_selectedBottom==0){
        return const MyAuthPage();
    }else if(_selectedBottom==1){
      return const MyProductsPage();
    }else if(_selectedBottom==2){
      return const MyCartPage();
    }
    return Text("page error");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        backgroundColor: buttomBarBackgroundColor,
        selectedItemColor: bottomBarSelectedColor,
         currentIndex: _selectedBottom,
        onTap: (value) => setSelect(value),
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Person",activeIcon: Icon(Icons.person)),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Products",activeIcon: Icon(Icons.category_outlined)),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart",activeIcon: Icon(Icons.shopping_cart) ),
      ]),
      body: getPage(),
    );
  }
}
