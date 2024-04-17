
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:google_map/model/colorModel.dart';
import 'package:google_map/model/router/routerName.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key,});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<String> pages = [
    routePathServices.page1,
    routePathServices.page2,
    routePathServices.page3,
    routePathServices.page4,
  ];
    // context.go(pages[index]);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("main navbar"),
      // ),
      // body: ,
      bottomNavigationBar: Container(
        color: backLightColor,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: screenHeight * 0.02,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
            ),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                context.push("${routePathServices.Welcome}/${routePathServices.main}/${pages[index]}" );
              },
              backgroundColor: backLightColor,
              tabBackgroundColor: Color.fromARGB(76, 131, 131, 131),
              gap: screenWidth * 0.02,
              padding: EdgeInsets.all(screenWidth * 0.04),
              tabs: [
                GButton(
                  haptic: true,
                  icon: Icons.home,
                  iconActiveColor: buttonColor,
                  text: "Home",
                ),
                GButton(
                    haptic: true,
                    icon: Icons.event_note,
                    iconActiveColor: buttonColor,
                    text: "Event"),
                GButton(
                    haptic: true,
                    icon: Icons.work_history_rounded,
                    iconActiveColor: buttonColor,
                    text: "Placement"),
                GButton(
                    haptic: true,
                    icon: Icons.person,
                    iconActiveColor: buttonColor,
                    text: "Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
