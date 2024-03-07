import 'package:flurox/singlento/custom_singlenton.dart';
import 'package:flutter/material.dart';

class MyCustomProvider extends ChangeNotifier {
 int  page ;

 late PageController controller =PageController(initialPage: page);

List<String>lista =[
  "/page1",
  "/page2",
  "/page3",
  "/page4",
];


MyCustomProvider({required this.page}){
  print(page);
 
  
controller.addListener((){
  print(controller.page?.round());
  //spage=controller.page!.round();

  //controller.jumpToPage(page);

//CustomNavegation().NavegatorTo(lista[controller.page!.round()]);

  });

}


 set pagex (int x){
     page=x;
     print("page x $page");
     notifyListeners();
 }

}