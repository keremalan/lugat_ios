// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/main.dart';
import 'package:lugat_ios/pages/profile.dart';
import 'package:lugat_ios/utilities/google_sign_in.dart';

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
        title: const Text(
          "Lügat",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Feedback()));
                  },
                  child: HamburgerItem(
                      itemTitle: 'Geri bildirim',
                      itemDescription:
                          "Deneyimini aktar, Lügat'ı geliştirmemize katkı sağla!")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Report()));
                  },
                  child: HamburgerItem(
                      itemTitle: 'İhlal bildirimi',
                      itemDescription:
                          'Rahatsız olduğun ifadeleri, görselleri bildir')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Help()));
                  },
                  child: HamburgerItem(
                      itemTitle: 'Yardım',
                      itemDescription:
                          'İletişim bilgileri ve Sıkça Sorulan Sorular')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RoadMap()));
                  },
                  child: HamburgerItem(
                      itemTitle: 'Yol haritası',
                      itemDescription: "Lügat'ın geleceğine dair rota.")),
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
              Text(
                itemTitle,
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                itemDescription,
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  String feedbackTitle = '';
  String feedbackMessage = '';
  String feedbackSender = '';
  String sendDate = '';
  String senderMail = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // title: Text("Geribildirim"),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  "Geri bildirim",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(
                  "Bu formu doldurarak düşüncelerinizi ve deneyimlerinizi Geight Geliştirici Takımı'na inetebilirsiniz.",
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(
                  height: 48,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Geribildirim başlığı",
                          style: TextStyle(fontSize: 17)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Başlık boş bırakılamaz';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            feedbackTitle = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Başlığı düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Text("Geribildirim mesajı", style: TextStyle(fontSize: 17)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mesaj boş bırakılamaz';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            feedbackMessage = value;
                            feedbackSender =
                                FirebaseAuth.instance.currentUser!.displayName!;
                            senderMail =
                                FirebaseAuth.instance.currentUser!.email!;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mesajı düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          final formState = _formKey.currentState;
                          if (formState == null) return;
                          if (formState.validate() == true) {
                            formState.save();
                            FirebaseFirestore.instance
                                .collection('feedbacks')
                                .add({
                              'feedbackTitle': feedbackTitle,
                              'feebackMessage': feedbackMessage,
                              'feedbackSender': feedbackSender,
                              'senderMail': senderMail,
                              'sendDate': DateTime.now(),
                            });

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Success()),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Text("Gönder"),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 48),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String reportType = '';
  String reportMessage = '';
  String reportImage = '';
  String sendDate = '';
  String reportSender = '';
  String senderEmail = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // title: Text("Geribildirim"),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  "İhlal bildirimi",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(
                  "Rahatsız olduğunuz içerikleri acil müdahale ekibimize bu form sayesinde ulaştırabilirsiniz. Talebiniz hızlıca çözümlenecek ve e-posta adresinize bildirim gönderilecektir.",
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(
                  height: 48,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Bildirim türü", style: TextStyle(fontSize: 17)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Başlık boş bırakılamaz';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            reportType = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Hakaret, çıplaklık vb.',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Text("İhlal açıklaması", style: TextStyle(fontSize: 17)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Açıklama boş bırakılamaz';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            reportMessage = value;
                            reportSender =
                                FirebaseAuth.instance.currentUser!.displayName!;
                            senderEmail =
                                FirebaseAuth.instance.currentUser!.email!;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mesajı düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Text("İhlal kanıtı", style: TextStyle(fontSize: 17)),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            reportImage = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'Kanıtı düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          final formState = _formKey.currentState;
                          if (formState == null) return;
                          if (formState.validate() == true) {
                            formState.save();
                            FirebaseFirestore.instance.collection('reports').add({
                              'reportType': reportType,
                              'reportMessage': reportMessage,
                              'reportImage': reportImage,
                              'reportSender': reportSender,
                              'senderEmail': senderEmail,
                              'sendDate': DateTime.now(),
                            });

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Success()),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Text("Gönder"),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 48),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text("Teşekkürler!", style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.w600),),
            SizedBox(height: 6),
            Text("Bildiriminiz ekibimize ulaşmıştır. En kısa sürede sizinle iletişime geçeceğiz.", textAlign: TextAlign.center, style: TextStyle(color: Colors.green)),
            const SizedBox(height: 24),
            TextButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Index()));}, style: ElevatedButton.styleFrom(primary: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical:6),
              child: Text("Anasayfa'ya dön", style: TextStyle(color: Colors.white),),
            )),
          ],
        ),
      ),
    );
  }
}


class RoadMap extends StatelessWidget {
  const RoadMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                "Yol haritası",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                "Lügat’ın ortaya çıkışı esnasında belirlediğimiz yol haritası, bize amacımızı hatırlatıyor ve çözüme ulaşma yolunda ne kadar ilerlediğimizi somutlaştırmamızı sağlıyor.",
                style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
              ),
              const SizedBox(height: 12),
              Text(
                "Yol haritamızı sizlerle paylaşmak istiyoruz. Çünkü sizler, Lügat’ın Kolektif Topluluğu, bu yol haritasının ayrılmaz birer parçasısınız. Yol haritamızı inceleyerek bu sürece katkı sağlamanızı ve yolumuzu şekillendirmede söz hakkı sahibi olmanızı istiyoruz.",
                style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sıradaki adım", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 13),),
                  const Text("Geri bildirimlerin toplanması", style: TextStyle(color: Colors.black, fontSize: 17),),
                  const SizedBox(height: 18),
                  Text("Şubat, 2022", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 13),),
                  const Text("Web sürümünün yayına alınması", style: TextStyle(color: Colors.black, fontSize: 17),),
                  const SizedBox(height: 18),
                  Text("Şubat, 2022", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 13),),
                  const Text("Kolektif araçların dahil edilmesi", style: TextStyle(color: Colors.black, fontSize: 17),),
                  const SizedBox(height: 18),
                  Text("Mart, 2022", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 13),),
                  const Text("Sosyal araçların dahil edilmesi", style: TextStyle(color: Colors.black, fontSize: 17),),
                  const SizedBox(height: 18),
                  Text("Mart, 2022", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 13),),
                  const Text("watchOS yayınına hazırlık", style: TextStyle(color: Colors.black, fontSize: 17),),
                  const SizedBox(height: 18),
                  Text("Mart, 2022", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 13),),
                  const Text("App Gallery yayınına hazırlık", style: TextStyle(color: Colors.black, fontSize: 17),),
                  const SizedBox(height: 18),
                  Text("Nisan, 2022", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 13),),
                  const Text("MacOS ve Windows sürümlerinin yayınına hazırlık", style: TextStyle(color: Colors.black, fontSize: 17),),
                  const SizedBox(height: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
