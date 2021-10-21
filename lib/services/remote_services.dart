import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/product.dart';

class RemoteServices {
  static var client = http.Client();
  //we'll fetch the product and return to the controller
  static Future<List<Welcome>> fetchProducts() async {
    //now we'll get the actual list of products
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    //all the json data is now in the jsonString variable
    var jsonString = response.body;

    print(jsonString);
    return welcomeFromJson(jsonString);
    //now the JSON data has been converted into the list using the function named welcomeFromJson which was in the product.dart

    // if (response.statusCode == 200) {
    //   var jsonString = response.body;
    //   return welcomeFromJson(jsonString);
    // } else {
    //   // ignore: avoid_print
    //   print("An Error Occured");

    // }
  }
}
