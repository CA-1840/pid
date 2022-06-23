import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/app.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          title: const Text("USER",style: TextStyle(color: Colors.black,fontSize: 16),)
      ),
      body: Column(
        children: [
          const  SizedBox(height: 20,),
          Row(
            children: [
              const SizedBox(width: 20,),
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/img/avatar.png"),
              ),
              const SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("User edit",style: TextStyle(color: App.hexToColor("#808080"),fontSize: 14),),
                  const SizedBox(height: 2,),
                  const Text("Noah Smith",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
          const  SizedBox(height: 20,),
           Container(
             margin: const EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 0),
             padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
             decoration:  BoxDecoration(
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
                 ]
             ),
             child: Row(
               children: const [
                 SizedBox(width: 5,),
                 Text("Avatar",style:TextStyle(color: Colors.black),),
                 Expanded(child: SizedBox()),
                 Image(image: AssetImage("assets/img/edat_avatar.png"), width: 25,height: 25,  fit: BoxFit.cover,),
                 SizedBox(width: 5,),
               ],
             ),
           ),
          const  SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 0),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
            decoration:  BoxDecoration(
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
                ]
            ),
            child: Row(
              children: const [
                SizedBox(width: 5,),
                Text("nickname",style:TextStyle(color: Colors.black),),
                Expanded(child: SizedBox()),
                Image(image: AssetImage("assets/img/edit_user_name.png"), width: 25,height: 25,  fit: BoxFit.cover,),
                SizedBox(width: 5,),
              ],
            ),
          ),
          const  SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 0),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
            decoration:  BoxDecoration(
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
                ]
            ),
            child: Row(
              children: const [
                SizedBox(width: 5,),
                Text("address",style:TextStyle(color: Colors.black),),
                Expanded(child: SizedBox()),
                Image(image: AssetImage("assets/img/loc.png"), width: 25,height: 25,  fit: BoxFit.cover,),
                SizedBox(width: 5,),
              ],
            ),
          ),
          const  SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 0),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
            decoration:  BoxDecoration(
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
                ]
            ),
            child: Row(
              children: const [
                SizedBox(width: 5,),
                Text("Phone Number",style:TextStyle(color: Colors.black),),
                Expanded(child: SizedBox()),
                Image(image: AssetImage("assets/img/phone.png"), width: 25,height: 25,  fit: BoxFit.cover,),
                SizedBox(width: 5,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}