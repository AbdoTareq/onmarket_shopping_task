import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../export.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.title,
    required this.imageName,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String imageName;
  final bool selected;
  final Function() onTap ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: selected ? Get.theme.primaryColor : Colors.transparent,
        child: Column(
          children: [
            Image.asset(
              '$baseImagePath/$imageName.png',
              height: Get.height * .06,
              width: Get.width * .27,
            ),
            5.heightBox,
            title.tr.text.make(),
          ],
        ).pSymmetric(h: 4, v: 8).card.elevation(5).make(),
      ),
    );
  }
}
