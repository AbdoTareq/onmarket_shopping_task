import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/top_rated_controller.dart';
import 'package:onmarket_shopping_task/view/pages/cart_page.dart';
import 'package:onmarket_shopping_task/view/widgets/product_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class TopRatedPage extends GetView<TopRatedController> {
  const TopRatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Top Rated'.text.make()),
      body: SafeArea(
        child: GetX<TopRatedController>(builder: (_) {
          return _.products.isEmpty
              ? 'no_data'.tr.text.makeCentered()
              : ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final item = controller.products[index];
                    return ProductWidget(item: item);
                  });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => CartPage()),
        child: const Icon(Icons.add_shopping_cart, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
