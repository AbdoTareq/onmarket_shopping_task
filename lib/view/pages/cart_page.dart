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
                                      children: [
                                        CircleAvatar(foregroundImage: NetworkImage(item.imageUrl), radius: 44)
                                            .p4(),
                                        item.name.text.make().p4(),
                                        '${item.description} ${item.description} ${item.description} '
                                            .text
                                            .center
                                            .make()
                                            .p4(),
                                        item.hasDiscount
                                            ? Column(
                                                children: [
                                                  '1 piece price is  ${item.price}'
                                                      .text
                                                      .bold
                                                      .lineThrough
                                                      .xl
                                                      .make()
                                                      .p8(),
                                                  'new price is ${item.discountedPrice}'
                                                      .text
                                                      .red500
                                                      .bold
                                                      .xl
                                                      .make()
                                                      .p8(),
                                                  'quantity  is ${cartItem.quantity}'
                                                      .text
                                                      .bold
                                                      .xl
                                                      .make()
                                                      .p8(),
                                                  'total is ${cartItem.price}'.text.bold.xl.make().p8(),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  '1 piece price is  ${item.price}'.text.bold.xl.make().p8(),
                                                  'quantity  is ${cartItem.quantity}'
                                                      .text
                                                      .bold
                                                      .xl
                                                      .make()
                                                      .p8(),
                                                  'total is ${cartItem.price}'.text.bold.xl.make().p8(),
                                                ],
                                              ),
                                      ],
                                    ),
                                  );
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
