import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ssg_demo1/category_screen/category_screen.dart';
import 'package:ssg_demo1/user/account_screen/profile_screen.dart';
import 'package:ssg_demo1/user/cart_screen/cart_screen.dart';
import 'package:ssg_demo1/user/favorite_screen/favorite_screen.dart';
import 'package:ssg_demo1/user/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ssg_demo1/user/order_screen/order_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({final Key? key,})
      : super(key: key);


  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  PersistentTabController _controller=PersistentTabController();
  bool _hideNavBar=false;



  List<Widget> _buildScreens() => [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const OrderScreen(),
    const ProfileScreen(),


  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white54,
        ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.dashboard),
      title: "Category",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white54,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_cart_outlined),
      title: "Cart",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white54,

    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_bag),
      inactiveIcon: const Icon(Icons.shopping_bag_outlined),
      title: "Orders",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white54,

    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: "Profile",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white54,

    ),

  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
    // drawer: Drawer(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: const <Widget>[
    //         Text("This is the Drawer"),
    //       ],
    //     ),
    //   ),
    // ),
    body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      bottomScreenMargin: 0,



      backgroundColor: Colors.red,
      hideNavigationBar: _hideNavBar,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle
          .style1, // Choose the nav bar style with this property
    ),
  );
}