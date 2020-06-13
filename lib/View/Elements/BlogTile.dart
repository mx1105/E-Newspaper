import 'package:enewspaper/View/ArticleView.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final blogImageUrl,blogTitle,blogDescription,Url;

  BlogTile({@required this.blogImageUrl,@required this.blogTitle,@required this.blogDescription,@required this.Url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder:(context) => ArticleView(
            NewsUrl: Url,
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(blogImageUrl)
            ),
            SizedBox(height: 8,),
            Text(blogTitle,style: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.w600)),
            SizedBox(height: 8,),
            Text(blogDescription, style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
