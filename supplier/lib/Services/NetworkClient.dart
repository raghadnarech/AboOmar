// ignore_for_file: camel_case_types, non_constant_identifier_names, constant_identifier_names
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Controller/ServicesProvider.dart';

enum RequestType { GET, POST }

enum RequestTypeImage { POST_WITH_IMAGE, POST_WITH_MULTI_IMAGE }

class NetworkClient {
  static final String _baseUrl = AppApi.url;

  final Client _client;

  NetworkClient(this._client);
  Future<MultipartRequest> requestimage({
    required String path,
    Map<String, String>? body,
    http.MultipartFile? image,
  }) async {
    // print("$_baseUrl$path");
    String? token = ServicesProvider.gettoken();
    log(token);
    return http.MultipartRequest(
      "POST",
      Uri.parse('$_baseUrl$path'),
    )
      ..fields.addAll(body!)
      ..files.add(image!)
      ..headers.addAll(
        {
          "Accept": "application/json",
          'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
        },
      );
  }

  Future<MultipartRequest> requestwithotimage({
    required String path,
    Map<String, String>? body,
  }) async {
    // print("$_baseUrl$path");
    String? token = ServicesProvider.gettoken();
    log(token);
    return http.MultipartRequest(
      "POST",
      Uri.parse('$_baseUrl$path'),
    )
      ..fields.addAll(body!)
      ..headers.addAll(
        {
          "Accept": "application/json",
          'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
        },
      );
  }

  Future<Response> request(
      {required RequestType requestType,
      required String path,
      Map<String, dynamic>? body,
      int TimeOut = 30}) async {
    log("$_baseUrl$path");
    log(ServicesProvider.gettoken());

    switch (requestType) {
      case RequestType.GET:
        if (ServicesProvider.user?.token != null) {
          return _client.get(Uri.parse("$_baseUrl$path"), headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
          }).timeout(Duration(seconds: TimeOut));
        } else {
          return _client.get(Uri.parse("$_baseUrl$path"), headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
          }).timeout(Duration(seconds: TimeOut));
        }

      case RequestType.POST:
        if (ServicesProvider.user?.token != null) {
          // log(ServicesProvider.user?.token.toString() ?? '');
          log(ServicesProvider.gettoken());

          log(body.toString());
          log("$_baseUrl$path");
          return _client
              .post(Uri.parse("$_baseUrl$path"),
                  headers: {
                    "Accept": "application/json",
                    'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
                  },
                  body: json.encode(body))
              .timeout(Duration(seconds: TimeOut));
        } else {
          log(ServicesProvider.gettoken());

          return _client
              .post(Uri.parse("$_baseUrl$path"),
                  headers: {
                    "Accept": "application/json",
                    'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
                  },
                  body: body)
              .timeout(Duration(seconds: TimeOut));
        }
    }
  }
}
