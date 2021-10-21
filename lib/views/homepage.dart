import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:shopping/controllers/product_controller.dart';
import 'package:shopping/views/product_tile.dart';

class homepage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Shop",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.view_list_rounded))
              ],
            ),
          ),
          // Expanded(child: Obx(() {
          //   return StaggeredGridView.countBuilder(
          //       crossAxisCount: 2,
          //       itemCount: productController.productList.length,
          //       mainAxisSpacing: 16,
          //       crossAxisSpacing: 16,
          //       itemBuilder: (context, index) {
          //         print("data${productController.productList.length}");
          //         return ProductTile(productController.productList[index]);
          //       },
          //       staggeredTileBuilder: (index) => StaggeredTile.fit(1));
          // })),
          Expanded(
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  print("data${productController.productList.length}");
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
          ),
        ],
      ),
    );
  }
}
