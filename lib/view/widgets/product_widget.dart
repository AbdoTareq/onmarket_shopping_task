import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
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
          onTap: () {
            Get.bottomSheet(Column(
              children: [
                CircleAvatar(
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
              ],
            ));
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VxStepper(
              min: 0,
              defaultValue: 0,
              step: 1,
              onChange: (value) {
                logger.i("${value}");
              },
            ),
            MaterialButton(
                color: kPrimaryColor,
                onPressed: () {},
                splashColor: Colors.blueGrey,
                child: const Icon(Icons.add_shopping_cart)),
          ],
        ).p8(),
        15.heightBox,
      ],
    );
  }
}
