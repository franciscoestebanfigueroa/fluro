//import 'dart:html' as html;//este da error o hay que controlarlo para dispositivos
//hay otro mas facio que es el universalhtml

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as universal;

class MyCustomProvider extends ChangeNotifier {
  int _page = 0;

  late PageController controller;

  List<String> lista = [
    "page1",
    "page2",
    "page3",
    "page4",
  ];

  MyCustomProvider() {
    controller = PageController(initialPage: _page);
    controller.addListener(() {
      universal.window.history
          .pushState(null, "title", "#/${lista[controller.page!.round()]}");
      print(lista[_page]);
    });
  }
  void nuevaInstanciacontroler(String x){
    controller.dispose();
int pos = lista.indexOf(x);
if (pos>=0) { this.controller=PageController(initialPage: pos);}
else 
{pos=0;
 this.controller=PageController(initialPage: pos);
 }
  }

  set pagex(int x) {
    _page = x;
    print("page x $_page");
    // html.window.history.pushState(null, "title", "#/${lista[_page]}");
    universal.window.history.pushState(null, "title", "#/${lista[_page]}");

   //notifyListeners(); no se necesita crea lios
  }
}
