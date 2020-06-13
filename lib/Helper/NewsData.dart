import 'dart:convert';

import 'package:enewspaper/Model/Article_Model.dart';
import 'package:http/http.dart' as http;

class News{
  List<Article> news = [];

  Future<void> getNews() async{
    String Url = "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=97cce83602824b1fbed74b4d2d1c82d6";

    var response = await http.get(Url);
    var jsonData = jsonDecode(response.body);
    var rest = jsonData["articles"] as List;
    news = rest.map<Article>((json) => Article.fromJson(json)).toList();
//    if(jsonData['status'] == "ok"){
//      jsonData["articles"].forEach((element){
//        if(element["urlToImage"] != null && element["description"] != null){
//
//        }
//      });
//    }

  return news;
  }

}