import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pid/page/update_tasks.dart';

import '../common/app.dart';
import '../common/routes.dart';
/*
    更新页面
 */

class UpdateAppWidget extends StatefulWidget {

  const UpdateAppWidget({Key? key}) : super(key: key);

  @override
  UpdateApp createState() => UpdateApp();
}


class UpdateApp extends State<UpdateAppWidget> {


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
            "version", style: TextStyle(color: Colors.black, fontSize: 16),)
      ),
      body: Column(
        children: [
          const  SizedBox(height: 25,),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: const Text("VERSION INFORMATION",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
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
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "PLATFORM",
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "android",
                    style: TextStyle(color: Colors.black),
                  ),
                  Image(
                    image: AssetImage("assets/img/rl.png"),
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
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
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "VERSION",
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "1.0.0",
                    style: TextStyle(color: Colors.black),
                  ),
                  Image(
                    image: AssetImage("assets/img/rl.png"),
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
           const SizedBox(height: 50,),
           Container(
             alignment: Alignment.center,
             width: MediaQuery.of(context).size.width,
             child:const Text("New version found",style:  TextStyle(color: Colors.black,fontSize: 16),),
           ),
          const SizedBox(height: 25,),
           Row(
              children: [
                const SizedBox(width: 20,),
                Text("Version number：0.0.02",style: TextStyle(color: App.hexToColor("#C1BEBE")),)
              ],
           ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 20,),
              Text("Version size：68MB",style: TextStyle(color: App.hexToColor("#C1BEBE")),)
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                onPressed: () {
                 Routes.navigateTo(context, const UpdateTasksWidget());
                },
                child: const Text(
                  "update now",
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
          const SizedBox(height: 25,),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                onPressed: () {
                  //Routes.navigateTo(context, const HomeWidget());
                },
                child: const Text(
                  "Not updated temporarily",
                  style:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                color:  App.hexToColor("#000000"),
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