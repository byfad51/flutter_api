import 'package:ecommerce/models/address.dart';
import 'package:flutter/material.dart';

class MyAdressCard extends StatelessWidget {
 final Address address;
  const MyAdressCard({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        color: Color(0xff5b98a4),
        child: Column(
          children: [
            Text('${address.firstname} ${address.lastname} - ${address.phoneNumber}', style: TextStyle(fontSize: 20),),
            Text('${address.fullAddress} ${address.postalCode} ${address.district} ${address.city}', style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
