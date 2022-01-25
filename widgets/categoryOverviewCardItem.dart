// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

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
          const SizedBox(height: 4),
          Text(termTitle, style: const TextStyle(overflow: TextOverflow.ellipsis),),
          Text(termAuthor, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5), overflow: TextOverflow.ellipsis),),
        ],
      ),
    );
  }
}