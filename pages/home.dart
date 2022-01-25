import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/categories/aiCategory.dart';
import 'package:lugat_ios/categories/backendCategory.dart';
import 'package:lugat_ios/categories/designCategory.dart';
import 'package:lugat_ios/categories/droneCategory.dart';
import 'package:lugat_ios/categories/frontendCategory.dart';
import 'package:lugat_ios/categories/metaverseCategory.dart';
import 'package:lugat_ios/categories/othersCategory.dart';
import 'package:lugat_ios/categories/roboticsCategory.dart';
import 'package:lugat_ios/categories/softwareCategory.dart';
import 'package:lugat_ios/pages/hamburger.dart';
import 'package:lugat_ios/pages/term.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';
import 'package:lugat_ios/widgets/categoryOverviewCardItem.dart';
import 'package:lugat_ios/widgets/categoryTermItem.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Lügat",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Hamburger()));
            },
            child: Row(
              children: const [
                Icon(Icons.menu, color: Colors.black),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OthersCategory()));
                      },
                      child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13821620/others__2_.png',
                          popCategoryTitle: 'Diğerleri'),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MetaverseCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13813390/metaverse.png',
                          popCategoryTitle: 'Metaverse',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AiCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13813368/ai.png',
                          popCategoryTitle: 'Yapay Zeka',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RoboticsCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13824932/robotics.png',
                          popCategoryTitle: 'Robotik',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DroneCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13824935/drone.png',
                          popCategoryTitle: 'Drone',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FrontEndCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13824944/fe__1_.png',
                          popCategoryTitle: 'Front-end',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BackEndCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13824941/be.png',
                          popCategoryTitle: 'Back-end',
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MetaverseCategory()));
                  },
                  child: CategoryCard(
                    categoryImage:
                        'https://www.upload.ee/image/13813390/metaverse.png',
                    categoryName: 'Metaverse',
                    categoryDailyTerm: 'Yalın Metaverse',
                    categoryTermCount: '128',
                  )),
              const SizedBox(height: 16),
              DesignCategoryOverview(),
              SoftwareCategoryOverview(),
            ],
          ),
        ),
      ),
    );
  }
}

class SoftwareCategoryOverview extends StatefulWidget {
  const SoftwareCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<SoftwareCategoryOverview> createState() => _SoftwareCategoryOverviewState();
}
class _SoftwareCategoryOverviewState extends State<SoftwareCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'Software')
      .limit(3)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Yazılım",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SoftwareCategory()));
              },
              child: Text(
                "Tümünü gör",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: _termsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                try {
                  if (snapshot.hasError) {
                    return const Text('Bir şeyler ters gitmiş olmalı.');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Şu anda içerik yükleniyor.');
                  }

                  if (snapshot.hasData) {
                    final items = snapshot.data!.docs
                        .map((QueryDocumentSnapshot<Object?> data) {
                      final String termTitle = data.get('termTitle');
                      final String termImage = data['termImage'];
                      final String termMean = data['termMean'];
                      final String termExample = data['termExample'];
                      final String termDescription = data['termDescription'];
                      final String termAuthor = data['termAuthor'];
                      final String termCategory = data['termCategory'];
                      final bool isSaved = data['isSaved'];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Term(
                                    data: data,
                                  )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                data['termImage'],
                                height: 106,
                                width: 106,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                data['termTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              data['termAuthor'],
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList();
                    return Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.4,
                            crossAxisCount: 3,
                          ),
                          itemCount: items.length,
                          padding: const EdgeInsets.only(),
                          itemBuilder: (BuildContext context, int index) {
                            return items[index];
                          }),
                    );
                  } else {
                    return Column(
                      children: [
                        Text("Bir hata meydana geldi!"),
                      ],
                    );
                  }
                } catch (Exc) {
                  print(Exc);
                  rethrow;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DesignCategoryOverview extends StatefulWidget {
  const DesignCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<DesignCategoryOverview> createState() => _DesignCategoryOverviewState();
}

class _DesignCategoryOverviewState extends State<DesignCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'Design')
      .limit(3)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tasarım",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SoftwareCategory()));
              },
              child: Text(
                "Tümünü gör",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: _termsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                try {
                  if (snapshot.hasError) {
                    return const Text('Bir şeyler ters gitmiş olmalı.');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Şu anda içerik yükleniyor.');
                  }

                  if (snapshot.hasData) {
                    final items = snapshot.data!.docs
                        .map((QueryDocumentSnapshot<Object?> data) {
                      final String termTitle = data.get('termTitle');
                      final String termImage = data['termImage'];
                      final String termMean = data['termMean'];
                      final String termExample = data['termExample'];
                      final String termDescription = data['termDescription'];
                      final String termAuthor = data['termAuthor'];
                      final String termCategory = data['termCategory'];
                      final bool isSaved = data['isSaved'];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Term(
                                        data: data,
                                      )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                data['termImage'],
                                height: 106,
                                width: 106,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                data['termTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              data['termAuthor'],
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList();
                    return Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.4,
                            crossAxisCount: 3,
                          ),
                          itemCount: items.length,
                          padding: const EdgeInsets.only(),
                          itemBuilder: (BuildContext context, int index) {
                            return items[index];
                          }),
                    );
                  } else {
                    return Column(
                      children: [
                        Text("Bir hata meydana geldi!"),
                      ],
                    );
                  }
                } catch (Exc) {
                  print(Exc);
                  rethrow;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
