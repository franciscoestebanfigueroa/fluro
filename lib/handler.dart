


import 'package:fluro/fluro.dart';
import 'package:flurox/main.dart';
import 'package:flutter/material.dart';

class MyRouter {
  
 static FluroRouter router = FluroRouter();


static void configuracionRouter(){

  router.define("/home", handler: Handler(handlerFunc: (context, parameters) {
    print("parametros home$parameters");
    return MyBody(child:PageUno() ,);},));
  
  router.define("/page1", handler: Handler(handlerFunc: (context, parameters) { 
    print("parametros 1$parameters");
    return PageUno();},));
  
  router.define("/page2", handler: Handler(handlerFunc: (context, parameters) {
    print("parametros 2 parameters");
    return PageDos();},));

    router.define("/pageview", handler: Handler(handlerFunc: (context, parameters) {
    print("parametros 2 parameters");
    return MyBodyPage();},));
    
    router.notFoundHandler=Handler(handlerFunc: (context, parameters) => Center(child: const Text("404"),),);
  
}



}
