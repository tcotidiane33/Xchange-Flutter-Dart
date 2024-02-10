import 'package:flutter/material.dart';
import 'package:flutter_foodybite/screens/add.dart';
import 'package:flutter_foodybite/screens/home.dart';
import 'package:flutter_foodybite/screens/label.dart';
import 'package:flutter_foodybite/screens/profile.dart';

import 'notifications.dart';
class _MainScreenState extends State<MainScreen> {
  PageController _pageController;

  int _page = 0;

  List<IconData> icons = [
    Icons.home,
    Icons.label,
    Icons.add,
    Icons.notifications,
    Icons.person,
  ];

  List<Widget> pages = [
    Home(),
    Label(),
    Add(),
    Notifications(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialisation ici
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(5, (index) => pages[index]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(3),
            buildTabIcon(4),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => navigationTapped(2),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
  Widget buildTabIcon(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          index == 3 ? 30 : 0, 0, index == 1 ? 30 : 0, 0),
      child: IconTheme(
        data: IconThemeData(
          color: _page == index
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).unselectedWidgetColor,
        ),
        child: IconButton(
          icon: Icon(
            icons[index],
            size: 24.0,
          ),
          onPressed: () => navigationTapped(index),
        ),
      ),
    );
  }

}
