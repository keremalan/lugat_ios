// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';

class MetaverseCategory extends StatefulWidget {
  const MetaverseCategory({Key? key}) : super(key: key);

  @override
  _MetaverseCategoryState createState() => _MetaverseCategoryState();
}

class _MetaverseCategoryState extends State<MetaverseCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Metaverse"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryCard(categoryImage: 'https://www.upload.ee/image/13813390/metaverse.png', categoryName: 'Metaverse', categoryDailyTerm: 'Yalın Metaverse', categoryTermCount: '1337',),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Terimler",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
