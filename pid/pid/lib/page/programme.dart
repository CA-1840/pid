import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/app.dart';
import '../common/routes.dart';
import 'camera.dart';

/*
    页面
 */

class ProgrammeWidget extends StatefulWidget {

  const ProgrammeWidget({Key? key}) : super(key: key);

  @override
  Programme createState() => Programme();
}

class Programme extends State<ProgrammeWidget> {

  /*
      页面内容
     */
  Widget? content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          title: const Text("Please select the camera mode",style: TextStyle(color: Colors.black,fontSize: 16),)
      ),
      body: Column(
        children: [
            Image(image: const AssetImage("assets/img/cam.gif"), width: MediaQuery.of(context).size.width,height: 200,  fit: BoxFit.cover,),
            const SizedBox(height: 50,),
            Container(
              margin: const EdgeInsets.only(left: 15,right: 15),
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: MaterialButton(
                  onPressed: ()  {
                    Routes.navigateTo(context,CameraWidget(0));
                  },
                  child: const Text(
                    "THREE-SHOOT",
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
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 15,right: 15),
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: MaterialButton(
                  onPressed: ()  {
                    Routes.navigateTo(context,CameraWidget(1));
                  },
                  child: const Text(
                    "ONE-SHOOT",
                    style:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  color:  Colors.black,
                  textColor: Colors.white,
                  height: 50.0,
                  elevation: 0.0,
                ),
              ),
            )
        ],
      ),
    );
  }

}