

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scankit/scan_kit_widget.dart';
import 'package:toast/toast.dart';

/*
    扫码页面
 */

class SqrWidget extends StatefulWidget {

  const SqrWidget({Key? key}) : super(key: key);

  @override
  Sqr createState() => Sqr();
}

const boxSize = 200.0;

class Sqr extends State<SqrWidget> {

  late ScanKitController _controller;

  @override
  void dispose(){
     _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScanKitWidget(
              callback: (controller) {
                _controller = controller;
                controller.onResult.listen((result) {
                  Toast.show("测试-扫码结果：$result", context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.CENTER);
                  //  Navigator.of(context).pop(result);
                });
              },
              continuouslyScan: true,
              ),
          Positioned(child: Row(
            children:  [
              InkWell(
                child: const Image(image: AssetImage("assets/img/back.png"), width: 30,height: 30,  fit: BoxFit.cover,),
                onTap: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
            top: 45,
            left: MediaQuery.of(context).size.width*0.05,
          ),
          Positioned(child:
          IconButton(
              onPressed: () {
                _controller.switchLight();
                },
              icon: const Icon(
                Icons.lightbulb_outline_rounded,
                color: Colors.white,
                size: 28,
              )),
            top: 38,
            right: MediaQuery.of(context).size.width*0.02,
          ),
          Positioned(child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: const [
                Expanded(child: SizedBox()),
                  Text("QR-Scanning",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white
                )),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
            top: 50,
            left: 0,
          ),
          Positioned(child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: const [
                Expanded(child: SizedBox()),
                Image(image: AssetImage("assets/img/qrs.png"), width: 70,height: 70,  fit: BoxFit.cover,),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
            top: 80,
            left: 0,
          ),
          Positioned(child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: const [
                Expanded(child: SizedBox()),
                Text("Align the QR-Code within",style:const TextStyle(color: Colors.white),),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
            top: MediaQuery.of(context).size.height*0.2,
            left: 0,
          ),
          Positioned(child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: const [
                Expanded(child: SizedBox()),
                Text("the frame to scan",style:const TextStyle(color: Colors.white),),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
            top: MediaQuery.of(context).size.height*0.22,
            left: 0,
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       IconButton(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           icon: const Icon(
          //             Icons.arrow_back,
          //             color: Colors.white,
          //             size: 28,
          //           )),
          //       IconButton(
          //           onPressed: () {
          //             _controller.switchLight();
          //           },
          //           icon: const Icon(
          //             Icons.lightbulb_outline_rounded,
          //             color: Colors.white,
          //             size: 28,
          //           )),
          //       IconButton(
          //           onPressed: () {
          //             _controller.pickPhoto();
          //           },
          //           icon: const Icon(
          //             Icons.picture_in_picture_rounded,
          //             color: Colors.white,
          //             size: 28,
          //           ))
          //     ],
          //   ),
          // ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border(
                    left: BorderSide(color: Colors.white, width: 2),
                    right: BorderSide(color: Colors.white, width: 2),
                    top: BorderSide(color: Colors.white, width: 2),
                    bottom: BorderSide(color: Colors.white, width: 2)),
              ),
            ),
          ),

        ],
      ),
    );
  }

}