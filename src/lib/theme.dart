import 'package:flutter/material.dart';

Color backgroundColor = const Color.fromRGBO(58, 66, 86, 1.0);
Color tileColor = const Color.fromRGBO(64, 75, 96, 0.9);
Color textColor = const Color.fromRGBO(255, 255, 255, 1.0);
Color iconColor = const Color.fromRGBO(255, 255, 255, 1.0);
Color linkColor = const Color.fromRGBO(250, 250, 255, 1.0);

void setDarkMode(){
  backgroundColor = const Color.fromRGBO(58, 66, 86, 1.0);
  tileColor = const Color.fromRGBO(64, 75, 96, 0.9);
  textColor = const Color.fromRGBO(255, 255, 255, 1.0);
  iconColor = const Color.fromRGBO(255, 255, 255, 1.0);
  linkColor = const Color.fromRGBO(234, 234, 234, 1.0);
}

void setLightMode(){
  backgroundColor = const Color.fromRGBO(229, 229, 229, 1.0);
  tileColor = const Color.fromRGBO(245, 245, 245, 0.9);
  textColor = const Color.fromRGBO(0, 0, 0, 1.0);
  iconColor = const Color.fromRGBO(38, 38, 38, 1.0);
  linkColor = const Color.fromRGBO(31, 31, 31, 1.0);
}