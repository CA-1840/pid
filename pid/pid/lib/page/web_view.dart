import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


/*
    设置页面模板
 */

class WebViewWidget extends StatefulWidget {

  const WebViewWidget({Key? key}) : super(key: key);

  @override
  WebView createState() => WebView();
}

class WebView extends State<WebViewWidget> {

  final GlobalKey webViewKey = GlobalKey();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          titleSpacing: 5,
          elevation: 0,
          leading: IconButton(
            icon: const Image(
              image: AssetImage("assets/img/back.png"),
              color: Colors.black,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          //隐藏返回箭头
          automaticallyImplyLeading: true,
          title: const Text("3D Model",style: TextStyle(color: Colors.black,fontSize: 16),),
      ),
      body: InAppWebView(
        initialUrlRequest:
        URLRequest(url: Uri.parse("http://fly.dengjray.cn/A/examples/index.html")),
      ),
    );
  }


}