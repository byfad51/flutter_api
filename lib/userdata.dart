import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyUserData {
  final _storage = FlutterSecureStorage();

  Future<String?> getUsername() async {
    return await _storage.read(key: "username");
  }
  Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }
  Future<String?> getUserId() async {
    return await _storage.read(key: "userId");
  }

  Future<void> setUser(String token, String username, String userId) async {
    await _storage.write(key: "token", value: token);
    await _storage.write(key: "username", value: username);
    await _storage.write(key: "userId", value: userId);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
