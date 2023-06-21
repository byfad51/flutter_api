import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final TextEditingController textEditingController;
final bool isPassword;
  const MyTextField({Key? key, required this.name, required this.textEditingController, this.isPassword=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: TextStyle(color: Color(0xFF159478), fontWeight: FontWeight.w300),
      obscureText: isPassword,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText:name,
        hintText: name,
      ),
    );
  }
}
