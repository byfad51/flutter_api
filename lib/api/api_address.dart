import 'package:dio/dio.dart';
import 'package:ecommerce/api/app.dart';
import 'package:ecommerce/models/address.dart';
import 'package:ecommerce/userdata.dart';

class ApiAdress{
  MyUserData myUserData = MyUserData();

  Future<List<Address>> getAllAddress() async{
    String token = await myUserData.getToken() ?? "";
    List<Address> addresses = [];
    String userId = await myUserData.getUserId()??"";
    var json = await Dio().get('${url}address/getUserAddresses/${userId}',options: Options(headers: {
      "Authorization": token
    }),);
    print(json.data);
    List myAddress = json.data;
    myAddress.forEach((value) {
      Address address = Address.fromMap(value);
      addresses.add(address);
    });
    return addresses;
  }

  Future<void> addAddress(Address address) async {
    try {
      String userId = await myUserData.getUserId() ?? "";
      String token = await myUserData.getToken() ?? "";
      var response = await Dio().post('${url}address/addAddress/$userId',
          options: Options(headers: {
            "Authorization": token
          }),
          data: {
        "firstname": address.firstname,
        "lastname": address.lastname,
        "city": address.city,
        "district": address.district,
        "neighbourhood": address.neighbourhood,
        "fullAddress": address.fullAddress,
        "postalCode": address.postalCode,
        "phoneNumber": address.phoneNumber,
      });

      // İstek başarıyla tamamlandıysa, isteği yazdırabilirsiniz
      print(response.data);
    } catch (e) {
      // Hata durumunda, hatayı yazdırabilirsiniz
      print('Hata oluştu: $e');
    }
  }


}