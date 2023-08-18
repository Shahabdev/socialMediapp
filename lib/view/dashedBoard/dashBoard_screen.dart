
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_media_app/res/colors_screen.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/view/dashedBoard/profile/profile_screen.dart';
import 'package:social_media_app/view_model/services/session_manager.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _controller=PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen()
  {
    return [
      Center(child: InkWell(
        onTap: (){
          final auth=FirebaseAuth.instance;
          auth.signOut();

        },
          child: Icon(Icons.add))),
      Text("chat"),
      Text("add"),
      Text("message"),
     ProfileScreen(),
    ];
  }
  List<PersistentBottomNavBarItem> _navItems()
  {
    return [
      PersistentBottomNavBarItem(icon: Icon(Icons.home),
      activeColorPrimary:AppColors.primaryIconColor,
        inactiveIcon:  Icon(Icons.home,color: Colors.green.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.chat),
          activeColorPrimary:AppColors.primaryIconColor,
          inactiveIcon:  Icon(Icons.chat,color: Colors.green.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.add),
          activeColorPrimary:AppColors.primaryIconColor,
          inactiveIcon:  Icon(Icons.add,color: Colors.green.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.message_outlined),
          activeColorPrimary:AppColors.primaryIconColor,
          inactiveIcon:  Icon(Icons.message_outlined,color: Colors.green.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.person),
          activeColorPrimary:AppColors.primaryIconColor,
          inactiveIcon:  Icon(Icons.person,color: Colors.green.shade100,)
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context, screens:_buildScreen(),
    items: _navItems(),
    controller: _controller,
    backgroundColor: AppColors.otpHintColor,
    decoration: NavBarDecoration(
      borderRadius: BorderRadius.circular(1)
    ),
    navBarStyle: NavBarStyle.style15,
    navBarHeight: 80,);
  }
}
