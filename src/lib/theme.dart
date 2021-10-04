import 'package:flutter/material.dart';

Color backgroundColor = Color.fromRGBO(58, 66, 86, 1.0);
Color tileColor = Color.fromRGBO(64, 75, 96, 0.9);
Color textColor = Color.fromRGBO(255, 255, 255, 1.0);
Color iconColor = Color.fromRGBO(255, 255, 255, 1.0);
Color linkColor = Color.fromRGBO(250, 250, 255, 1.0);

void setDarkMode(){
  backgroundColor = Color.fromRGBO(58, 66, 86, 1.0);
  tileColor = Color.fromRGBO(64, 75, 96, 0.9);
  textColor = Color.fromRGBO(255, 255, 255, 1.0);
  iconColor = Color.fromRGBO(255, 255, 255, 1.0);
  linkColor = Color.fromRGBO(234, 234, 234, 1.0);
}

void setLightMode(){
  backgroundColor = Color.fromRGBO(229, 229, 229, 1.0);
  tileColor = Color.fromRGBO(245, 245, 245, 0.9);
  textColor = Color.fromRGBO(0, 0, 0, 1.0);
  iconColor = Color.fromRGBO(38, 38, 38, 1.0);
  linkColor = Color.fromRGBO(31, 31, 31, 1.0);
}