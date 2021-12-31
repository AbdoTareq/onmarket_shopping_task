import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../export.dart';

class RowTextIcon extends StatelessWidget {
  const RowTextIcon({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          '$baseImagePath$imagePath.png',
          height: 20,
        ),
        6.widthBox,
        text.text.make()
      ],
    );
  }
}
