
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_map/model/router/routerName.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
          context.push("${routePathServices.Welcome}/${routePathServices.login_signUp}");
        },
          child: Container(
            height: 50,
            width: 250,
            color: Color.fromARGB(255, 114, 227, 225),
            child: Center(child: Text("Go to login Page")),
          ),
        ),
      ),
    );
  }
}