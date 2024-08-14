import 'package:api/api%20integration%20using%20http/screen/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/productcontroller.dart';


void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SizedBox(
        child: Obx(() {   // Obx is to make the widget observable
          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                itemCount: productController.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 280,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductTile(
                      productController.productList[index]);
                });
          }
        }),
      ),
    );
  }
}