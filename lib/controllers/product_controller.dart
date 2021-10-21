import 'dart:ffi';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/services/remote_services.dart';

class ProductController extends GetxController {
  // var productList = <Welcome>[].obs;
  var isLoading = true.obs;
  var productList = <Welcome>[];
  //Welcome will be fetched from the product.dart usign Welcome class
  //late Welcome welcome;s
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

//mow we'll call api from the controller
  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      // productList.value = products;
      // productList.addAll(products);
      if (products != null) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
