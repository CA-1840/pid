
import 'package:flutter/material.dart';

class Routes{



  /*
   * 关闭当前页面，跳转
   */
  static redirectTo(context,page){
     return  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>page), (Route<dynamic> rout)=>false);
  }

  /*
     普通跳转
   */
  static navigateTo(context,page) async{
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }


}