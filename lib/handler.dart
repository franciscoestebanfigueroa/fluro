


import 'package:fluro/fluro.dart';
import 'package:flurox/Layout/Page_home.dart';
import 'package:flurox/view/custom_page.dart';
import 'package:flutter/material.dart';

class MyRouter {
  
 static FluroRouter router = FluroRouter();


static void configuracionRouter(){

  router.define("/home", handler: Handler(handlerFunc: (context, parameters) {
    print("parametros home$parameters");
    return const Home(child: CustomPage(),) ;},));
  
    
    router.notFoundHandler=Handler(handlerFunc: (context, parameters) => Center(child: const Text("404"),),);
  
}



}
