// // ignore_for_file: camel_case_types, non_constant_identifier_names
// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:yujad/Controllers/ServicesProvider.dart';
// import 'package:yujad/constant/url.dart';
// import 'package:http/http.dart' as http;

// enum RequestType { GET, POST }

// enum RequestTypeImage { POST_WITH_IMAGE, POST_WITH_MULTI_IMAGE }

// class NetworkClient {
//   static final String _baseUrl = AppApi.url;

//   final Client _client;

//   NetworkClient(this._client);
//   Future<MultipartRequest> requestimage({
//     required String path,
//     Map<String, String>? body,
//     List<http.MultipartFile>? listimage,
//   }) async {
//     // print("$_baseUrl$path");
//     print(ServicesProvider.gettoken());
//     String? token = await ServicesProvider.gettoken();
//     print(token);
//     return http.MultipartRequest(
//       "POST",
//       Uri.parse('$_baseUrl$path'),
//     )
//       ..fields.addAll(body!)
//       ..files.addAll(listimage!)
//       ..headers.addAll(
//         {
//           "Accept": "application/json",
//           'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
//         },
//       );
//   }

//   Future<Response> request(
//       {required RequestType requestType,
//       required String path,
//       Map<String, dynamic>? body,
//       int TimeOut = 30}) async {
//     print("$_baseUrl$path");

//     switch (requestType) {
//       case RequestType.GET:
//         if (ServicesProvider.user?.token != null) {
//           return _client.get(Uri.parse("$_baseUrl$path"), headers: {
//             "Accept": "application/json",
//             'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
//           }).timeout(Duration(seconds: TimeOut));
//         } else {
//           return _client.get(Uri.parse("$_baseUrl$path"), headers: {
//             "Accept": "application/json",
//             'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
//           }).timeout(Duration(seconds: TimeOut));
//         }

//       case RequestType.POST:
//         if (ServicesProvider.user?.token != null) {
//           print(ServicesProvider.user?.token);
//           print(body);
//           print("$_baseUrl$path");
//           return _client
//               .post(Uri.parse("$_baseUrl$path"),
//                   headers: {
//                     "Accept": "application/json",
//                     'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
//                   },
//                   body: json.encode(body))
//               .timeout(Duration(seconds: TimeOut));
//         } else {
//           return _client
//               .post(Uri.parse("$_baseUrl$path"),
//                   headers: {
//                     "Accept": "application/json",
//                     'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
//                   },
//                   body: body)
//               .timeout(Duration(seconds: TimeOut));
//         }
//     }
//   }
// }
