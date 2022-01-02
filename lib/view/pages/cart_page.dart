import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/cart_controller.dart';

import '../../constants.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CartPage')),
        body: SafeArea(child: Center(child: Text('${controller.cartItems.length}'))));
  }
}
