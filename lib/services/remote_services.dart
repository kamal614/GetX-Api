import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/product.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<List<Welcome>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    var jsonString = response.body;
    print(jsonString);
    return welcomeFromJson(jsonString);

    // if (response.statusCode == 200) {
    //   var jsonString = response.body;
    //   return welcomeFromJson(jsonString);
    // } else {
    //   // ignore: avoid_print
    //   print("An Error Occured");

    // }
  }
}
