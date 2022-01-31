// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopularCategoryItem extends StatelessWidget {
  PopularCategoryItem({
    required this.popCategoryImage,
    required this.popCategoryTitle,
    Key? key,
  }) : super(key: key);
  String popCategoryImage;
  String popCategoryTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(right: 2),
        child: Column(
          children: [
            ClipRRect( borderRadius: BorderRadius.circular(300),child: Image.network(popCategoryImage, height: 60, width: 60, fit: BoxFit.cover)),
            const SizedBox(height: 4),
            Text(popCategoryTitle, style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black.withOpacity(0.6))),
          ],
        ),
      ),
      width: 90,
    );
  }
}
