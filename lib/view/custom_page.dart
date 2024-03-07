import 'package:flurox/provider/custom_provider.dart';
import 'package:flurox/view/page_cuatro.dart';
import 'package:flurox/view/page_dos.dart';
import 'package:flurox/view/page_tres.dart';
import 'package:flurox/view/page_uno.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCustomPage extends StatelessWidget {

 
  
   MyCustomPage({super.key, });

  @override
  Widget build(BuildContext context) {
print("me dibujo");
  final provider=Provider.of<MyCustomProvider>(context);
  
    
    
    return Expanded(
      child: PageView(

        controller: provider.controller,
        scrollDirection: Axis.vertical,
        children: const [
          PageUno(),
          PageDos(),
          PageTres(),
          PageCuatro()
        ],

      ),);
  }
}