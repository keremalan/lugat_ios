import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/designCategory.dart';
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
                    PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813368/ai.png', popCategoryTitle: 'Yapay Zeka',),
                    PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813368/ai.png', popCategoryTitle: 'Yapay Zeka',),
                    PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813368/ai.png', popCategoryTitle: 'Yapay Zeka',),
                    PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813368/ai.png', popCategoryTitle: 'Yapay Zeka',),
                    PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813368/ai.png', popCategoryTitle: 'Yapay Zeka',),
                    PopularCategoryItem(popCategoryImage: 'https://www.upload.ee/image/13813368/ai.png', popCategoryTitle: 'Yapay Zeka',),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              CategoryCard(categoryImage: 'https://www.upload.ee/image/13813390/metaverse.png', categoryName: 'Metaverse', categoryDailyTerm: 'Yalın Metaverse', categoryTermCount: '128',),
              const SizedBox(height: 16),
              Column(
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
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Yazılım", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const DesignCategory()));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}