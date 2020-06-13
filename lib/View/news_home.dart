import 'package:enewspaper/Helper/CategoryData.dart';
import 'package:enewspaper/Helper/NewsData.dart';
import 'package:enewspaper/Model/Article_Model.dart';
import 'package:enewspaper/Model/Category_Model.dart';
import 'package:enewspaper/View/Elements/BlogTile.dart';
import 'package:enewspaper/View/Elements/CategoryTile.dart';
import 'package:flutter/material.dart';

class News_Home extends StatefulWidget {
  @override
  _News_HomeState createState() => _News_HomeState();
}

class _News_HomeState extends State<News_Home> {
  bool _loading = true;
  List<categoryModel> Categories = new List<categoryModel>();
  List<Article> article = new List<Article>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Categories = getCategories();
    getNews();
  }

  getNews() async{
    News news = News();
    await news.getNews();
    article =news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("E"),
            Text(" - ",style: TextStyle(color: Colors.blue,fontSize: 30.00),),
            Text("Newspaper"),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
            children: <Widget>[
        //Categories
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: Categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return CategoryTile(
                      CategoryImage: Categories[index].CategoryImage,
                      CategoryString: Categories[index].CategoryString,
                    );
                  },
                ),
              ),

              //Articles
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: article.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                    return BlogTile(
                      blogImageUrl: article[index].urlToImage,
                      blogTitle: article[index].title,
                      blogDescription: article[index].description,
                      Url: article[index].url,
                    );
                  }) ,
              )

            ],
        ),
      ),
          ),
    );
  }
}
