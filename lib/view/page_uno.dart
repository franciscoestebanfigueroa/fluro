
import 'package:flurox/provider/custom_provider.dart';
import 'package:flurox/singlento/custom_singlenton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PageUno extends StatelessWidget {
  const PageUno({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCustomProvider>(context);
    return Container(
      color: Colors.blue,
      child: const Center(child: Text("page 1")),
    );
  }
}

