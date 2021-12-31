import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/top_rated_controller.dart';
import 'package:onmarket_shopping_task/models/product.dart';
import 'package:onmarket_shopping_task/repos/product_repo.dart';
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
        ));
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: item.name.text.make(),
      leading: CircleAvatar(
        foregroundImage: NetworkImage(item.imageUrl),
        radius: 44,
      ),
      subtitle: item.description.text.make(),
      trailing: item.hasDiscount
          ? Column(
              children: [
                item.price.text.lineThrough.make(),
                item.discountedPrice.text.make(),
              ],
            )
          : item.price.text.make(),
    );
  }
}
