import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/home.dart';

void main() {
  runApp(const Lugat());
}

class Lugat extends StatelessWidget {
  const Lugat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Index(),
    );
  }
}

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Scaffold(
        body: Home(),
      ),
    );
  }
}
