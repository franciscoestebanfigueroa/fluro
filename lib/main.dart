
import 'package:flurox/Layout/Page_home.dart';
import 'package:flurox/handler.dart';
import 'package:flurox/view/custom_page.dart';
import 'package:flutter/material.dart';

 class Navegar{

 static final GlobalKey <NavigatorState>globalKey =GlobalKey <NavigatorState>();

  Future NavegatTo(String path)=> globalKey.currentState!.pushNamed(path);

 }
 

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
      navigatorKey: Navegar.globalKey,
      onGenerateRoute: MyRouter.router.generator,
      initialRoute: "/home",
       builder: (context, child) => Home(child: child!), 
      //home: Home(child: CustomPage()),
      
    );
  }
}

