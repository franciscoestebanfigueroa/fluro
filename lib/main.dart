import 'package:fluro/fluro.dart';
import 'package:flurox/handler.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    MyRouter.configuracionRouter();
    super.initState();
  }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(),
      onGenerateRoute: MyRouter.router.generator,
      initialRoute: "/home",
      //home: MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: (){MyRouter.router.navigateTo(context, "/page1");}, child:const  Text("page 1")),
          TextButton(onPressed: (){MyRouter.router.navigateTo(context, "/page2");}, child:const  Text("page 2")),
    
        ],
      ),
    );
  }
}


class PageUno extends StatelessWidget {
  const PageUno({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(child: Text("page 1")),
    );
  }
}

class PageDos extends StatelessWidget {
  const PageDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(child: Text("Page 2")),
    );
  }
}