// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/profile.dart';
import 'package:lugat_ios/pages/term.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';

class DroneCategory extends StatefulWidget {
  const DroneCategory({Key? key}) : super(key: key);

  @override
  _DroneCategoryState createState() => _DroneCategoryState();
}

class _DroneCategoryState extends State<DroneCategory> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms').where('termCategory', isEqualTo: 'Drone').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Drone"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryCard(categoryImage: 'https://www.upload.ee/image/13824935/drone.png', categoryName: 'Drone', categoryDailyTerm: 'Otomatik dönüş', categoryTermCount: '1337',),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
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
    );
  }
}
