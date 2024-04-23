import 'package:http/http.dart' as http;
import 'package:untitled1/Utils/API/web_controllers.dart';
import 'package:untitled1/Utils/API/web_methods.dart';
import 'package:untitled1/Utils/storage_utils.dart';

import 'base_http_request_utils.dart';

class ProjectRequestsUtils extends BaseHttpRequest {
  Future<http.Response?> sendOtpCode({
    required String phoneNumber,
  }) async {
    return await makeHttpRequest(
      webController: WebController.Authentication,
      webMethod: WebMethods.LoginTaalBaan,
      type: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'mobile': phoneNumber,
      },
    );
  }

  Future<http.Response?> verifyOtpCode({
    required String otpId,
    required String otpCode,
    required int userId,
  }) async {
    return await makeHttpRequest(
      webController: WebController.Authentication,
      webMethod: WebMethods.VerifyOtp,
      type: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'userId': userId,
        'otpId': otpId,
        'otpCode': otpCode,
      },
    );
  }

  Future<http.Response?> generateToken({
    required String otpId,
    required String otpCode,
    required int userId,
  }) async {
    return await makeHttpRequest(
      webController: WebController.Authentication,
      webMethod: WebMethods.GenerateTaalBaanToken,
      type: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'userId': userId,
        'otpId': otpId,
        'otpCode': otpCode,
      },
    );
  }

  Future<http.Response?> getUserInfo() async {
    return await makeHttpRequest(
      webController: WebController.TaalBaanUser,
      webMethod: WebMethods.GetMyProfile,
      type: 'post',
      headers: {
        'Authorization': 'Bearer ' + await StorageUtils.getToken(),
        'Content-Type': 'application/json',
      },
    );
  }

  Future<http.Response?> editProfile({
    required String name,
    required String family,
    required String email,
    required int gender,
    String? image,
  }) async {
    return await makeHttpRequest(
      webController: WebController.TaalBaanUser,
      webMethod: WebMethods.EditeMyProfile,
      type: 'post',
      headers: {
        'Authorization': 'Bearer ' + await StorageUtils.getToken(),
        'Content-Type': 'multipart/form-data',
      },
      body: {
        'Name': name,
        'Family': family,
        'Gender': gender,
        'Email': email,
        'Image': image,
      },
    );
  }
}
