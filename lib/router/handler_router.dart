// ignore_for_file: prefer_const_constructors

import 'package:fluro/fluro.dart';
import 'package:flurox/Layout/Page_home.dart';

import 'package:flurox/provider/custom_provider.dart';
import 'package:flurox/view/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRouter {
  static FluroRouter router = FluroRouter();

  static void configuracionRouter() {
    router.define("/:page", handler: Handler(


      handlerFunc: (context, parameters) {

        final provider = Provider.of<MyCustomProvider>(context!, listen: false);
        if(parameters["page"]!.first != "/"){
        
        final String data = parameters["page"]!.first;
         print("parametros page1$parameters");
          
        provider.nuevaInstanciacontroler(data);
        return const Home();

        }
               

      },
    ));


/*
    router.define("/page2", handler: Handler(
      handlerFunc: (context, parameters) {
        print("parametros page2$parameters");
        final provider = Provider.of<MyCustomProvider>(context!, listen: false);
        provider.nuevaInstanciacontroler(1);
        return Home();
      },
    ));

    router.define("/page3", handler: Handler(
      handlerFunc: (context, parameters) {
        print("parametros page3$parameters");
        final provider = Provider.of<MyCustomProvider>(context!, listen: false);
        provider.nuevaInstanciacontroler(2);
        return Home();
      },
    ));

    router.define("/page4", handler: Handler(
      handlerFunc: (context, parameters) {
        print("parametros page4$parameters");
        final provider = Provider.of<MyCustomProvider>(context!, listen: false);
        provider.nuevaInstanciacontroler(3);
        return const Home();
      },
    ));

    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) => const Center(
        child: Text("404"),
      ),
    );

*/
  }

}
