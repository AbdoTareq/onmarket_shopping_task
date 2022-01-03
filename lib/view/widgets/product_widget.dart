import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/cart_controller.dart';
import 'package:onmarket_shopping_task/export.dart';
import 'package:onmarket_shopping_task/models/product.dart';
import 'package:onmarket_shopping_task/view/widgets/quantity_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';

class ProductWidget extends GetView<CartController> {
  ProductWidget({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final Product item;
  final int index;

  @override
  Widget build(BuildContext context) {
    var stepper = Obx(
      () => QuantityWidget(
        quantity: controller.quantities[index].quantity.value,
        plus: () => controller.increaseItemInCart(item, index),
        minus: () => controller.decreaseItemInCart(item, index),
      ).p8(),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          title: item.name.text.make(),
          leading: CircleAvatar(
            onForegroundImageError: (exception, stackTrace) => logger.i("image loading error $exception"),
            foregroundImage: NetworkImage(item.imageUrl),
            radius: 44,
          ),
          subtitle: item.description.text.make(),
          trailing: item.hasDiscount
              ? Column(
                  children: [
                    item.price.text.lineThrough.make().p4(),
                    item.discountedPrice.text.red500.make(),
                  ],
                )
              : item.price.text.make(),
          onTap: () {
            Get.bottomSheet(Column(
              children: [
                CircleAvatar(
                  onForegroundImageError: (exception, stackTrace) =>
                      logger.i("image loading error $exception"),
                  foregroundImage: NetworkImage(item.imageUrl),
                  radius: 44,
                ).p4(),
                item.name.text.make().p4(),
                '${item.description} ${item.description} ${item.description} '.text.center.make().p4(),
                item.hasDiscount
                    ? Column(
                        children: [
                          item.price.text.lineThrough.make().p4(),
                          item.discountedPrice.text.red500.bold.make().p4(),
                        ],
                      )
                    : item.price.text.make().p4(),
                stepper,
              ],
            ));
          },
        ),
        stepper,
        15.heightBox,
      ],
    );
  }
}
