import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/shopping_controller.dart';
import 'package:onmarket_shopping_task/view/pages/cart_page.dart';
import 'package:onmarket_shopping_task/view/widgets/product_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class MostSellingPage extends GetView<ShoppingController> {
  const MostSellingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Top Rated'.text.make()),
      body: SafeArea(
        child: GetX<ShoppingController>(builder: (_) {
          return _.productsBySelling.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemCount: controller.productsBySelling.length,
                  itemBuilder: (context, index) {
                    final item = controller.productsBySelling[index];
                    return ProductWidget(item: item, index: index);
                  });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const CartPage()),
        child: const Icon(Icons.add_shopping_cart, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
