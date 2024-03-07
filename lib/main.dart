
import 'package:flurox/singlento/custom_singlenton.dart';
import 'package:flurox/view/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flurox/Layout/Page_home.dart';
import 'package:flurox/router/handler_router.dart';
import 'package:flurox/provider/custom_provider.dart';

 
 

void main() {
  MyRouter.configuracionRouter();
  runApp(const MyAppProvider());
}


class MyAppProvider extends StatelessWidget {
  const MyAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
                
               child: const MyApp(),
               create: (context) => MyCustomProvider(page: 0),
              );
            
            
      
  }
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: CustomNavegation.globalKey,
      onGenerateRoute: MyRouter.router.generator,
      initialRoute: "/page1",
      builder: (context, child) => Home(child: child!), 
      
      
    );
  }
}

