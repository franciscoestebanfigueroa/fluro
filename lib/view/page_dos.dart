import 'package:flutter/material.dart';

class PageDos extends StatelessWidget {
  const PageDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(child: Text("Page 2")),
    );
  }
}