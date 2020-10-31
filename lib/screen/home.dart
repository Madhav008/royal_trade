import 'package:flutter/material.dart';
import 'package:royaltrade/Authentication/login.dart';
import 'package:royaltrade/Authentication/signup.dart';
import 'package:royaltrade/screen/admin_screen.dart';
import 'package:royaltrade/widget/home_widget.dart';

class MyHomePage extends StatefulWidget {
  String uid;

  MyHomePage({this.uid});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001535).withOpacity(0.5),
      drawer: Container(),
      appBar: AppBar(
        backgroundColor: Color(0xff001535),
        centerTitle: true,
        title: Text("Royal Trade"),
      ),
      body: PageView(
        children: [HomeWidget(widget.uid), AdminScreen(), SignUp2()],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        backgroundColor: Color(0xff3fb2eb),
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: "Profile"),
        ],
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
