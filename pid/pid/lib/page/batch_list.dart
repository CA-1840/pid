import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pid/page/part_Info.dart';
import '../common/app.dart';
import '../common/routes.dart';

/*
    批次详情
 */
class BatchListWidget extends StatefulWidget {
  const BatchListWidget({Key? key}) : super(key: key);

  @override
  BatchInfo createState() => BatchInfo();
}

class BatchInfo extends State<BatchListWidget> {
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
            "Batch Info",
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
      body: Column(
        children: [
          const SizedBox(height: 15,),
          Row(
            children: const [
              SizedBox(
                width: 25,
              ),
              Text("Parts list",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: (){
                  Routes.navigateTo(context, const PartInfoWidget());
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
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
                      padding: const EdgeInsets.only(top: 8,bottom: 8),
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: const Image(
                              image: AssetImage("assets/img/image1.png"),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                "NAME:Halterung",
                                style: TextStyle(color: Colors.black,fontSize: 14),
                              ),
                              Text(
                                "BATCHE: aqweqweWE3691",
                                style: TextStyle(color: App.hexToColor("#808080"),fontSize: 12),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children:  [
                                    const Image(image:  AssetImage("assets/img/pl.png"), width: 15,height: 15,),
                                    Text("+4",style: TextStyle(color: App.hexToColor("#808080")),)
                                ],
                              )
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          //wr.png
                          const Image(image: AssetImage("assets/img/wr.png"), width: 25,height: 25,),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        child: const Text("Verified",style: TextStyle(
                          color: Colors.white
                        ),),
                        decoration: BoxDecoration(
                            color:  index==0?App.hexToColor("#51B177"):index==1?App.hexToColor("#E03F3F"):index==2?App.hexToColor("#00549F"):index==3?App.hexToColor("#51B177"):App.hexToColor("#51B177"),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12),topRight: Radius.circular(12)),
                        ),
                        padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
                      ),
                      top: 8,
                      right: 10,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
