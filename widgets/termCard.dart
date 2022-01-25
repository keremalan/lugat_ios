// ignore_for_file: file_names, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/addTerm.dart';

class TermCard extends StatelessWidget {
  TermCard({
    required this.termImage,
    required this.termName,
    required this.termAuthor,
    Key? key,
  }) : super(key: key);
  String termImage;
  String termName;
  String termAuthor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(termImage),
            fit: BoxFit.cover,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10, right: 6, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(termName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                    Text('$termAuthor tarafından oluşturuldu', style: const TextStyle(color: Colors.white, fontSize: 12),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}