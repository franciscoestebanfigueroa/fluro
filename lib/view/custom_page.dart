import 'package:flurox/view/page_cuatro.dart';
import 'package:flurox/view/page_dos.dart';
import 'package:flurox/view/page_tres.dart';
import 'package:flurox/view/page_uno.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
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