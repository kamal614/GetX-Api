import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/services/remote_services.dart';

class ProductController extends GetxController {
  // var productList = <Welcome>[].obs;
  var productList = <Welcome>[];
  //late Welcome welcome;s
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    // productList.value = products;
    productList.addAll(products);
  }
}
