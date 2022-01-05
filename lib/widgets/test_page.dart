import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  static const routeName = "/testPage";

  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testseite'),
      ),
    );
  }
}
