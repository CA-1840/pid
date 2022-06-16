
import 'dart:ui';

class App{

  /*
    字符串颜色转16 进制颜色
   * code:#fffff
   */
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }


}