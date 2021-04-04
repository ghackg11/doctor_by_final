import 'package:doctor_by_final/screens/page1.dart';
import 'package:doctor_by_final/screens/page2.dart';
import 'package:doctor_by_final/screens/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../constants.dart';


class HomePageBody extends StatelessWidget {
  final PersistentTabController controller =
  PersistentTabController(initialIndex: 0);

  BuildContext myContext;

  List<Widget> _buildScreens() {
    return [
      Page1(),
      Page2(),
      Page3(myContext)
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.heartbeat),
        title: ("SOS"),
        activeColor: CupertinoColors.destructiveRed,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.medical_services),
        title: ("Nearby"),
        activeColor: CupertinoColors.activeGreen,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.hospitalUser, size: 20,),
        title: ("Me"),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    myContext = context;

    return PersistentTabView(
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),

      confineInSafeArea: true,
      backgroundColor: kColorLightGrey,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
      true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
      true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
