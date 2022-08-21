import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pid/page/web_view.dart';

import '../common/app.dart';
import '../common/routes.dart';
/*
    Part Info
 */

class PartInfoWidget extends StatefulWidget {
  const PartInfoWidget({Key? key}) : super(key: key);

  @override
  PartInfo createState() => PartInfo();
}

class PartInfo extends State<PartInfoWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.hexToColor("#F6FAF6"),
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
          title: const Text(
            "Part Info",
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(
                        color: App.hexToColor("#E8E8E8"),
                        offset: const Offset(5, 5),
                        spreadRadius: 6,
                        blurRadius: 10),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: 2,
                        blurRadius: 10)
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                child: Image(
                  image: const AssetImage("assets/img/image1.png"),
                  width: MediaQuery.of(context).size.width,
                ),
              )),
            const SizedBox(height: 20,),
            Row(
              children: const [
                SizedBox(width: 20,),
                Text("Name: Halterung",style: TextStyle(color: Colors.black,fontSize: 20),)
              ],
            ),
          const SizedBox(height: 10,),
          Row(
            children: const [
              SizedBox(width: 20,),
              Text("Batch: aqweqweWE3691",style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: const [
              SizedBox(width: 20,),
              Text("Orderer: XXXXXX",style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: const [
              SizedBox(width: 20,),
              Text("Technik: SLS",style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: const [
              SizedBox(width: 20,),
              Text("Machine:  EOS-012",style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15),
            width: MediaQuery.of(context).size.width*0.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                onPressed: ()  {
                  //Routes.navigateTo(context,CameraWidget(1));
                  Routes.navigateTo(context, const WebViewWidget());
                },
                child: const Text(
                  "Display",
                  style:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                color:  Colors.black,
                textColor: Colors.white,
                height: 50.0,
                elevation: 0.0,
              ),
            ),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
