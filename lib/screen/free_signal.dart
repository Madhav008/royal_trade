import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/forexvip_id.dart';
import 'package:royaltrade/widget/closed_signal.dart';
import 'package:royaltrade/widget/open_signal.dart';

class FreeSignalScreen extends StatefulWidget {
  @override
  _FreeSignalScreenState createState() => _FreeSignalScreenState();
}

class _FreeSignalScreenState extends State<FreeSignalScreen> {
  @override
  void initState() {
    forexvipId..getId();
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
          title: Text("Free Forex Signals",style: TextStyle(fontWeight: FontWeight.bold),),
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
          children: [OpenSignal(), ClosedSignal()],
        ),
      ),
    );
  }
}




