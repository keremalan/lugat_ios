import 'package:flutter/material.dart';
import 'package:lugat_ios/widgets/termCard.dart';

class Term extends StatefulWidget {
  const Term({Key? key}) : super(key: key);

  @override
  _TermState createState() => _TermState();
}

class _TermState extends State<Term> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TermCard(termImage: 'https://www.upload.ee/image/13813417/code.png', termName: 'IDE', termAuthor: "Kerem Alan"),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 8),
                    child: Text("Akla gelen ilk anlamı", style: TextStyle(color: Colors.black, fontSize: 17),),
                  ),
                  Text("Yazılım dilleri kullanılarak geliştirilen kodların kolayca yazılıp düzenlenebildiği araç.", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Örnek", style: TextStyle(color: Colors.black, fontSize: 17),),
                  ),
                  Text("Visual Studio Code, Android Studio, Notepad++", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Ek açıklamalar", style: TextStyle(color: Colors.black, fontSize: 17),),
                  ),
                  Text("Farklı IDE'ler farklı özellikler sunar ve kişinin tarzına bağlı olarak tercih edilen IDE değişebilir. Dile özel geliştirilen IDE'ler de mevcuttur. Dolayısıyla hangi IDE daha iyidir tarzında bir yaklaşım doğru kabul edilmeyebilir.", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Katkı sağlayanlar", style: TextStyle(color: Colors.black, fontSize: 17),),
                  ),
                  Text("Kerem Alan", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),),
                  const SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
