// ignore_for_file: file_names, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/addTerm.dart';
import 'package:lugat_ios/pages/hamburger.dart';

class TermCard extends StatefulWidget {
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
  State<TermCard> createState() => _TermCardState();
}

class _TermCardState extends State<TermCard> {
  var _value = 2;

  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.termImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.18), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
                    elevation: 0,
                    offset: Offset(-14, 38),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Report()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("İhlal bildiriminde bulun", style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          value: 1,
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 6, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.termName,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${widget.termAuthor} tarafından oluşturuldu',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
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