import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/Utils/API/web_methods.dart';
import 'package:untitled1/Views/show_internet_connection_alert.dart';

import 'web_controllers.dart';

class BaseHttpRequest {
  static BaseHttpRequest instance = BaseHttpRequest();

  static String token = 'test';
  static String baseRequestUrl = 'https://taalnewapi.hoodadtechnology.ir/api';
  static String baseFileRequestUrl = 'https://my.toppoints.ca/storage/';

  Future<http.Response?> makeHttpRequest({
    WebMethods? webMethod,
    required WebController webController,
    WebController? optionalWebMethod,
    String? pathVariable,
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParameters,
    required String type,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      await showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              content: ShowInternetConnectionAlert(),
            );
          });

      makeHttpRequest(
        type: type,
        webController: webController,
        webMethod: webMethod,
        pathVariable: pathVariable,
        body: body,
        // files: files,
        // indexFiles: indexFiles,
        headers: headers,
        // bearer: bearer,
      );

      /// toDo: show net connection error
      ///
      ///

      return null;
    } else {
      http.Response? response;
      Uri pathUri = makePath(
        webMethod: webMethod,
        webController: webController,
        optionalController: optionalWebMethod,
        pathVariable: pathVariable,
        queryParameters: queryParameters,
      );
      print('~~~~~~~~~>Path<~~~~~~~~~~~~: \n');
      print(pathUri);

      print('~~~~~~~~~>Body<~~~~~~~~~~~~: \n');
      print(body);

      print('~~~~~~~~~>Header<~~~~~~~~~~~~: \n');
      print(headers);

      print('~~~~~~~~~>Type<~~~~~~~~~~~~: \n');

      print(type);

      switch (type) {
        case 'post':
          {
            try {
              response = await http
                  .post(
                pathUri,
                body: jsonEncode(body),
                headers: headers,
              )
                  .timeout(
                const Duration(seconds: 30),
                onTimeout: () {
                  return http.Response('Time out', 600);
                },
              );
            } catch (e) {
              print(e);
            }
            print('~~~~~~~~~>Response<~~~~~~~~~~~~: \n');
            print(response!.body);
            return response;
          }
        case 'get':
          {
            try {
              response = await http
                  .get(
                pathUri,
                headers: headers,
              )
                  .timeout(
                const Duration(seconds: 30),
                onTimeout: () {
                  return http.Response(
                    'Time out',
                    600,
                  );
                },
              );
              print(response.body);
            } catch (e) {
              print(e);
            }
            return response;
          }
        case 'put':
          {
            try {
              response = await http
                  .put(
                pathUri,
                headers: headers,
              )
                  .timeout(
                const Duration(seconds: 30),
                onTimeout: () {
                  return http.Response(
                    'Time out',
                    600,
                  );
                },
              );
              print(response.body);
            } catch (e) {
              print(e);
            }
            return response;
          }
        case 'del':
          {
            try {
              response = await http
                  .delete(
                pathUri,
                body: body,
                headers: headers,
              )
                  .timeout(
                const Duration(seconds: 30),
                onTimeout: () {
                  return http.Response('Time out', 600);
                },
              );
            } catch (e) {
              print(e);
            }
            return response;
          }

        default:
          {
            return response;
          }
      }
    }
  }

  Future<http.Response> makeFileHttpRequest({
    WebMethods? webMethod,
    WebController? webController,
    WebController? optionalWebMethod,
    WebController? optionalWebController,
    String headers = '',
    required String type,
    String? pathVariable,
    String? filePath,
    Map<String, dynamic>? queryParameters,
  }) async {
    late http.MultipartRequest request;
    late http.StreamedResponse response1;
    late http.Response response;

    print('Path: \n');

    print('header: \n');
    print(headers);

    print('type: \n');
    print(type);

    Uri pathUri = makePath(
      webMethod: webMethod,
      webController: webController!,
      // optionalController: optionalWebMethod!,
      pathVariable: pathVariable,
      queryParameters: queryParameters,
    );

    print(pathUri);

    switch (type) {
      case 'post':
        {
          request = http.MultipartRequest(
            type.toUpperCase(),
            pathUri,
          );
          request.headers['Authorization'] = headers;
          request.files.add(
            await http.MultipartFile.fromPath(
              'image',
              filePath!,
            ),
          );

          try {
            response1 = await request.send();
            response = await http.Response.fromStream(response1);
          } catch (e) {
            print(e);
          }
          break;
        }
      case 'put':
        {
          request = http.MultipartRequest(
            type.toUpperCase(),
            pathUri,
          );
          request.headers['Authorization'] = headers;
          request.files.add(
            await http.MultipartFile.fromPath(
              'profile_picture',
              filePath!,
            ),
          );
          try {
            response1 = await request.send();
            response = await http.Response.fromStream(response1);
          } catch (e) {
            print(e);
          }
          break;
        }
      case 'patch':
        {
          // try {
          //   response = await http.patch(
          //     makePath(
          //       webMethod: webMethod,
          //       webController: webController,
          //     ),
          //     body: body,
          //     headers: headers,
          //   );
          // } catch (e) {
          //   print('TTTTTTTTTTTTTTTTTTTTTTT');
          //   print(e);
          // }
          break;
        }
      case 'get':
        {
          break;
        }
    }

    print('status Code: \n');
    print(response.statusCode);

    print('response body: \n');
    print(response.body);

    return response;
  }

  static Uri makePath({
    required WebController webController,
    WebMethods? webMethod,
    WebController? optionalController,
    String? pathVariable,
    Map<String, dynamic>? queryParameters,
  }) {
    Uri requestPath;

    if (optionalController != null) {
      if (pathVariable != null) {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable',
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable',
            );
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/$pathVariable/'
                      .replaceAll('-', '_'),
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/$pathVariable/'
                      .replaceAll('-', '_'),
            );
          }
        }
      } else {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/${webMethod.name}/'
                      .replaceAll('-', '_'),
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/${webMethod.name}/'
                      .replaceAll('-', '_'),
            );
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/'
                      .replaceAll('-', '_'),
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${optionalController.name}/${webController.name}/'
                      .replaceAll('-', '_'),
            );
          }
        }
      }
    } else {
      if (pathVariable != null) {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${webController.name}/${webMethod.name}/$pathVariable/'
                      .replaceAll('-', '_'),
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${webController.name}/${webMethod.name}/$pathVariable',
            );
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${webController.name}/$pathVariable/'.replaceAll('-', '_'),
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${webController.name}/$pathVariable'.replaceAll('-', '_'),
            );
          }
        }
      } else {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${webController.name}/${webMethod.name}'
                      .replaceAll('-', '_'),
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl +
                  '/${webController.name}/${webMethod.name}'
                      .replaceAll('-', '_'),
            );
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.parse(
              baseRequestUrl + '/${webController.name}'.replaceAll('-', '_'),
            ).replace(
              queryParameters: queryParameters,
            );
          } else {
            requestPath = Uri.parse(
              baseRequestUrl + '/${webController.name}'.replaceAll('-', '_'),
            );
          }
        }
      }
    }

    return requestPath;
  }
}
