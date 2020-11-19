import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/binary_id.dart';
import 'package:royaltrade/widget/VipBInary_clased.dart';
import 'package:royaltrade/widget/vipBinaryWidget.dart';

class VipBinarySignalScreen extends StatefulWidget {
  @override
  _VipBinarySignalScreenState createState() => _VipBinarySignalScreenState();
}

class _VipBinarySignalScreenState extends State<VipBinarySignalScreen> {
  @override
  void initState() {
    binaryId..getId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff232946),
        appBar: AppBar(
          backgroundColor: Color(0xff001535),
          elevation: 8,
          title: Text(
            "VIP Binary Signals",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.grey[100],
            indicatorWeight: 5.0,
            isScrollable: false,
            tabs: [
              Container(
                child: Tab(
                  child: Text(
                    "Open Signals",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: Tab(
                  child: Text(
                    "Closed Signal",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [VipBinarySignalWidget(), VipBinaryClosedSignal()],
        ),
      ),
    );
  }
}
