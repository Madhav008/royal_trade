import 'package:flutter/material.dart';
import 'package:royaltrade/widget/Card.dart';

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
              CardWidget( "Forex Signal"),
              CardWidget( "Binary Signal"),
              CardWidget( "VIP Signal"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                            color: Color(0xff1F375D),

                  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Recent News",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width-20,
                        
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/bitcoin.jpg'),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


