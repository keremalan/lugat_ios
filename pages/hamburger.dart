import 'package:flutter/material.dart';

class Hamburger extends StatefulWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  _HamburgerState createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Lügat", style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: const [
          Text("2"),
        ],
      ),
    );
  }
}
