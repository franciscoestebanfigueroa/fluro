import 'package:flutter/material.dart';

class CustomNavegation{

 static final GlobalKey <NavigatorState>globalKey =GlobalKey <NavigatorState>();

  Future NavegatorTo(String path)=> globalKey.currentState!.pushNamed(path);

 }