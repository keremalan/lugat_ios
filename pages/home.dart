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
        title: const Text("Lügat", style: TextStyle(color: Colors.black),),
        actions:[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Hamburger()));
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OthersCategory()));
                      },
                      child: PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13821620/others__2_.png', popCategoryTitle: 'Diğerleri'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MetaverseCategory()));
              },
                        child: PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813390/metaverse.png', popCategoryTitle: 'Metaverse',)),
                    GestureDetector(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AiCategory()));},child: PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813368/ai.png', popCategoryTitle: 'Yapay Zeka',)),
                    GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => RoboticsCategory()));},child: PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13824932/robotics.png', popCategoryTitle: 'Robotik',)),
                    GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => DroneCategory()));},child: PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13824935/drone.png', popCategoryTitle: 'Drone',)),
                    GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => FrontEndCategory()));},child: PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13824944/fe__1_.png', popCategoryTitle: 'Front-end',)),
                    GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => BackEndCategory()));},child: PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13824941/be.png', popCategoryTitle: 'Back-end',)),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              GestureDetector(onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=> MetaverseCategory()));},child: CategoryCard(categoryImage: 'https://www.upload.ee/image/13813390/metaverse.png', categoryName: 'Metaverse', categoryDailyTerm: 'Yalın Metaverse', categoryTermCount: '128',)),
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

class SoftwareCategoryOverview extends StatelessWidget {
  const SoftwareCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Yazılım", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SoftwareCategory()));
              },
              child: Text("Tümünü gör", style: TextStyle(color: Colors.black.withOpacity(0.8)),),
            ),
          ],
        ),
        SingleChildScrollView(
          primary: false,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class DesignCategoryOverview extends StatelessWidget {
  const DesignCategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tasarım", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DesignCategory()));
              },
              child: Text("Tümünü gör", style: TextStyle(color: Colors.black.withOpacity(0.8)),),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Term()));
        },
                  child: CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',)),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
              CategoryOverviewCardItem(termImage: 'https://www.upload.ee/image/13813417/code.png', termTitle: 'IDE', termAuthor: 'Kerem Alan',),
            ],
          ),
        ),
      ],
    );
  }
}