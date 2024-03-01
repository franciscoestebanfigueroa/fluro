


import 'package:fluro/fluro.dart';
import 'package:flurox/main.dart';

class MyRouter {
  
 static FluroRouter router = FluroRouter();


static void configuracionRouter(){

  router.define("/page1", handler: Handler(handlerFunc: (context, parameters) => PageUno(),));
  router.define("/page2", handler: Handler(handlerFunc: (context, parameters) => PageDos(),));
  router.define("/home", handler: Handler(handlerFunc: (context, parameters) => MyBody(),));

  
}



}
