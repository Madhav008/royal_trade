import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                   color: Color.fromRGBO(16, 41, 87, 1),
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
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                   color: Color.fromRGBO(16, 41, 87, 1),
                    child: Container(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                   color: Color.fromRGBO(16, 41, 87, 1),
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
                )),
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
