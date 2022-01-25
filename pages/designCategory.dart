// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';

class DesignCategory extends StatefulWidget {
  const DesignCategory({Key? key}) : super(key: key);

  @override
  _DesignCategoryState createState() => _DesignCategoryState();
}

class _DesignCategoryState extends State<DesignCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Tasarım"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(categoryImage: 'https://www.upload.ee/image/13813390/metaverse.png', categoryName: 'Metaverse', categoryDailyTerm: 'Yalın Metaverse', categoryTermCount: '128',),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Terimler",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
