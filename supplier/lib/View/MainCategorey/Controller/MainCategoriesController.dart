import 'package:flutter/material.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;

class MainCategoriesController with ChangeNotifier {
  List<Category> listcategory = [];

  NetworkClient client = NetworkClient(http.Client());
}
