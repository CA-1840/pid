import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pid/page/web_view.dart';

import '../common/app.dart';
import '../common/routes.dart';

/*
   结果 页面
 */

class ResultWidget extends StatefulWidget {

  const ResultWidget({Key? key}) : super(key: key);

  @override
  Result createState() => Result();
}

class Result extends State<ResultWidget> {


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
          automaticallyImplyLeading: true,
          title: const Text("Result",style: TextStyle(color: Colors.black,fontSize: 16),),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: const Image(image: AssetImage("assets/img/oder_edit.png"), width: 25,height: 25,),
            )
          ],
      ),
      body: ListView(
        children: [
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Routes.navigateTo(context, const WebViewWidget());
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.only(left: 10,right: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      const Image(image: AssetImage("assets/img/image1.png"),  fit: BoxFit.cover,),
                      Positioned(
                        child: SizedBox(
                          key: GlobalKey(),
                          height: MediaQuery.of(context).size.height*0.08,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(bottomRight:Radius.circular(8),bottomLeft: Radius.circular(8) ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                              child: Opacity(
                                opacity: 0.2,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(color: Colors.grey.shade200),
                                ),
                              ),
                            ),
                          ),
                        ),
                        bottom: 0,
                        left: 0,
                        right: 0,
                      ),
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.only(top: 15),
                          height: MediaQuery.of(context).size.height*0.08,
                          child: Row(
                            children: [
                              const SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:const [
                                  Text("NAME:Halterung",style: TextStyle(color: Colors.black),),
                                  Text("BATCH:aqweqweWE3691",style: TextStyle(color: Colors.black),),
                                ],
                              ),
                              const Expanded(child:  SizedBox()),
                              const Image(image: AssetImage("assets/img/xinxi.png"), width: 25,height: 25,  fit: BoxFit.cover,),
                              const SizedBox(width: 15,),
                            ],
                          ),
                        ),
                        bottom: 0,
                        left: 0,
                        right: 0,
                      ),
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.only(top: 0),
                          height: MediaQuery.of(context).size.height*0.05,
                          child: Row(
                            children: const [
                              SizedBox(width: 15,),
                              Text("LIKE",style: TextStyle(color: Colors.white),),
                              Expanded(child:  SizedBox()),
                              Text("98%",style: TextStyle(color: Colors.white),),
                              SizedBox(width: 15,),
                            ],
                          ),
                        ),
                        top: 0,
                        left: 0,
                        right: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
           const SizedBox(height: 20,),
           Container(
             margin: const EdgeInsets.only(left: 15,right: 0,top: 0,bottom: 0),
             child: const Text("RESULT LIST",style:TextStyle(color: Colors.black),),
           ),
          const SizedBox(height: 10,),
          Column(
            children: List.generate(4, (index){
              return Container(
                decoration:  BoxDecoration(
                    color:Colors.white,
                    borderRadius:const BorderRadius.all(Radius.circular(12)),
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
                    ]
                ),
                margin: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                child: Row(
                  children:  [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:const Image(image:  AssetImage("assets/img/image1.png"), width: 80,height: 80,  fit: BoxFit.cover,),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                        Text("NAME:Halterung",style: TextStyle(color: Colors.black),),
                        Text("BATCH:aqweqweWE3691",style: TextStyle(color: Colors.black),)
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    const Text("98%",style:TextStyle(color: Colors.black),),
                    const SizedBox(width: 10,),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }

}