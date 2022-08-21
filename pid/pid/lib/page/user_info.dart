import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pid/page/set_avatar.dart';
import 'package:pid/page/update_app.dart';
import 'dart:io';
import '../common/app.dart';
import '../common/input_routine.dart';
import '../common/routes.dart';
import 'cache_option.dart';

/*
    页面
 */

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  UserInfo createState() => UserInfo();
}

class UserInfo extends State<UserInfoWidget> {
  /*
      页面内容
     */
  Widget? content;

  late ImagePicker _picker;

  late String avatar;

  /*
   百分比
   */
  TextEditingController percentage = TextEditingController();

  /*
  昵称
   */
  TextEditingController nikeName = TextEditingController();

  /*
   地址
   */
  TextEditingController address = TextEditingController();

  /*
   电话
   */
  TextEditingController phone = TextEditingController();

  final FocusNode node = FocusNode();

  /*
   是否显示百分比 修改框
   */
  bool isShowPercentage = false;

  /*
   是否显示百分比 修改框
   */
  bool isShowNikeName = false;

  /*
   设置地址信息
   */
  bool isShowAddress = false;

  /*
   设置电话号码
   */
  bool isShowPhone = false;

  /*
   显示遮罩
   */
  bool isShowMask = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _picker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.hexToColor("#F5F5F5"),
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
          title: const Text(
            "USER",
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/img/avatar.png"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User edit",
                        style: TextStyle(
                            color: App.hexToColor("#808080"), fontSize: 14),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        "Noah Smith",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  PickedFile? image =
                      await _picker.getImage(source: ImageSource.camera);
                  print("得到相片：$image");
                  if (image != null) {
                    String result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SetAvatarWidget(File(image.path))));
                    setState(() {
                      avatar = result;
                    });
                  }
                },
                child: Container(
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
                        "Avatar",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/img/edat_avatar.png"),
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isShowMask = true;
                    isShowNikeName = true;
                  });
                },
                child: Container(
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
                        "nickname",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/img/edit_user_name.png"),
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isShowMask = true;
                    isShowAddress = true;
                  });
                },
                child: Container(
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
                        "address",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/img/loc.png"),
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isShowMask = true;
                    isShowPhone = true;
                  });
                },
                child: Container(
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
                        "Phone Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/img/phone.png"),
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Routes.navigateTo(context, const UpdateAppWidget());
                },
                child: Container(
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
                        "Check for updates",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/img/update.png"),
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isShowMask = true;
                    isShowPercentage = true;
                  });
                },
                child: Container(
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
                        "Set Threshold",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/img/gl.png"),
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Routes.navigateTo(context, const CacheOptionWidget());

                },
                child: Container(
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
                        "Clear cache",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/img/hc.png"),
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
              const SizedBox(
                height: 60,
              ),
            ],
          ),
          Positioned(
            child: Offstage(
              offstage: !isShowMask,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isShowPercentage = false;
                    isShowNikeName = false;
                    isShowAddress = false;
                    isShowPhone = false;
                    isShowMask = false;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRect(
                    child: BackdropFilter(
                      //图片模糊过滤，横向竖向都设置5.0
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      //透明控件
                      child: Opacity(
                        opacity: 0.2,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          //盒子装饰器，进行装饰，设置颜色为灰色
                          decoration:
                              const BoxDecoration(color: Colors.white38),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Offstage(
              offstage: !isShowPercentage,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 35, right: 35),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: const [
                                Text(
                                  "Please enter the threshold value",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "for recognition accuracy:",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          child: InputRoutine(
                            myNode: node,
                            enabled: true,
                            codeController: percentage,
                            hintText: "50",
                          ),
                          width: 70,
                        ),
                        const Text(
                          "%",
                          style: TextStyle(color: Colors.black),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  isShowPercentage = false;
                                  isShowMask = false;
                                });
                              },
                              child: const Text(
                                "cancel",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#ffffff"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#00549F"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
          ),
          Positioned(
            child: Offstage(
              offstage: !isShowNikeName,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 35, right: 35),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: const [
                                Text(
                                  "Please set your nickname",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            )),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          width: 250,
                          child: InputRoutine(
                            myNode: node,
                            enabled: true,
                            codeController: nikeName,
                            hintText: "Please set your nickname",
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  isShowNikeName = false;
                                  isShowMask = false;
                                });
                              },
                              child: const Text(
                                "cancel",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#ffffff"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#00549F"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
          ),
          Positioned(
            child: Offstage(
              offstage: !isShowAddress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 35, right: 35),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: const [
                                Text(
                                  "Please set your address",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            )),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          width: 250,
                          child: InputRoutine(
                            myNode: node,
                            enabled: true,
                            codeController: address,
                            hintText: "Please set your address",
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  isShowAddress = false;
                                  isShowMask = false;
                                });
                              },
                              child: const Text(
                                "cancel",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#ffffff"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#00549F"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
          ),
          Positioned(
            child: Offstage(
              offstage: !isShowPhone,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 35, right: 35),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: const [
                                Text(
                                  "Please set your phone number",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            )),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          width: 250,
                          child: InputRoutine(
                            myNode: node,
                            enabled: true,
                            codeController: phone,
                            hintText: "Please set your phone number",
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  isShowPhone = false;
                                  isShowMask = false;
                                });
                              },
                              child: const Text(
                                "cancel",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#ffffff"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: App.hexToColor("#00549F"),
                              textColor: Colors.blue,
                              height: 50.0,
                              elevation: 0.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
