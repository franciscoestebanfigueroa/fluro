import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Widget child;
  const Home({
    super.key, 
    required this.child,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: child,
      ),
    );
  }
}