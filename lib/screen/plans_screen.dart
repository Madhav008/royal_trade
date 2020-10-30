import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0, bottom: 20),
              child: Text(
                'Pricing',
                style: TextStyle(fontSize: 50),
              ),
            ),
            GestureDetector(
              onTap: null,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Small Plan",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$200",
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Weekly ",
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: null,
                          child: Text(
                            "SELECT",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff30E8BF), Color(0xffFF8235)])),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
