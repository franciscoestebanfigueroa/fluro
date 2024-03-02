import 'package:fluro/fluro.dart';
import 'package:flurox/handler.dart';
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
       builder: (context, child) => Scaffold(body: MyBody(child: Expanded(child: child?? Container(color: Colors.amber,))),), 
      
      
    );
  }
}

class MyBodyPage extends StatefulWidget {
  const MyBodyPage({super.key});

  @override
  State<MyBodyPage> createState() => _MyBodyPageState();
}

class _MyBodyPageState extends State<MyBodyPage> {
  PageController controller=PageController(initialPage: 1);
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
      scrollDirection: Axis.vertical,
        controller: controller,
        children: [
          PageDos(),
          PageUno(),
        ],
      ),
    );
  }
}




class MyBody extends StatelessWidget {
  final Widget child ;
  
   MyBody({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          child,
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //los query los pasamos con parametros opcional ? y [q:100]
              TextButton(onPressed: (){MyRouter.router.navigateTo(context, "/page1?q=100");}, child:const  Text("page 1")),
              TextButton(onPressed: (){MyRouter.router.navigateTo(context, "/page2");}, child:const  Text("page 2")),
              TextButton(onPressed: (){Navegar().NavegatTo("/page1");}, child:const  Text("page 2 pero con key")),
              
            ],
          ),
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