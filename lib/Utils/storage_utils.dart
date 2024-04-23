import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static final box = GetStorage();

  static Future<void> setToken({
    required String token,
  }) async {
    await box.write(
      'token',
      token,
    );
  }

  static Future<dynamic> getToken() async {
    return box.read(
      'token',
    );
  }

  static Future<void> deleteToken() async {
    return box.remove(
      'token',
    );
  }

}
