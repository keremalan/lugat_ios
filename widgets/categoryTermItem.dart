// ignore: file_names
import 'package:flutter/cupertino.dart';

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
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            ClipRRect( borderRadius: BorderRadius.circular(300),child: Image.network(popCategoryImage, height: 60, width: 60)),
            Text(popCategoryTitle, style: const TextStyle(overflow: TextOverflow.ellipsis),)
          ],
        ),
      ),
      width: 90,
    );
  }
}
