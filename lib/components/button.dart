import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final VoidCallback voidCallback;
  const MyButton({Key? key, required this.voidCallback, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(150, 50),
    backgroundColor: Colors.white30,
          textStyle: TextStyle(color: Color(0xFF159478))// Buton rengini siyah yapmak için `primary` özelliğini kullanın
        ),
        onPressed: () {
      voidCallback();
    }, child:Text(name));
  }
}

