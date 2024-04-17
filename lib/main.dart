
import 'package:flutter/material.dart';
import 'package:google_map/model/router/routerConfig.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: navigationServices().router,
      // routeInformationParser: navigationServices().router.routeInformationParser,
      // routerDelegate: navigationServices().router.routerDelegate,
      // routeInformationProvider: navigationServices().router.routeInformationProvider,
    );
  }
}
