import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key, required this.quantity, required this.plus, required this.minus})
      : super(key: key);
  final int quantity;
  final Function() plus;
  final Function() minus;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    const double _KDefaultButtonSize = 30;
    const double _KDefaultSpace = 8;
    const double _KDefaultTextFontSize = 14;

    children.add(Container(
      height: _KDefaultButtonSize,
      width: _KDefaultButtonSize,
      child: MaterialButton(
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        onPressed: minus,
        child: Icon(
          Icons.remove,
        ),
      ),
    ));

    children.add(const SizedBox(width: _KDefaultSpace));

    children.add(Container(
      height: _KDefaultButtonSize,
      width: 36,
      decoration: BoxDecoration(
        color: DividerTheme.of(context).color ?? Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: '${quantity}'.text.bold.xl.make().p8(),
    ));

    children.add(const SizedBox(width: _KDefaultSpace));
    children.add(Container(
      height: _KDefaultButtonSize,
      width: _KDefaultButtonSize,
      child: MaterialButton(
        shape: const CircleBorder(),
        onPressed: plus,
        padding: EdgeInsets.zero,
        child: const Icon(
          Icons.add,
        ),
      ),
    ));

    return Row(
      children: children,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
