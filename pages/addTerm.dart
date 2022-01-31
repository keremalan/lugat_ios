// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/widgets/termCard.dart';

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
  String termCategory = '';
  String uid = '';
  String termImage = '';
  String termContributor = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text("Terim oluştur"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TermCard(termImage: 'https://www.upload.ee/image/13824964/fe__2_.png', termName: '', termAuthor: 'Lugat tarafından eklendi'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
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
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Adını düzenlemek için dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    const Text("Akla gelen ilk anlamı", style: TextStyle(fontSize: 17)),
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
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Akla gelen ilk anlamını düzenlemek için dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    const Text("Örnek", style: TextStyle(fontSize: 17)),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Örnek boş bırakılamaz';
                        } return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          termExample = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Örneği düzenlemek için dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    const Text("Ek açıklamalar", style: TextStyle(fontSize: 17)),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ek açıklamalar boş bırakılamaz';
                        } return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          termTitle = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ek açıklamaları düzenlemek için dokun',
                      ),
                      keyboardType: TextInputType.multiline,
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
                                'termTitle': termTitle, 'termImage': termImage, 'termCategory': termCategory, 'termMean': termMean, 'termExample': termExample, 'termDescription': termDescription, 'termAuthor': FirebaseAuth.instance.currentUser!.displayName!, 'isSaved': false, 'uid': uid, 'termContributor': termContributor,
                              });


                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const AddTermSuccess()),
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text("Tamamla"),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("İptal et"),
                        ),
                      ],
                    ),
                  ],
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
            const SizedBox(height: 16),
            const Text("Tebrikler!", style: TextStyle(color: Colors.green, fontSize: 22),),
            const SizedBox(height: 4,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Teriminiz moderatör onayına gönderilmiştir. Katkınız için Lugat topluluğu adına teşekkür ederiz.", style: TextStyle(color: Colors.green), textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}

