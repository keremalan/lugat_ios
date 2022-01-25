// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/addTerm.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    required this.categoryImage,
    required this.categoryDailyTerm,
    required this.categoryName,
    required this.categoryTermCount,
    Key? key,
  }) : super(key: key);
  String categoryImage;
  String categoryName;
  String categoryDailyTerm;
  String categoryTermCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: NetworkImage(categoryImage),
            fit: BoxFit.cover,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 6, top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Günün kelimesi", style: TextStyle(color: Colors.white),),
                    Text(categoryDailyTerm, style: const TextStyle(fontSize: 12, color: Colors.white)),
                  ],
                ),
                //TextButton(
                  //onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTerm()));
                    //},
                  //child: Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(30), color: Colors.white),child: const Padding(
                      //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    //child: Text("Terim ekle", style: TextStyle(color: Colors.black),),
                  //)),
                //),
              ]//,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10, right: 6, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(categoryName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                    Text('$categoryTermCount terim içeriyor', style: const TextStyle(color: Colors.white, fontSize: 12),),
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