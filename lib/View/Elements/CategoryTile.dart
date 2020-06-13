import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final CategoryString, CategoryImage;

  CategoryTile({this.CategoryString, this.CategoryImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(borderRadius:BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: CategoryImage,
                  width: 120,
                  height: 60,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(6),
                color: Colors.black38,
              ),
              width: 120,height: 60,
              child: Text(CategoryString,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
