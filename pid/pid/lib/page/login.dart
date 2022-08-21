import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pid/page/home.dart';
import 'package:video_player/video_player.dart';

import '../common/app.dart';
import '../common/routes.dart';


/*
   登录页面
 */

class LoginWidget extends StatefulWidget {

  const LoginWidget({required Key key}) : super(key: key);

  @override
  Login createState() => Login();
}

class Login extends State<LoginWidget> with TickerProviderStateMixin{

  /*
   * 播放控制器
   */
  late VideoPlayerController _controller;

  /*
   * 视频地址
   */
  String videoUrl="http://kinghuiyuan.oss-cn-beijing.aliyuncs.com/lv_0_20220616144423.mp4";

  /*
      页面内容
   */
  Widget? content;

  double start = 0;
  double end   = 200.0;

  late Animation<double> animation;
  late AnimationController controller;

  bool isOpen=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/lv_0_20220616144423.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        // _controller.setVolume(0.0);
      });

  }

  initStart(){
    controller =
        AnimationController(duration:  const Duration(milliseconds: 300), vsync: this);
    //使用弹性曲线
    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack);
    //图片宽高从0变到300
    animation = Tween(begin: start, end: end).animate(animation)
      ..addListener(() {
        setState(() => {
          start = animation.value
        });
        if(start==end){
          //TODO 完成弹出逻辑
          if(start==200){
            setState(() {
              end=0;
              start=200;
              isOpen=true;
            });
          }
          if(start==0){
            setState(() {
              end=200;
              start=0;
              isOpen=false;
            });
          }
        }
      });
    //启动动画
    controller.forward();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.pause();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: _controller.value.aspectRatio /
                MediaQuery.of(context).size.aspectRatio,
            child: Center(
              child: Container(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : const Text("Initializing"),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 26.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("START YOUR IDENTIFICATION",style:TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w700),),
                const SizedBox(
                  height: 20,
                ),
              Container(
                margin: const EdgeInsets.only(left: 15,right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: MaterialButton(
                    onPressed: () {
                      initStart();
                    },
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        const Image(image:  AssetImage("assets/img/microsoft.png"), width: 30,height: 30,  fit: BoxFit.cover,),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Sign up with Microsoft ",
                          style:
                          TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    color:  App.hexToColor("#00549F"),
                    textColor: Colors.white,
                    height: 50.0,
                    elevation: 0.0,
                  ),
                ),
              ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    const Text(
                      "Copyright © 2022 - 2022 YN. All Rights Reserved.",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 13.0),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),

              ],
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: 80.0,
            child: const Image(image: AssetImage("assets/img/logo.png"), height: 80,  fit: BoxFit.cover,),
          ),
          Positioned(
            bottom:0 ,
            top: 0,
            child: Offstage(
              offstage: !isOpen,
              child: GestureDetector(
                onTap: (){
                  initStart();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
           Positioned(
             bottom:0 ,
             child: Container(
               alignment: Alignment.center,
               margin: const EdgeInsets.only(top: 40),
               height: start>=0?start:0,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 color: App.hexToColor("#F5F6FA"),
                 borderRadius: const BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
               ),
               child:Offstage(
                 offstage: start<end,
                 child: Column(
                   children: [
                     const SizedBox(height: 30,),
                     Row(
                       children: [
                         Expanded(child: Container()),
                         const Text(" Open Microsoft account Authentication",style:TextStyle(color: Colors.black),),
                         Expanded(child: Container()),
                       ],
                     ),
                     const SizedBox(height: 40,),
                     Container(
                       margin: const EdgeInsets.only(left: 15,right: 15),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(18.0),
                         child: MaterialButton(
                           onPressed: () {
                             Routes.navigateTo(context, const HomeWidget());
                           },
                           child: Row(
                             children: [
                               Expanded(child: Container()),
                               const Image(image: AssetImage("assets/img/microsoft.png"), width: 30,height: 30,  fit: BoxFit.cover,),
                               const SizedBox(
                                 width: 20,
                               ),
                               const Text(
                                 "Yes, turn on authentication",
                                 style:
                                 TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                               ),
                               Expanded(child: Container()),
                             ],
                           ),
                           color:  App.hexToColor("#00549F"),
                           textColor: Colors.blue,
                           height: 50.0,
                           elevation: 0.0,
                         ),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           )
        ],
      ),
    );
  }

}