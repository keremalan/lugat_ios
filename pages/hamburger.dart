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
              HamburgerItem(itemTitle: 'Geri bildirim', itemDescription: "Deneyimini aktar, Lügat'ı geliştirmemize katkı sağla!"),
              HamburgerItem(itemTitle: 'İhlal bildirimi', itemDescription: 'Rahatsız olduğun ifadeleri, görselleri bildir'),
              HamburgerItem(itemTitle: 'Yardım', itemDescription: 'İletişim bilgileri ve Sıkça Sorulan Sorular'),
              HamburgerItem(itemTitle: 'Yol haritası', itemDescription: "Lügat'ın geleceğine dair rota."),
            ],
          ),
        ),
      ),
    );
  }
}

class HamburgerItem extends StatelessWidget {
  HamburgerItem({
    required this.itemTitle,
    required this.itemDescription,
    Key? key,
  }) : super(key: key);
  String itemTitle;
  String itemDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemTitle, style: TextStyle(fontSize: 17),),
              Text(itemDescription, style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.4)),),
            ],
          ),
        ),
      ],
    );
  }
}
