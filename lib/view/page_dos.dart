import 'package:flutter/material.dart';

class PageDos extends StatelessWidget {
  const PageDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 201, 154, 13),
      child: const Center(child: Text("Page 2")),
    );
  }
}