// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/profile.dart';
import 'package:lugat_ios/pages/term.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';
import 'package:lugat_ios/widgets/termCard.dart';

class DesignCategory extends StatefulWidget {
  const DesignCategory({Key? key}) : super(key: key);

  @override
  _DesignCategoryState createState() => _DesignCategoryState();
}

class _DesignCategoryState extends State<DesignCategory> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms').where('termCategory', isEqualTo: 'Design').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddTerm(),
          ));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Tasarım"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryCard(categoryImage: 'https://www.upload.ee/image/13779591/designCategory.png', categoryName: 'Metaverse', categoryDailyTerm: 'Yalın Metaverse', categoryTermCount: '128',),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Terimler",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _termsStream,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                          if (snapshot.hasError) {
                            return Text('Bir şeyler ters gitmiş olmalı.');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text('Şu anda içerik yükleniyor.');
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
                                final String termContributor = data['termContributor'];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => Term(data: data,)));
                                  },
                                  child: ListTile(
                                    contentPadding:EdgeInsets.all(0),
                                    leading: ClipOval(
                                      child: Image.network(data['termImage'],
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(data['termTitle'],
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    subtitle: Text(data['termExample'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        overflow: TextOverflow.ellipsis,
                                      ),),
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
    );
  }
}


class AddTerm extends StatefulWidget {
  const AddTerm({Key? key}) : super(key: key);

  @override
  _AddTermState createState() => _AddTermState();
}

class _AddTermState extends State<AddTerm> {
  final Map<String, dynamic> entry = {};
  String termTitle = '';
  String termMean = '';
  String termExample = '';
  String termDescription = '';
  String termAuthor = '';
  String _myActivity = '';
  String termCategory = '';
  String _myActivityResult = '';
  String uid = '';
  String termImage = '';
  String termContributor = '';
  String authorPhotoUrl = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Terim oluştur"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TermCard(termImage: 'https://www.upload.ee/image/13824964/fe__2_.png', termName: '', termAuthor: 'Lugat tarafından eklendi'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text("Terim adı", style: TextStyle(fontSize: 17)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Terim adı boş bırakılamaz';
                          } return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            termTitle = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Adını düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text("Görseli", style: TextStyle(fontSize: 17)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Görsel boş boş bırakılamaz';
                          } return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            termImage = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Görsel bağlantısını için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      Text("Akla gelen ilk anlamı", style: TextStyle(fontSize: 17)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Akla gelen ilk anlamı boş bırakılamaz';
                          } return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            termMean = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Akla gelen ilk anlamını düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      Text("Örnek", style: TextStyle(fontSize: 17)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Örnek boş bırakılamaz';
                          } return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            termExample = value;
                            uid = FirebaseAuth.instance.currentUser!.uid;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Örneği düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      Text("Ek açıklamalar", style: TextStyle(fontSize: 17)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ek açıklamalar boş bırakılamaz';
                          } return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            termDescription = value;
                            termCategory = 'Design';
                            authorPhotoUrl = FirebaseAuth.instance.currentUser!.photoURL!;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ek açıklamaları düzenlemek için dokun',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              final formState = _formKey.currentState;
                              if (formState == null) return;
                              if (formState.validate() == true) {
                                formState.save();
                                FirebaseFirestore.instance.collection('terms').add({
                                  'termTitle': termTitle, 'termImage': termImage, 'termCategory': termCategory, 'termMean': termMean, 'termExample': termExample, 'termDescription': termDescription, 'termAuthor': '${FirebaseAuth.instance.currentUser!.displayName!}', 'isSaved': false, 'uid': uid, 'termContributor': termContributor, 'authorPhotoUrl': authorPhotoUrl,
                                });


                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const AddTermSuccess()),
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text("Tamamla"),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("İptal et"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTermSuccess extends StatelessWidget {
  const AddTermSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://www.upload.ee/image/13825020/Mask_Group.png", height: 48,),
            SizedBox(height: 16),
            Text("Tebrikler!", style: TextStyle(color: Colors.green, fontSize: 22),),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Teriminiz ilgili kategoriye eklenmiştir. Katkınız için Lugat topluluğu adına teşekkür ederiz.", style: TextStyle(color: Colors.green), textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}

