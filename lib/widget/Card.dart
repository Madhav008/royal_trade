import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String name;

  CardWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 0,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
          color: Color(0xff232946),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xfff84cac).withOpacity(1),
              // gradient: LinearGradient(
              //   begin: Alignment.bottomLeft,
              //   end: Alignment.bottomCenter,
              //  colors: [Color(0xff39FF14),Color(0xffcc9901)],
              //
              //
              //
              // ),
              // image: DecorationImage(
              //     image: AssetImage(
              //       'images/adx.jpg',
              //     ),
              //     fit: BoxFit.cover),
              borderRadius: BorderRadius.all(
                  Radius.circular(40)
              ),
            ),
            height: 80,
            child: Row(

              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(Icons.euro),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 0),
                //   child: Icon(Icons.ac_unit),
                // ),
                SizedBox(
                  width: 90,
                ),
              ],
            ),
          )),
    );
  }
}
