// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:apicalling_demo/Home_Navigation/Products.dart';
import 'package:apicalling_demo/Home_Navigation/Search.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'Home_Navigation/Cart.dart';
import 'Home_Navigation/Home_pg.dart';

class bottom_navi_controller extends StatefulWidget {
  const bottom_navi_controller({Key? key}) : super(key: key);

  @override
  State<bottom_navi_controller> createState() => _bottom_navi_controllerState();
}

class _bottom_navi_controllerState extends State<bottom_navi_controller> {

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: pageController,
        children: <Widget>[
          Home_pg(),Products(),Search(),Cart()
        ],
      ),
      extendBody: true,
      backgroundColor:Colors.blueGrey.shade200,
      bottomNavigationBar: SizedBox(
        height:80,
        child: RollingBottomBar(
          controller: pageController,
          flat: true,
          color:Colors.black87,
          useActiveColorByDefault: false,
          items: const [
            RollingBottomBarItem(Icons.home, label: '',activeColor:Colors.green),
            RollingBottomBarItem(Icons.grid_view, label: '',activeColor:Colors.white),
            RollingBottomBarItem(Icons.search_rounded, label: '',activeColor:Colors.white),
            RollingBottomBarItem(Icons.add_shopping_cart,label: '',activeColor:Colors.white),
          ],
          enableIconRotation: true,itemColor:Colors.white,
          onTap: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds:400),
              curve: Curves.ease,
            );
          },
        ),
      ),
    );
  }
}
