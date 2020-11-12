import 'package:flutter/material.dart';
import 'package:royaltrade/widget/drawer.dart';
import 'package:royaltrade/widget/home_widget.dart';

class MyHomePage extends StatefulWidget {
  String uid;

  MyHomePage({this.uid});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff232946),
        drawer: CustomDrawer(widget.uid),
        appBar: AppBar(
          elevation: 8,
          backgroundColor: Color(0xff001535),
          centerTitle: true,
          title: Text(
            "Royal Trade",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: HomeWidget(widget.uid));
  }
}
