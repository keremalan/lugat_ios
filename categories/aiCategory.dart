// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/profile.dart';
import 'package:lugat_ios/widgets/categoryCard.dart';

class AiCategory extends StatefulWidget {
  const AiCategory({Key? key}) : super(key: key);

  @override
  _AiCategoryState createState() => _AiCategoryState();
}

class _AiCategoryState extends State<AiCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Yapay Zeka"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryCard(categoryImage: 'https://www.upload.ee/image/13824919/ai.png', categoryName: 'Yapay Zeka', categoryDailyTerm: 'Hard Machine', categoryTermCount: '1337',),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
