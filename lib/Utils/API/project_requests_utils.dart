import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:untitled1/Blocs/blocs_utils.dart';
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

  Future<http.Response?> getMapScooters({
    required String lat,
    required String lng,
    int? type,
  }) async {
    return await makeHttpRequest(
      webController: WebController.TaalBaanScooter,
      webMethod: WebMethods.GetDefectiveScooters,
      type: 'post',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + await StorageUtils.getToken(),
      },
      body: (type is int)
          ? {
              'lat': lat,
              'lng': lng,
              'type': type,
            }
          : {
              'lat': lat,
              'lng': lng,
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
    String? email,
    required int gender,
    File? image,
  }) async {
    if (image is File) {
      return await makeFileHttpRequest(
        webController: WebController.TaalBaanUser,
        webMethod: WebMethods.EditeMyProfile,
        type: 'post',
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ' + await StorageUtils.getToken(),
        },
        fields: {
          'Name': name,
          'Family': family,
          'Gender': gender.toString(),
          'Email': email ?? '',
        },
        files: <http.MultipartFile>[
          http.MultipartFile.fromBytes(
            'Image',
            await image.readAsBytes(),
            filename:
                '${Blocs.infoBloc.info!.name}_${Blocs.infoBloc.info!.family}.jpg',
          ),
        ],
      );
    } else {
      return await makeFileHttpRequest(
        webController: WebController.TaalBaanUser,
        webMethod: WebMethods.EditeMyProfile,
        type: 'post',
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ' + await StorageUtils.getToken(),
        },
        fields: {
          'Name': name,
          'Family': family,
          'Gender': gender.toString(),
          'Email': email ?? '',
        },
        files: null,
      );
    }
  }
}
