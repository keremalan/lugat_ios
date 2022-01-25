import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/categories/backendCategory.dart';
import 'package:lugat_ios/categories/designCategory.dart';
import 'package:lugat_ios/categories/othersCategory.dart';
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
        title: Text("Keşfet"),
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
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => DesignCategory()));},child: ExploreCategoriesItem(categoryImage: 'https://www.upload.ee/image/13779591/designCategory.png', categoryName: 'Tasarım')),
                      GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => BackEndCategory()));},child: ExploreCategoriesItem(categoryImage: 'https://www.upload.ee/image/13824941/be.png', categoryName: 'Back-end')),
                      GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => OthersCategory()));},child: ExploreCategoriesItem(categoryImage: 'https://www.upload.ee/image/13821620/others__2_.png', categoryName: 'Diğer Terimler'))
                    ],
                  ),
                ),
                DesignCategoryOverview(),
                SoftwareCategoryOverview(),
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
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              child: Text(categoryName, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
    );
  }
}
