// ignore_for_file: file_names, unused_local_variable, prefer_final_fields
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/main.dart';
import 'package:lugat_ios/pages/term.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';
import 'package:lugat_ios/widgets/termCard.dart';

class UXCategory extends StatefulWidget {
  const UXCategory({Key? key}) : super(key: key);

  @override
  _UXCategoryState createState() => _UXCategoryState();
}

class _UXCategoryState extends State<UXCategory> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where('termCategory', isEqualTo: 'UX')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTerm(),
              ));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("UX"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryCard(
                categoryImage: 'https://www.upload.ee/image/13844734/ux.png',
                categoryName: 'UX',
                categoryDailyTerm: 'Persona',
                categoryTermCount: '1337',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Terimler",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _termsStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Bir ??eyler ters gitmi?? olmal??.');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('??u anda i??erik y??kleniyor.');
                        }

                        return MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: snapshot.data!.docs
                                .map((QueryDocumentSnapshot<Object?> data) {
                              final String termTitle = data.get('termTitle');
                              final String termImage = data['termImage'];
                              final String termMean = data['termMean'];
                              final String termExample = data['termExample'];
                              final String termDescription =
                                  data['termDescription'];
                              final String termAuthor = data['termAuthor'];
                              final String termCategory = data['termCategory'];
                              final bool isSaved = data['isSaved'];
                              final String termContributor =
                                  data['termContributor'];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Term(
                                                data: data,
                                              )));
                                },
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: ClipOval(
                                    child: Image.network(
                                      data['termImage'],
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    data['termTitle'],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    data['termExample'],
                                    style: const TextStyle(
                                      fontSize: 13,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 48),
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
  String termCategory = '';
  String uid = '';
  String termImage = '';
  String termContributor = '';
  String authorPhotoUrl = '';
  String sendDate = '';
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text("Terim olu??tur"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TermCard(
                termImage: 'https://www.upload.ee/image/13824964/fe__2_.png',
                termName: '',
                termAuthor: 'Lugat taraf??ndan'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text("Terim ad??", style: TextStyle(fontSize: 17)),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Terim ad?? bo?? b??rak??lamaz';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          termTitle = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ad??n?? d??zenlemek i??in dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text("G??rseli", style: TextStyle(fontSize: 17)),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Terim g??rseli bo?? b??rak??lamaz';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          termImage = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'G??rsel ba??lant??s??n?? eklemek i??in dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    const Text("Akla gelen ilk anlam??",
                        style: TextStyle(fontSize: 17)),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Akla gelen ilk anlam?? bo?? b??rak??lamaz';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          termMean = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            'Akla gelen ilk anlam??n?? d??zenlemek i??in dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    const Text("??rnek", style: TextStyle(fontSize: 17)),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '??rnek bo?? b??rak??lamaz';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          termExample = value;
                          uid = FirebaseAuth.instance.currentUser!.uid;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '??rne??i d??zenlemek i??in dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    const Text("Ek a????klamalar",
                        style: TextStyle(fontSize: 17)),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ek a????klamalar bo?? b??rak??lamaz';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          termDescription = value;
                          termCategory = 'UX';
                          authorPhotoUrl =
                              FirebaseAuth.instance.currentUser!.photoURL!;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ek a????klamalar?? d??zenlemek i??in dokun',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                FirebaseFirestore.instance
                                    .collection('addedTerms')
                                    .add({
                                  'termTitle': termTitle,
                                  'termImage': termImage,
                                  'termCategory': termCategory,
                                  'termMean': termMean,
                                  'termExample': termExample,
                                  'termDescription': termDescription,
                                  'termAuthor': auth.currentUser!.displayName,
                                  'isSaved': false,
                                  'uid': uid,
                                  'termContributor':
                                      auth.currentUser!.displayName,
                                  'authorPhotoUrl': authorPhotoUrl,
                                  'sendDate': DateTime.now(),
                                });

                                Navigator.pushReplacement(
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
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("??ptal et"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 48),
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
                "Teriminiz incelenmek ??zere moderat??rlere g??nderilmi??tir. Katk??n??z i??in Lugat toplulu??u ad??na te??ekk??r ederiz.",
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Index()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Text(
                    "Anasayfaya d??n",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
