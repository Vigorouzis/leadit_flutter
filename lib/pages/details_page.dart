import 'package:flutter/material.dart';
import 'package:leadit_flutter/models/post.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final Post _post;

  DetailPage(this._post);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebView(
        initialUrl: widget._post.newsURL,
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
