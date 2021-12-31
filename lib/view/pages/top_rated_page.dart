import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/top_rated_controller.dart';
import 'package:onmarket_shopping_task/repos/product_repo.dart';

class TopRatedPage extends GetView<TopRatedController> {
  const TopRatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TopRatedPage')), body: SafeArea(child: Column(
          children: [
            Text('TopRatedController'),
            
            MaterialButton(
              color: Colors.blue,
              onPressed: ()async=> await controller.getProducts(),
              splashColor: Colors.blueGrey,
              child: Text('OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        )));
  }
}
