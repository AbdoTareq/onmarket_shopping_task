import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostSellingPage extends StatelessWidget{
  static const name = '/MostSellingPage';

  MostSellingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Text('content'),
        ),
      ),
    );
  }
}
class MostSPage extends StatelessWidget{
  static const name = '/MostSellingPage';

  const MostSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Text('content'),
        ),
      ),
    );
  }
}