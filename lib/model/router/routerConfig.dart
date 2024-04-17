
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_map/model/router/routerName.dart';
import 'package:google_map/view/login_signUp.dart';
import 'package:google_map/view/main_navbar.dart';
import 'package:google_map/view/navbar/pages.dart';
import 'package:google_map/view/welcome.dart';

class navigationServices {
  final GoRouter router = GoRouter(
    initialLocation: routePathServices.Welcome,
    routes: [
      // Initial welcome page
      GoRoute(
          path:'/:screen', // This pattern captures the screen name from the URL
          builder: (context, state ) {
            final screen = state.pathParameters['screen'] as String; // Extract the screen name
                debugPrint("screen navigate - $screen");
              // return WelcomePage();
            // Navigate to the appropriate screen based on the deep link
            switch (screen) {
              case routePathServices.login_signUp:
               debugPrint("screen navigate login");
                return const LoginSignupPage();
              case routePathServices.main:
              debugPrint("screen navigate main");
                return MainPage();
              // Add more cases for other screens if needed
              default:
              debugPrint("screen default");
                return WelcomePage();
            }
          },
          routes: <RouteBase>[
            // Login/Signup page
            GoRoute(
              path: routePathServices.login_signUp,
              builder: (context, state) => const LoginSignupPage(),
            ),
            // Main page with bottom navigation
            GoRoute(
              path: routePathServices.main,
              builder: (context, state) => MainPage(),
              routes: <RouteBase>[
                // Bottom navigation routes
                GoRoute(
                  path: routePathServices.page1,
                  builder: (context, state) => Page1(),
                ),
                GoRoute(
                  path: routePathServices.page2,
                  builder: (context, state) => const Page2(),
                ),
                GoRoute(
                  path: routePathServices.page3,
                  builder: (context, state) => const Page3(),
                ),
                GoRoute(
                  path: routePathServices.page4,
                  builder: (context, state) => const Page4(),
                ),
              ],
            ),
          ]),
    ],
    // redirect: (context, state) {
    //     bool isAuthenticated = false;

    //     if (isAuthenticated == true) {
    //       return routePathServices.Welcome;
    //     } else {
    //       return routePathServices.main;
    //     }
    //   },
  );
}
