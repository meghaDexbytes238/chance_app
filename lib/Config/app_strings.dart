import 'package:flutter/material.dart';

class AppStrings {
  static String applicationName = 'Flutter Demo';
  static String gameOver = "the game is over";
  static String congrats = "Congratulations";

  static String cancel = "Cancel";
  static String restart = "Restart";
  static String winner = "You are won!!";
  static String errorMsgNumber = "Please Enter Number";
  static String ok = "OK";
  static String next = "Next";
  // static String congrats = "Congratulations";





  static dynamic getRandomValue({required List<dynamic> list}) =>
      (list..shuffle()).first;
}
