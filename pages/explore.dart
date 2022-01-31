// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lugat_ios/categories/aiCategory.dart';
import 'package:lugat_ios/categories/architectureCategory.dart';
import 'package:lugat_ios/categories/backendCategory.dart';
import 'package:lugat_ios/categories/computerHardware.dart';
import 'package:lugat_ios/categories/designCategory.dart';
import 'package:lugat_ios/categories/droneCategory.dart';
import 'package:lugat_ios/categories/frontendCategory.dart';
import 'package:lugat_ios/categories/metaverseCategory.dart';
import 'package:lugat_ios/categories/othersCategory.dart';
import 'package:lugat_ios/categories/roboticsCategory.dart';
import 'package:lugat_ios/categories/softwareCategory.dart';
import 'package:lugat_ios/categories/uiCategory.dart';
import 'package:lugat_ios/categories/uxCategory.dart';
import 'package:lugat_ios/pages/home.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text("Keşfet"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const OthersCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13821620/others__2_.png',
                              categoryName: 'Diğer Terimler')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MetaverseCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13813390/metaverse.png',
                              categoryName: 'Metaverse')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const AiCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13824919/ai.png',
                              categoryName: 'Yapay Zeka')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ArchitectureCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13838969/architecture.png',
                              categoryName: 'Mimari')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ComputerHardwareCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13838754/comware.png',
                              categoryName: 'Donanımlar')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const DroneCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13824935/drone.png',
                              categoryName: 'Drone')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const FrontEndCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13824944/fe__1_.png',
                              categoryName: 'Front-End')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const SoftwareCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13838742/software.png',
                              categoryName: 'Yazılım')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const UXCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13844734/ux.png',
                              categoryName: 'UX')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const UICategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13844724/ui.png',
                              categoryName: 'UI')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const RoboticsCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                              'https://www.upload.ee/image/13824932/robotics.png',
                              categoryName: 'Robotik')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DesignCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                                  'https://www.upload.ee/image/13779591/designCategory.png',
                              categoryName: 'Tasarım')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BackEndCategory()));
                          },
                          child: ExploreCategoriesItem(
                              categoryImage:
                                  'https://www.upload.ee/image/13824941/be.png',
                              categoryName: 'Back-end')),
                    ],
                  ),
                ),
                const OthersCategoryOverview(),
                const MetaverseCategoryOverview(),
                const AiCategoryOverview(),
                const DesignCategoryOverview(),
                const UICategoryOverview(),
                const UXCategoryOverview(),
                const SoftwareCategoryOverview(),
                const DroneCategoryOverview(),
                const ComputerHardwareCategoryOverview(),
                const ArchitectureCategoryOverview(),
                const RoboticCategoryOverview(),
                const FrontEndCategoryOverview(),
                const BackEndCategoryOverview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExploreCategoriesItem extends StatelessWidget {
  ExploreCategoriesItem({
    required this.categoryImage,
    required this.categoryName,
    Key? key,
  }) : super(key: key);
  String categoryImage;
  String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(categoryImage),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.28), BlendMode.darken),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
