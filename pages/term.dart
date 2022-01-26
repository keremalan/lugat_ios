// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/main.dart';
import 'package:lugat_ios/widgets/termCard.dart';

class Term extends StatefulWidget {
  const Term({this.data});

  final QueryDocumentSnapshot<Object?>? data;

  @override
  _TermState createState() => _TermState();
}

class _TermState extends State<Term> {
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
  String authorPhotoUrl = '';
  final _formKey = GlobalKey<FormState>();
  bool isEditable = false;

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
            TermCard(
                termImage: widget.data!.get('termImage'),
                termName: widget.data!.get('termTitle'),
                termAuthor: widget.data!.get('termAuthor')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isEditable == true,
                      child: const SizedBox(height: 16),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Terim adı",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            termTitle = value;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: const Text(
                        "Görseli",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            termImage = value;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == false,
                      child: const SizedBox(height: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Akla gelen ilk anlamı",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                        Visibility(
                          visible: isEditable == false,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isEditable = !isEditable;
                              });
                            },
                            child: const Text("Katkı sağla"),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isEditable == false,
                      child: Text(
                        widget.data!.get('termMean'),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            termMean = value;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Örnek",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == false,
                      child: Text(
                        widget.data!.get('termExample'),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            termExample = value;
                            termCategory = widget.data!.get('termCategory');
                            termContributor = FirebaseAuth.instance.currentUser!.displayName!;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Ek açıklamalar",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == false,
                      child: Text(
                        widget.data!.get('termDescription'),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            termDescription = value;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final formState = _formKey.currentState;
                              if (formState == null) return;
                              if (formState.validate() == true) {
                                formState.save();
                                FirebaseFirestore.instance
                                    .collection('contributes')
                                    .add({
                                  'termTitle': termTitle,
                                  'termImage': termImage,
                                  'termCategory': termCategory,
                                  'termMean': termMean,
                                  'termExample': termExample,
                                  'termDescription': termDescription,
                                  'termAuthor':
                                      FirebaseAuth.instance.currentUser!.displayName!,
                                  'isSaved': false,
                                  'uid': FirebaseAuth.instance.currentUser!.displayName,
                                  'termContributor': FirebaseAuth.instance.currentUser!.displayName!,
                                  'authorPhotoUrl': widget.data!.get('termAuthor'),
                                });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ContributeSuccess()));
                              }
                            },
                            child: const Text("Tamamla"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isEditable = !isEditable;
                              });
                            },
                            child: const Text("İptal et"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Katkı sağlayanlar",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Text(
                      widget.data!.get('termContributor'),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 17),
                    ),
                    const SizedBox(
                      height: 64,
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

class ContributeSuccess extends StatelessWidget {
  const ContributeSuccess({Key? key}) : super(key: key);

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
            Image.network(
              "https://www.upload.ee/image/13825020/Mask_Group.png",
              height: 48,
            ),
            const SizedBox(height: 16),
            const Text(
              "Tebrikler!",
              style: TextStyle(color: Colors.green, fontSize: 22),
            ),
            const SizedBox(
              height: 4,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Düzenlemeleriniz kaydedilerek moderatör onayına gönderilmiştir. Katkınız için Lugat topluluğu adına teşekkür ederiz.",
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
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
