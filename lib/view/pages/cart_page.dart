import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/cart_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../export.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cart Page')),
        body: SafeArea(
          child: GetX<CartController>(builder: (_) {
            return _.cartItems.isEmpty
                ? 'ar_no_data'.tr.text.makeCentered()
                : Column(
                    children: [
                      ListView.separated(
                          separatorBuilder: (context, index) => const Divider(height: 1),
                          itemCount: controller.cartItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = controller.cartItems[index];
                            final item = controller.cartItems[index].product;
                            return index == controller.cartItems.length
                                ? const Divider(height: 80)
                                : Dismissible(
                                    background: Container(color: Colors.red),
                                    onDismissed: (direction) => controller.removeFromCart(cartItem),
                                    key: Key(item.name),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        ListTile(
                                          title: item.name.text.make(),
                                          leading: Image.network(item.imageUrl).continuousRectangle(width: 70).p4(),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              6.heightBox,
                                              item.description.text.make(),
                                              6.heightBox,
                                              item.last_viewed.toDate().toLocal().toString().text.make(),
                                              Row(children: [
                                                item.rate.text.make(),
                                                const Icon(Icons.star, color: kPrimaryColor).p4()
                                              ]),
                                            ],
                                          ),
                                          trailing: item.hasDiscount
                                              ? Column(
                                                  children: [
                                                    item.price.text.lineThrough.make().p4(),
                                                    item.discountedPrice.text.red500.make(),
                                                  ],
                                                )
                                              : item.price.text.make(),
                                        ),
                                        15.heightBox,
                                      ],
                                    ));
                          }).expand(),
                      'Total price is ${controller.getTotalPrice().toPrecision(3)}'
                          .text
                          .bold
                          .xl3
                          .green500
                          .make()
                          .p8(),
                      MaterialButton(
                              height: 100,
                              color: Colors.green,
                              onPressed: () => controller.checkout(),
                              splashColor: Colors.blueGrey,
                              child: 'Checkout'.text.bold.white.xl2.make().p8())
                          .wFull(context),
                    ],
                  );
          }),
        ));
  }
}
