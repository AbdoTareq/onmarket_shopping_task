import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/shopping_controller.dart';
import 'package:onmarket_shopping_task/view/pages/cart_page.dart';
import 'package:onmarket_shopping_task/view/widgets/product_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class TopRatedPage extends GetView<ShoppingController> {
  const TopRatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Top Rated'.text.make()),
      body: SafeArea(
        child: GetX<ShoppingController>(builder: (_) {
          return _.productsByRate.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemCount: controller.productsByRate.length,
                  itemBuilder: (context, index) {
                    final item = controller.productsByRate[index];
                    print('ITEM : ');
                    print(item);
                    return ProductWidget(item: item);
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
