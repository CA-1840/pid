import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toast/toast.dart';

import '../common/app.dart';

/*
    相机页面
 */

class CameraWidget extends StatefulWidget {

  ///0 为三张模式 1为一张模式
  int type;

  CameraWidget(this.type,{Key? key}) : super(key: key);

  @override
  Camera createState() => Camera();
}

class Camera extends State<CameraWidget> {

  /*
      页面内容
     */
  Widget? content;

 late List<CameraDescription> cameras;

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  late CameraController controller;

  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late CameraDescription camera;
  bool isNotShow=true;
  int slice=0;
  List<File> image=[];

  AudioCache player=AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();


  @override
  void initState() {

    super.initState();
    _camera();
  }

  void _camera() async{
    List<CameraDescription> cameras = await availableCameras();
    if(cameras.isNotEmpty){
      setState(() {
        _cameraController =
            CameraController(cameras[0], ResolutionPreset.max);
        _initializeControllerFuture = _cameraController.initialize();
        isNotShow=false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    isNotShow=false;
    _cameraController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return  SizedBox(
                  height:  MediaQuery.of(context).size.height,
                  child: CameraPreview(_cameraController),
                  width: MediaQuery.of(context).size.width,
                  // height:MediaQuery.of(context).size.height,
                );
              } else {
                return const Center(child:  SpinKitFadingCircle(
                  color: Colors.black,
                ));
              }
            },
          ),
          Positioned(child: Offstage(
            offstage: isNotShow,
            child: SizedBox(
              key: GlobalKey(),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.12,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
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
          ),
            top: 0,
            left: 0,
          ),
          Positioned(child: Offstage(
            offstage: isNotShow,
            child: Row(
              children:  [
                InkWell(
                  child: const Image(image: AssetImage("assets/img/back.png"), width: 30,height: 30,  fit: BoxFit.cover,),
                  onTap: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
            top: 45,
            left: 15,
          ),
          Positioned(child:Offstage(
            offstage: isNotShow,
            child:  Text(slice==0? "Angle one":slice==1?"Angle two":slice==2?"Angle three":"complete",style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16
            ),),
          ),
            top: 50,
            left: MediaQuery.of(context).size.width*0.4,
          ),
          Positioned(child:Container(
            margin: const EdgeInsets.only(left: 15,right: 15),
            width: MediaQuery.of(context).size.width*0.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                onPressed: () async {
                  print("第：$slice 张");
                  audioPlayer.play(AssetSource("sounds/dog.wav"));
                  if(image.length<3){
                    XFile takePicture = await _cameraController.takePicture();
                    setState(() {
                      if(widget.type==0){
                        slice++;
                      }
                      image.add(File(takePicture.path));
                    });
                    if(widget.type==1){
                      Toast.show("succeed", context,
                          duration: Toast.LENGTH_LONG,
                          gravity: Toast.CENTER);
                    }
                  }else{
                    Toast.show("succeed", context,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.CENTER);
                  }
                },
                child: Text(
                  slice==0? "Angle one":slice==1?"Angle two":slice==2?"Angle three":"complete",
                  style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                color:  Colors.white,
                textColor: Colors.black,
                height: 50.0,
                elevation: 0.0,
              ),
            ),
          ),
            bottom: 45,
            left: 0
          ),
           Positioned(
             child: widget.type==0? Column(
               children: List.generate(image.length, (index) {
                 return GestureDetector(
                     onHorizontalDragStart: (DragStartDetails details){
                       //TODO 删除操作
                       setState(() {
                         if(widget.type==0){
                           slice--;
                         }
                         image.remove(image[index]);
                       });
                     },
                     child: Card(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
                       clipBehavior: Clip.antiAlias,
                       margin: const EdgeInsets.only(top: 5,bottom: 5),
                       child: Image.file(image[index],width: 80,height: 120,fit: BoxFit.cover),
                     ),
                 ) ;
               }).toList(),
             ):const SizedBox(),
             top:100 ,
             right: 10,
           )
        ],
      ),
    );
  }

}