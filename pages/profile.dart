// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/main.dart';
import 'package:lugat_ios/pages/hamburger.dart';
import 'package:lugat_ios/pages/term.dart';
import 'package:lugat_ios/utilities/google_sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text("Profil", style: TextStyle(color: Colors.black.withOpacity(1)),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettings()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileHead(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    //Text("Katkılarım", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                    //ContributeCategoryOverview(),
                    Divider(
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: _termsStream,
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                            if (snapshot.hasError) {
                              return const Text('Bir şeyler ters gitmiş olmalı.');
                            }

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Text('Şu anda içerik yükleniyor.');
                            }

                            return MediaQuery.removePadding(
                              removeTop: true,
                              context: context,
                              child: ListView(
                                primary: false,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map((QueryDocumentSnapshot<Object?> data) {
                                  final String termTitle = data.get('termTitle');
                                  final String termImage = data['termImage'];
                                  final String termMean = data['termMean'];
                                  final String termExample = data['termExample'];
                                  final String termDescription = data['termDescription'];
                                  final String termAuthor = data['termAuthor'];
                                  final String termCategory = data['termCategory'];
                                  final bool isSaved = data['isSaved'];
                                  final String authorPhotoUrl = data['authorPhotoUrl'];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Term(data: data,)));
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(data['authorPhotoUrl'], width: 40, height: 40)),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(data['termAuthor']),
                                                      Text("", style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.4))),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 2,),
                                                  Row(
                                                    children: [
                                                      Flexible(fit: FlexFit.loose, child: Text(data['termMean'], style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6)))),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 52),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 4),
                                              Container(
                                                width: 396,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(data['termImage']),
                                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.18), BlendMode.darken),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12, bottom: 12),
                                                      child: Column(
                                                        children: [
                                                          Text(data['termTitle'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Divider(
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermPost extends StatelessWidget {
  TermPost({
  required this.termAuthor,
    Key? key,
  }) : super(key: key);
  String termAuthor = '';
  String termImage = '';
  String termTitle = '';
  String termExample = '';
  String termMean = '';
  String termDescription = '';
  String termContributor = '';
  String termCategory = '';
  String uid = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network("https://media-exp1.licdn.com/dms/image/C4D03AQEQpZW5_sX-LA/profile-displayphoto-shrink_800_800/0/1641093536875?e=1648684800&v=beta&t=d_KlOnEmgd61XiRxJXMsDtkMJb-XxXAsy32SGzoXGKQ", width: 40, height: 40)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Kerem Alan"),
                      Text("@keremalan", style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.4))),
                    ],
                  ),
                  const SizedBox(height: 2,),
                  Row(
                    children: [
                      Flexible(fit: FlexFit.loose, child: Text("Yazılım dilleri kullanılarak geliştirilen kodların kolayca yazılıp düzenlenebildiği araç.", style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6)))),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 52),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(
                width: 396,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: const NetworkImage("https://www.upload.ee/image/13813417/code.png"),
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.18), BlendMode.darken),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 12),
                      child: Column(
                        children: const [
                          Text("IDE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Divider(
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    );
  }
}

class ContributeCategoryOverview extends StatelessWidget {
  const ContributeCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ContributeCategoryOverviewItem(),
          SizedBox(
            width: 10,
          ),
          ContributeCategoryOverviewItem(),
          SizedBox(
            width: 10,
          ),
          ContributeCategoryOverviewItem(),
          SizedBox(
            width: 10,
          ),
          ContributeCategoryOverviewItem(),
        ],
      ),
    );
  }
}

class ContributeCategoryOverviewItem extends StatelessWidget {
  const ContributeCategoryOverviewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.grey.withOpacity(0.17),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width:6,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              const Text("Metaverse", style: TextStyle(fontSize: 17),),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHead extends StatelessWidget {
  const ProfileHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kerem Alan", style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
            Row(
              children: const [
                Text("Geight"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text("-"),
                ),
                Text("Arayüz Tasarımcısı"),
              ],
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network("https://media-exp1.licdn.com/dms/image/C4D03AQEQpZW5_sX-LA/profile-displayphoto-shrink_400_400/0/1641093536875?e=1648684800&v=beta&t=rl6iVAeuKF39QlLSOOEBHr609ch7fvMUKCyIKN0NlPw",
          height: 42,
          width: 42,
          ),
        ),
      ],
    );
  }
}

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Profil ayarları'),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalSettings()));},child: HamburgerItem(itemTitle: 'Kişisel Bilgiler', itemDescription: "İsminiz ve diğer bilgileriniz")),
              GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => const SecuritySettings()));},child: HamburgerItem(itemTitle: 'Güvenlik', itemDescription: 'Şifre, telefon, e-post adresiniz')),
              GestureDetector(onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context) => const Help()));},child: HamburgerItem(itemTitle: 'Yardım', itemDescription: 'İletişim kanallarını buradan görüntüleyebilirsiniz')),
              const SizedBox(
                height: 4,
              ),
              Divider(),
              GestureDetector(
                onTap: () async {
                  await signOutWithGoogle();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SplashScreen()));
                },
                  child: HamburgerItem(itemTitle: 'Çıkış Yap', itemDescription: '')),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalSettings extends StatefulWidget {
  const PersonalSettings({Key? key}) : super(key: key);

  @override
  _PersonalSettingsState createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Kişisel Bilgiler"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              //HamburgerItem(itemTitle: 'İsim', itemDescription: FirebaseAuth.instance.currentUser!.displayName!),
            ],
          ),
        ),
      ),
    );
  }
}

class SecuritySettings extends StatefulWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  _SecuritySettingsState createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Güvenlik Bilgileri"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              HamburgerItem(itemTitle: 'Şifre', itemDescription: '*******'),
              //HamburgerItem(itemTitle: 'E-Posta', itemDescription: FirebaseAuth.instance.currentUser!.email!),
            ],
          ),
        ),
      ),
    );
  }
}

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text("İletişim", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),),
              const SizedBox(height: 4,),
              HamburgerItem(itemTitle: 'E-Posta', itemDescription: 'designer.keremalan@gmail.com'),
              HamburgerItem(itemTitle: 'Adres', itemDescription: 'Ortaköy, Dereboyu Caddesi'),
              HamburgerItem(itemTitle: 'Sıkça Sorulan Sorular', itemDescription: 'Görüntülemek için buraya dokunun.'),
            ],
          ),
        ),
      ),
    );
  }
}