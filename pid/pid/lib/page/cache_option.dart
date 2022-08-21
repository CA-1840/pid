import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scankit/scan_kit_widget.dart';
import 'package:toast/toast.dart';

import '../common/app.dart';
/*
    3D 测试页面
 */

class CacheOptionWidget extends StatefulWidget {

  const CacheOptionWidget({Key? key}) : super(key: key);

  @override
  CacheOption createState() => CacheOption();
}


class CacheOption extends State<CacheOptionWidget> {


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.hexToColor("#FBFBFB"),
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
            "CACHE", style: TextStyle(color: Colors.black, fontSize: 16),)
      ),
      body: Column(
        children: [
          const  SizedBox(height: 25,),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: const Text("CACHE INFORMATION",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
          ),
          const  SizedBox(height: 60,),
          GestureDetector(
            onTap: (){

            },
            child:  Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 0, bottom: 0),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: App.hexToColor("#E5E5E5"),
                        offset: const Offset(5, 5),
                        spreadRadius: 5,
                        blurRadius: 10),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: 2,
                        blurRadius: 20)
                  ]),
              child: Row(
                children:  [
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "SD CARD",
                    style: TextStyle(color: Colors.black),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "100MB",
                    style: TextStyle(color: App.hexToColor("#C4C4C4")),
                  ),
                  const Image(
                    image: AssetImage("assets/img/rl.png"),
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          const  SizedBox(height: 25,),
          GestureDetector(
            onTap: (){

            },
            child:  Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 0, bottom: 0),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: App.hexToColor("#E5E5E5"),
                        offset: const Offset(5, 5),
                        spreadRadius: 5,
                        blurRadius: 10),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: 2,
                        blurRadius: 20)
                  ]),
              child: Row(
                children:  [
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "FILE",
                    style: TextStyle(color: Colors.black),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "30MB",
                    style: TextStyle(color: App.hexToColor("#C4C4C4")),
                  ),
                  const Image(
                    image: AssetImage("assets/img/rl.png"),
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          const  SizedBox(height: 25,),
          GestureDetector(
            onTap: (){

            },
            child:  Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 0, bottom: 0),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: App.hexToColor("#E5E5E5"),
                        offset: const Offset(5, 5),
                        spreadRadius: 5,
                        blurRadius: 10),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: 2,
                        blurRadius: 20)
                  ]),
              child: Row(
                children:  [
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "OTHER",
                    style: TextStyle(color: Colors.black),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "0MB",
                    style: TextStyle(color: App.hexToColor("#C4C4C4")),
                  ),
                  const Image(
                    image: AssetImage("assets/img/rl.png"),
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          const  SizedBox(height: 80,),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                onPressed: () {

                },
                child: const Text(
                  "Clean now",
                  style:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                color:  App.hexToColor("#00549F"),
                textColor: Colors.white,
                height: 50.0,
                elevation: 0.0,
              ),
            ),
          ),

        ],
      ),
    );
  }

}