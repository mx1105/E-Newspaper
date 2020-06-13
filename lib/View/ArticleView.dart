import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class  ArticleView extends StatefulWidget {
  final String NewsUrl;

  ArticleView({this.NewsUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  num position =1;
  final Completer<WebViewController> _completer = Completer<WebViewController>();

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
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.more_vert),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: position,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WebView(
              initialUrl: widget.NewsUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: doneLoading,
              onPageStarted: startLoading,
              onWebViewCreated: ((WebViewController webViewControler){
                _completer.complete(webViewControler);
              }),
            ),
          ),
          Container(
            child: Center(
                child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A){
    setState(() {
      position = 1;
    });
  }

}


