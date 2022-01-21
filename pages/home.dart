import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/addTerm.dart';
import 'package:lugat_ios/pages/designCategory.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';
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
        actions: const [
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("POPÜLER KATEGORİLER", style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 13),),
              SizedBox(height: 8),
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
              SizedBox(height: 22),
              CategoryCard(categoryImage: 'https://www.upload.ee/image/13813390/metaverse.png', categoryName: 'Metaverse', categoryDailyTerm: 'Yalın Metaverse', categoryTermCount: '128',),
              SizedBox(height: 16),
              Text("KATEGORİLER", style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 13),),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tasarım", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DesignCategory()));
                        },
                        child: Text("Tümünü gör"),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
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
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Yazılım", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DesignCategory()));
                        },
                        child: Text("Tümünü gör"),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryOverviewCardItem extends StatelessWidget {
  CategoryOverviewCardItem({
    required this.termImage,
    required this.termTitle,
    required this.termAuthor,
    Key? key,
  }) : super(key: key);
  String termImage;
  String termTitle;
  String termAuthor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(6),child: Image.network(termImage, height: 120, width: 120,)),
          SizedBox(height: 4),
          Text(termTitle, style: TextStyle(overflow: TextOverflow.ellipsis),),
          Text(termAuthor, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5), overflow: TextOverflow.ellipsis),),
        ],
      ),
    );
  }
}