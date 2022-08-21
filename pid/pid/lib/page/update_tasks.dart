import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/app.dart';
/*
    3D 测试页面
 */

class UpdateTasksWidget extends StatefulWidget {
  const UpdateTasksWidget({Key? key}) : super(key: key);

  @override
  UpdateTasks createState() => UpdateTasks();
}

class UpdateTasks extends State<UpdateTasksWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.hexToColor("#FBFBFB"),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "UPDATING",
              style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(200)),
            ),
            child: const Text(
              "50%",
              style: TextStyle(color: Colors.white,fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 25,right: 25),
            width: MediaQuery.of(context).size.width,
            child: const Text("Please wait a moment and complete the update immediately",style:  TextStyle(color: Colors.black,fontSize: 16),),
          )
        ],
      ),
    );
  }
}
