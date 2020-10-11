import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Royal Trade"),
      ),
      body:Stack(
            children: [
      Positioned(
        top: 10,
        left: 10,
        right: 10,
        child: Card(
              child: Container(
                height: 100,
                child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Binary Signal"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(Icons.access_time), onPressed: null),
                )
            ],
          ),
              )),
      ),
      Positioned(
        top: 120,
        left: 10,
        right: 10,
        child: Card(
            child: Container(
              height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Vip Signal"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(Icons.access_time), onPressed: null),
              )
            ],
          ),
        )),
      ),
      Positioned(
        top: 230,
        left: 10,
        right: 10,
        child: Card(
            child: Container(
              height: 100,
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Forex Signal"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(Icons.access_time), onPressed: null),
              )
          ],
        ),
            )),
      ),
            ],
          ),
    
    );
  }
}
