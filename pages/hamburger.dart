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
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              HamburgerItem(),
              HamburgerItem(),
              HamburgerItem(),
              HamburgerItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class HamburgerItem extends StatelessWidget {
  const HamburgerItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Geri bildirim", style: TextStyle(fontSize: 17),),
              Text("Yaşadığınız deneyimi zenginleştirebilmemiz için bize ulaşın.", style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.4)),),
            ],
          ),
        ),
      ],
    );
  }
}
