import 'app_theme.dart';
import 'custom_drawer/drawer_user_controller.dart';
import 'custom_drawer/home_drawer.dart';
import 'feedback_screen.dart';
import 'help_screen.dart';
import 'route_info_screen.dart';
import 'hotel_home_screen.dart';
import 'map_screen.dart';
import 'invite_friend_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    VoidCallback onTapMap = () {
      changeIndex(DrawerIndex.Map);
      print('from changeindex');
    };
    drawerIndex = DrawerIndex.HOME;
    screenView = HotelHomeScreen(onTapMap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      VoidCallback onTapMap = () {
        changeIndex(DrawerIndex.Map);
      };
      VoidCallback onTapList = () {
        changeIndex(DrawerIndex.HOME);
      };
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HotelHomeScreen(onTapMap);
        });
      } else if (drawerIndex == DrawerIndex.Map) {
        setState(() {
          screenView = MapScreen(onTapList);
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = RouteInfoScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
