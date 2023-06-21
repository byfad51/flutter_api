import 'package:ecommerce/api/api_address.dart';
import 'package:ecommerce/components/button.dart';
import 'package:ecommerce/components/textfield.dart';
import 'package:ecommerce/models/address.dart';
import 'package:ecommerce/pages/addresses.dart';
import 'package:ecommerce/userdata.dart';
import 'package:flutter/material.dart';

class MyLogedPage extends StatefulWidget {
  const MyLogedPage({Key? key}) : super(key: key);

  @override
  State<MyLogedPage> createState() => _MyLogedPageState();
}

class _MyLogedPageState extends State<MyLogedPage> {
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController districtTextEditingController = TextEditingController();
  TextEditingController neighbourhoodTextEditingController =
      TextEditingController();
  TextEditingController postalCodeTextEditingController =
      TextEditingController();
  TextEditingController allAddressTextEditingController =
      TextEditingController();
  MyUserData myUserData = MyUserData();
  String? username;
  String? token;
  String? userId;
  Future<void> getUserData() async {
    username = await myUserData.getUsername();
    token = await myUserData.getToken();
    userId = await myUserData.getUserId();
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }
  ApiAdress apiAdress = ApiAdress();
Future<void> addAddress()async{

Address address = Address(id: 0,firstname: firstNameTextEditingController.text,
    lastname: lastNameTextEditingController.text, city: cityTextEditingController.text,
    district: districtTextEditingController.text,
    neighbourhood: neighbourhoodTextEditingController.text,
    fullAddress: allAddressTextEditingController.text, postalCode: postalCodeTextEditingController.text,
    phoneNumber: phoneTextEditingController.text);

await apiAdress.addAddress(address);

}
  void _showAdd() {
    showModalBottomSheet(

      context: context,
      builder: (context) {
        return Card(
          elevation: 110,
          color: Colors.blueGrey,
          margin: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 9 / 10,
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ADD ADDRESS",
                    style: TextStyle(fontSize: 20),
                  ),
                  MyTextField(
                      name: "First Name",
                      textEditingController: firstNameTextEditingController),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      name: "Last Name",
                      textEditingController: lastNameTextEditingController),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      name: "Phone",
                      textEditingController: phoneTextEditingController),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      name: "City",
                      textEditingController: cityTextEditingController),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      name: "District",
                      textEditingController: districtTextEditingController),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      name: "Neighbourhood",
                      textEditingController:
                          neighbourhoodTextEditingController),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      name: "Postal Code",
                      textEditingController: postalCodeTextEditingController),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      name: "All Address",
                      textEditingController: allAddressTextEditingController),
                  MyButton(voidCallback: () {addAddress();}, name: "ADD"),
                  SizedBox(height: 5,),
                  MyButton(voidCallback: () {
                    Navigator.pop(context);
                  }, name: "CANCEL")
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cheap Book"),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Text(
                "Welcome, ${username}",
                style: TextStyle(fontSize: 20),
              ),
              MyButton(
                  voidCallback: () {
                    _showAdd();
                  },
                  name: "ADD NEW ADDRESS"),
              Expanded(child: MyAddressesPage())
            ],
          ),
        ),
      ),
    );
  }
}
