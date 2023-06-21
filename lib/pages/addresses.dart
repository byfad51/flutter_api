import 'package:ecommerce/api/api_address.dart';
import 'package:ecommerce/components/address_card.dart';
import 'package:ecommerce/models/address.dart';
import 'package:flutter/material.dart';

class MyAddressesPage extends StatefulWidget {
  const MyAddressesPage({Key? key}) : super(key: key);

  @override
  State<MyAddressesPage> createState() => _MyAddressesPageState();
}

class _MyAddressesPageState extends State<MyAddressesPage> {
  List<Address> addresses = [];
  Future<void> getAllAddresses()async{
    addresses = await ApiAdress().getAllAddress();
    setState(() {

    });
  }
  @override
  void initState() {
    getAllAddresses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await getAllAddresses();
      },
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text("Addresses", style: TextStyle(fontSize: 22),),
          Expanded(
            child: ListView.builder(itemCount: addresses.length,itemBuilder: (
                context, index) {
              return MyAdressCard(address: addresses[index]);
            },),
          ),
        ],
      ),
    );
  }
}
