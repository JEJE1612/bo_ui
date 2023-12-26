import 'package:booking/pages/favouratepage.dart';
import 'package:booking/pages/home_page.dart';
import 'package:booking/pages/my_book_page.dart';
import 'package:booking/pages/storepage.dart';
import 'package:booking/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../json/root_app_json.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      body: getBody(),
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: List.generate(rootAppJson.length, (index) {
          return SalomonBottomBarItem(
              selectedColor: rootAppJson[index]['color'],
              icon: Icon(rootAppJson[index]['icon']),
              title: Text(rootAppJson[index]['text']));
        }));
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
       MyBookPage(),
       StorePage(),    
        FavouritePage()
      ],
    );
  }
}
