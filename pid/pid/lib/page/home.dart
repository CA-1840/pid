import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_permission/flutter_easy_permission.dart';
import 'package:pid/page/programme.dart';
import 'package:pid/page/sqr.dart';
import 'package:pid/page/user_info.dart';
import 'package:vibrate/vibrate.dart';

import '../common/app.dart';
import '../common/routes.dart';

import 'package:flutter_easy_permission/constants.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';

import 'camera.dart';

/*
    页面
 */

class HomeWidget extends StatefulWidget {

  const HomeWidget({Key? key}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<HomeWidget> {

  /*
      页面内容
     */
  Widget? content;

  List data=[
    {
      "id":"15615313",
      "name":"Auftrag-20220410058",
      "date":"2022-04-10",
    },
    {
      "id":"15615313",
      "name":"Auftrag-20220410058",
      "date":"2022-04-10",
    },
    {
      "id":"15615313",
      "name":"Auftrag-20220410058",
      "date":"2022-04-10",
    },
    {
      "id":"15615313",
      "name":"Auftrag-20220410058",
      "date":"2022-04-10",
    },
    {
      "id":"15615313",
      "name":"Auftrag-20220410058",
      "date":"2022-04-10",
    },
    {
      "id":"15615313",
      "name":"Auftrag-20220410058",
      "date":"2022-04-10",
    },
    {
      "id":"15615313",
      "name":"Auftrag-20220410058",
      "date":"2022-04-10",
    },
  ];

  final  _permissions =  [
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.CAMERA,
    Permissions.RECORD_AUDIO
  ];

  final  _permissionGroup =  [
    PermissionGroup.Camera,
    PermissionGroup.Photos,
  ];

  late Widget page;

  @override
  void initState() {
    super.initState();
    FlutterEasyPermission().addPermissionCallback(
        onGranted: (requestCode, perms,perm) {
           Routes.navigateTo(context, page);
        },
        onDenied: (requestCode, perms,perm, isPermanent) {

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.hexToColor("#F6FAF6"),
      body: Column(
        children: [
          const  SizedBox(height: 60,),
          Row(
            children: [
              const SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  Routes.navigateTo(context, const UserInfoWidget());
                },
                child: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/img/avatar.png"),
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                children: [
                  Text("Welcome back",style: TextStyle(color: App.hexToColor("#808080"),fontSize: 14),),
                  const SizedBox(height: 2,),
                  const Text("Noah Smith",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)
                ],
              ),
              Expanded(child: Container()),
              const Image(image: AssetImage("assets/img/set.png"), width: 30,height: 30,  fit: BoxFit.cover,),
              const SizedBox(width: 20,),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  Vibrate.vibrateDelay(const Duration(milliseconds: 100));
                  //CameraWidget
                  setState(() {
                    page=const ProgrammeWidget();
                  });
                  permissionCheck(const ProgrammeWidget());
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 23,right: 23,top: 23,bottom: 23),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Row(
                    children: const [
                      Image(image: AssetImage("assets/img/camera.png"), width: 30,height: 30,  fit: BoxFit.cover,),
                      SizedBox(width: 10,),
                      Text("IDENTIFY",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: (){
                  Vibrate.vibrateDelay(const Duration(milliseconds: 100));
                  setState(() {
                    page=const SqrWidget();
                  });
                  permissionCheck(const SqrWidget());
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 23,right: 23,top: 23,bottom: 23),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Row(
                    children: const[
                      Image(image: AssetImage("assets/img/sqr.png"), width: 30,height: 30,  fit: BoxFit.cover,),
                      SizedBox(width: 10,),
                      Text("QR-CODE",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20,),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(width: 20,),
              Text("ORDER LIST",style: TextStyle(color: Colors.black,fontSize: 16),)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: ListView(
            padding: const EdgeInsets.only(top: 0),
            children: List.generate(data.length, (index) {
              return  Container(
                margin: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                padding: const EdgeInsets.only(left: 0,right: 0,top: 20,bottom: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("name:${data[index]['name']}",style:const TextStyle(color: Colors.black),),
                        const SizedBox(height: 5,),
                        Text("id:${data[index]['id']}",style:const TextStyle(color: Colors.black),)
                      ],
                    ),
                    Expanded(child: Container()),
                    Text(data[index]['date'],style:const TextStyle(color: Colors.black),),
                    const SizedBox(width: 15,),
                  ],
                ),
              );
            }).toList(),
          ))
        ],
      ),
    );
  }


  permissionCheck(toPage) async {
     // 如果没有权限则请求
     if (!await FlutterEasyPermission.has(perms: _permissions,permsGroup: _permissionGroup)) {
           FlutterEasyPermission.request(perms: _permissions,permsGroup: _permissionGroup);
     } else {
     // 有权限则调用
       Routes.navigateTo(context, toPage);
     }
 }


}