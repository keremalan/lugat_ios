// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/categories/aiCategory.dart';
import 'package:lugat_ios/categories/architectureCategory.dart';
import 'package:lugat_ios/categories/backendCategory.dart';
import 'package:lugat_ios/categories/computerHardware.dart';
import 'package:lugat_ios/categories/designCategory.dart';
import 'package:lugat_ios/categories/droneCategory.dart';
import 'package:lugat_ios/categories/frontendCategory.dart';
import 'package:lugat_ios/categories/gamedevCategory.dart';
import 'package:lugat_ios/categories/metaverseCategory.dart';
import 'package:lugat_ios/categories/othersCategory.dart';
import 'package:lugat_ios/categories/roboticsCategory.dart';
import 'package:lugat_ios/categories/softwareCategory.dart';
import 'package:lugat_ios/categories/uiCategory.dart';
import 'package:lugat_ios/categories/uxCategory.dart';
import 'package:lugat_ios/pages/hamburger.dart';
import 'package:lugat_ios/pages/term.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';
import 'package:lugat_ios/widgets/categoryTermItem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> _termsStream =
      FirebaseFirestore.instance.collection('terms').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                                builder: (context) => const OthersCategory()));
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
                                builder: (context) =>
                                    const ArchitectureCategory()));
                      },
                      child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13838969/architecture.png',
                          popCategoryTitle: 'Mimari'),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MetaverseCategory()));
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
                                  builder: (context) => const AiCategory()));
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
                                  builder: (context) =>
                                      const RoboticsCategory()));
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
                                  builder: (context) => const DroneCategory()));
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
                                  builder: (context) =>
                                      const FrontEndCategory()));
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
                                  builder: (context) =>
                                      const BackEndCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13824941/be.png',
                          popCategoryTitle: 'Back-end',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UICategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13844724/ui.png',
                          popCategoryTitle: 'UI',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UXCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13844734/ux.png',
                          popCategoryTitle: 'UX',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ComputerHardwareCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13838754/comware.png',
                          popCategoryTitle: 'Donanımlar',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SoftwareCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13838742/software.png',
                          popCategoryTitle: 'Yazılım',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DesignCategory()));
                        },
                        child: PopularCategoryItem(
                          popCategoryImage:
                              'https://www.upload.ee/image/13779591/designCategory.png',
                          popCategoryTitle: 'Tasarım',
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
                            builder: (context) => const AiCategory()));
                  },
                  child: CategoryCard(
                    categoryImage:
                        'https://www.upload.ee/image/13824919/ai.png',
                    categoryName: 'Yapay Zeka',
                    categoryDailyTerm: 'Fuzzy Logic',
                    categoryTermCount: '128',
                  )),
              const SizedBox(height: 16),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _termsStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Bir şeyler ters gitmiş olmalı.');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('Şu anda içerik yükleniyor.');
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
                                final String termCategory =
                                    data['termCategory'];
                                final bool isSaved = data['isSaved'];
                                final String authorPhotoUrl =
                                    data['authorPhotoUrl'];
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
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Image.network(
                                                  data['authorPhotoUrl'],
                                                  width: 40,
                                                  height: 40)),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(data['termAuthor']),
                                                    Text("",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.4))),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                        fit: FlexFit.loose,
                                                        child: Text(
                                                            data['termMean'],
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)))),
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
                                        padding:
                                            const EdgeInsets.only(left: 52),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 4),
                                            Container(
                                              width: 396,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      data['termImage']),
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.black
                                                          .withOpacity(0.18),
                                                      BlendMode.darken),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12,
                                                            bottom: 12),
                                                    child: Column(
                                                      children: [
                                                        Text(data['termTitle'],
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 17)),
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
    );
  }
}

class UXCategoryOverview extends StatefulWidget {
  const UXCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<UXCategoryOverview> createState() => _UXCategoryOverviewState();
}

class _UXCategoryOverviewState extends State<UXCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'UX')
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
              "UX",
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class GameDevCategoryOverview extends StatefulWidget {
  const GameDevCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<GameDevCategoryOverview> createState() =>
      _GameDevCategoryOverviewState();
}

class _GameDevCategoryOverviewState extends State<GameDevCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'GameDev')
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
              "Oyun Geliştirme",
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class UICategoryOverview extends StatefulWidget {
  const UICategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<UICategoryOverview> createState() => _UICategoryOverviewState();
}

class _UICategoryOverviewState extends State<UICategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'UI')
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
              "UI",
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class SoftwareCategoryOverview extends StatefulWidget {
  const SoftwareCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<SoftwareCategoryOverview> createState() =>
      _SoftwareCategoryOverviewState();
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class ComputerHardwareCategoryOverview extends StatefulWidget {
  const ComputerHardwareCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<ComputerHardwareCategoryOverview> createState() =>
      _ComputerHardwareCategoryOverviewState();
}

class _ComputerHardwareCategoryOverviewState
    extends State<ComputerHardwareCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'comware')
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
              "Bilgisayar Donanımları",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ComputerHardwareCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class ArchitectureCategoryOverview extends StatefulWidget {
  const ArchitectureCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<ArchitectureCategoryOverview> createState() =>
      _ArchitectureCategoryOverviewState();
}

class _ArchitectureCategoryOverviewState
    extends State<ArchitectureCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'architecture')
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
              "Mimari",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ArchitectureCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
                        builder: (context) => const DesignCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class AiCategoryOverview extends StatefulWidget {
  const AiCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<AiCategoryOverview> createState() => _AiCategoryOverviewState();
}

class _AiCategoryOverviewState extends State<AiCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'Ai')
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
              "Yapay Zeka",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AiCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class BackEndCategoryOverview extends StatefulWidget {
  const BackEndCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<BackEndCategoryOverview> createState() =>
      _BackEndCategoryOverviewState();
}

class _BackEndCategoryOverviewState extends State<BackEndCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'BackEnd')
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
              "Back-end",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BackEndCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class DroneCategoryOverview extends StatefulWidget {
  const DroneCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<DroneCategoryOverview> createState() => _DroneCategoryOverviewState();
}

class _DroneCategoryOverviewState extends State<DroneCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'Drone')
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
              "Drone",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DroneCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class FrontEndCategoryOverview extends StatefulWidget {
  const FrontEndCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<FrontEndCategoryOverview> createState() =>
      _FrontEndCategoryOverviewState();
}

class _FrontEndCategoryOverviewState extends State<FrontEndCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'FrontEnd')
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
              "Front-end",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FrontEndCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class MetaverseCategoryOverview extends StatefulWidget {
  const MetaverseCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<MetaverseCategoryOverview> createState() =>
      _MetaverseCategoryOverviewState();
}

class _MetaverseCategoryOverviewState extends State<MetaverseCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'Metaverse')
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
              "Metaverse",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MetaverseCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class OthersCategoryOverview extends StatefulWidget {
  const OthersCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<OthersCategoryOverview> createState() => _OthersCategoryOverviewState();
}

class _OthersCategoryOverviewState extends State<OthersCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'Others')
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
              "Diğer Terimler",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OthersCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}

class RoboticCategoryOverview extends StatefulWidget {
  const RoboticCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<RoboticCategoryOverview> createState() =>
      _RoboticCategoryOverviewState();
}

class _RoboticCategoryOverviewState extends State<RoboticCategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms')
      .where("termCategory", isEqualTo: 'Robotic')
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
              "Robotik",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RoboticsCategory()));
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _termsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          const SizedBox(
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
                    children: const [
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
      ],
    );
  }
}
