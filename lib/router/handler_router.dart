import 'package:fluro/fluro.dart';
import 'package:flurox/Layout/Page_home.dart';

import 'package:flurox/provider/custom_provider.dart';
import 'package:flurox/view/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRouter {
  static FluroRouter router = FluroRouter();

  static void configuracionRouter() {
    router.define("/:page1", handler: Handler(
      handlerFunc: (context, parameters) {
        print("parametros page1$parameters");
        return Home(child: MyCustomPage());
      },
    ));

    router.define("/:page2", handler: Handler(
      handlerFunc: (context, parameters) {
        print("parametros page2$parameters");

        return Home(child: MyCustomPage());
      },
    ));

    router.define("/:page3", handler: Handler(
      handlerFunc: (context, parameters) {
        print("parametros page3$parameters");
        final provider = Provider.of<MyCustomProvider>(context!, listen: false);
        provider.pagex = 3;
        return Home(child: MyCustomPage());
      },
    ));

    router.define("/:page4", handler: Handler(
      handlerFunc: (context, parameters) {
        print("parametros page4$parameters");
        return Home(child: MyCustomPage());
      },
    ));

    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) => Center(
        child: const Text("404"),
      ),
    );
  }
}
