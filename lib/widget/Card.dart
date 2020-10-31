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
              image: DecorationImage(
                  image: AssetImage(
                    'images/adx.jpg',
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
            ),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CircleAvatar(
                //     backgroundImage: AssetImage('images/bitcoin.jpg'),
                //     radius: 40,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
