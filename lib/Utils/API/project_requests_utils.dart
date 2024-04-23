import 'package:http/http.dart' as http;
import 'package:untitled1/Utils/API/web_controllers.dart';
import 'package:untitled1/Utils/API/web_methods.dart';

import 'base_http_request_utils.dart';

class ProjectRequestsUtils extends BaseHttpRequest {
  Future<http.Response?> sendOtpCode({
    required String phoneNumber,
  }) async {
    return await makeHttpRequest(
      webController: WebController.Authentication,
      webMethod: WebMethods.LoginTaalBaan,
      type: 'post',
        // 'Authorization': 'Bearer ' + await StorageUtils.getToken(),
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'mobile': phoneNumber,
      },
    );
  }
}
