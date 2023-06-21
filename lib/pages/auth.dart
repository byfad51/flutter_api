import 'package:ecommerce/api/api_auth.dart';
import 'package:ecommerce/components/button.dart';
import 'package:ecommerce/components/textfield.dart';
import 'package:ecommerce/pages/loged.dart';
import 'package:ecommerce/userdata.dart';
import 'package:flutter/material.dart';

class MyAuthPage extends StatefulWidget {
  const MyAuthPage({Key? key}) : super(key: key);

  @override
  State<MyAuthPage> createState() => _MyAuthPageState();
}

class _MyAuthPageState extends State<MyAuthPage> {
  bool _isLoged = false;
  @override
  void initState() {
    _isloged();
        super.initState();
  }
  Future<void> _isloged() async {
    if(await myUserData.getToken() != null && await myUserData.getUsername() != null){
      _isLoged = true;
    }else{
      _isLoged = false;
    }
    setState(() {

    });
  }

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  MyUserData myUserData = MyUserData();
  ApiAuth apiAuth = ApiAuth();

  Future<void> login() async {
    myUserData.deleteAll();
    await apiAuth.login(
        textEditingController.text, textEditingController2.text);
    setState(() {

    });
      }

  @override
  Widget build(BuildContext context) {
    return !_isLoged ? Scaffold(
      body:  Center(
        child: Container(
          color: Colors.white30,
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("MY                  ",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xD8008F72),
                    )),
                const Text(
                  "    CHEAP        ",
                  style: TextStyle(fontSize: 50, color: Color(0xD8004938)),
                ),
                const Text(
                  "              BOOK",
                  style: TextStyle(fontSize: 50, color: Color(0xD8002D22)),
                ),
                const SizedBox(
                  height: 75,
                ),
                MyTextField(
                    name: "username",
                    textEditingController: textEditingController),
                const SizedBox(
                  height: 5,
                ),
                MyTextField(
                  name: "password",
                  textEditingController: textEditingController2,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                MyButton(
                  name: "Login",
                  voidCallback: () {
                    login();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {}, child: Text("Forgotten password?")),
                    TextButton(
                        onPressed: () {}, child: Text("Register for free"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ):MyLogedPage();
  }
}
