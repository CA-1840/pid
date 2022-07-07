import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pid/page/result_page.dart';
import 'dart:io';
import '../common/app.dart';
import '../common/routes.dart';

/*
   图片确认页面
 */

class PictureConfirmationWidget extends StatefulWidget {

  List<File> image=[];

  PictureConfirmationWidget(this.image,{Key? key}) : super(key: key);

  @override
  PictureConfirmation createState() => PictureConfirmation();
}

class PictureConfirmation extends State<PictureConfirmationWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.hexToColor("#ffffff"),
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
          title: const Text("confirmation",style: TextStyle(color: Colors.black,fontSize: 16),)
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const Text("Please confirm these three pictures",style:TextStyle(color: Colors.black,fontSize: 16),),
          const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(widget.image.length, (index) {
                return  Container(
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            color: App.hexToColor("#E8E8E8"),
                            offset: const Offset(5, 5),
                            spreadRadius: 6,
                            blurRadius: 3),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3, -4),
                            spreadRadius: 2,
                            blurRadius: 4)
                      ]
                  ),
                  margin: const EdgeInsets.all(10),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child:Image.file(widget.image[index],width: 230,height: 270,fit: BoxFit.cover),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                onPressed: () {

                },
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const Text(
                      "Remake",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                color:  App.hexToColor("#C4C4C4"),
                textColor: Colors.white,
                height: 50.0,
                elevation: 0.0,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                onPressed: () {
                  Routes.navigateTo(context, const ResultWidget());
                },
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const Text(
                      "confirm",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
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

        ],
      ),
    );
  }

}