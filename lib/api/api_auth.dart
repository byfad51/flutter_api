

import 'package:dio/dio.dart';
import 'package:ecommerce/api/app.dart';
import 'package:ecommerce/userdata.dart';

class ApiAuth{
Dio dio = Dio();
MyUserData myUserData = MyUserData();
Future<void> login(String username, String password) async {
  try {
    var response = await dio.post('${url}auth/login', data: {
      "username": username,
      "password": password,
    });

    //print(response.data);
    await myUserData.setUser(response.data["message"], username, response.data["userId"].toString());

  } catch (error) {
    print('Hata oluştu: $error');
  }
}

}