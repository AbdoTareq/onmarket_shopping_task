import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/cart_controller.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('CartPage')), body: SafeArea(child: Text('CartController')));
  }
}
