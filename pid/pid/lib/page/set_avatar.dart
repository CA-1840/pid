import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:load/load.dart';
import '../common/app.dart';
/*
    3D 测试页面
 */

class SetAvatarWidget extends StatefulWidget {
  SetAvatarWidget(this.image, {Key? key}) : super(key: key);

  File image; //原始图片路径

  @override
  SetAvatar createState() => SetAvatar();
}

class SetAvatar extends State<SetAvatarWidget> {
  late double baseLeft; //图片左上角的x坐标
  late double baseTop; //图片左上角的y坐标
  late double imageWidth; //图片宽度，缩放后会变化
  double imageScale = 1; //图片缩放比例
  late Image imageView;
  final cropKey = GlobalKey<CropState>();
  double progress = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingProvider(
      themeData: LoadingThemeData(),
      loadingWidgetBuilder: (ctx, data) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            width: 100,
            height: 100,
            child: Column(
              children: const [
                SpinKitFadingCircle(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "正在上传",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
            // color: Colors.white,
          ),
        );
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height,
                  child: Crop.file(
                    widget.image,
                    key: cropKey,
                    aspectRatio: 1.0,
                    alwaysShowGrid: true,
                  ),
                ),

              ],
            ),
          ),
          Positioned(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              child: ClipRect(
                child: BackdropFilter(
                  //图片模糊过滤，横向竖向都设置5.0
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  //透明控件
                  child: Opacity(
                    opacity: 0.2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      //盒子装饰器，进行装饰，设置颜色为灰色
                      decoration: const BoxDecoration(color: Colors.white38),
                    ),
                  ),
                ),
              ),
            ),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: Row(
              children: [
                InkWell(
                  child: const Image(
                    image: AssetImage("assets/img/back.png"),
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            top: 45,
            left: 15,
          ),
          Positioned(
            child: const Text(
              "图裁像剪",
              style: TextStyle(color: Colors.white),
            ),
            top: 50,
            left: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(top: 15, bottom: 15)),
                          backgroundColor: MaterialStateProperty.all(
                              App.hexToColor("#FAFAFA")),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ))),
                      child: const Text(
                        "确定",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        _crop(widget.image);
                      }),
                ))
              ],
            ),
            bottom: 50,
            left: 0,
            right: 0,
          ),
        ],
      )),
    );
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop!.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        print("请求权限后：$value");
         ImageCrop.cropImage(
           file: originalFile,
           area: crop.area!,
         ).then((value) {
           upload(value);
         }).catchError(() {
           print('裁剪不成功');
         });
      } else {
        upload(originalFile);
      }
    });
  }

  ///上传头像
  Future<void> upload(File file) async {
    print('裁剪结果：$file');
    showLoadingDialog(tapDismiss: false);
    // String img= await  UploadAliOss.upload(file: file,onSendProgress: (count, data){
    //   print('上传进度：总数：$count  当前：$data  百分比${count/data}%');
    //   // setState(() {
    //   //   progress=count/data;
    //   // });
    // },callback: (uploadCancelToken){
    //   print('出现了状况');
    // });
    // if(null!=img){
    //   print('得到图片 $img');
    //   // progress=0;
    //   hideLoadingDialog();
    //   Navigator.pop(context,img);
    // }
    Navigator.pop(context,file);
  }
}
