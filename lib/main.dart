import 'package:flurox/singlento/custom_singlenton.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      create: (context) => MyCustomProvider(),
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
    );
  }
}
