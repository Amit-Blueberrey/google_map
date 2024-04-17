import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_map/model/router/routerName.dart';

class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login_SignUp"),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
          context.push("${routePathServices.Welcome}/${routePathServices.main}");
        },
          child: Container(
            height: 50,
            width: 250,
            color: Color.fromARGB(255, 114, 227, 225),
            child: Center(child: Text("Go to main")),
          ),
        ),
      ),
    );
    
  }
}