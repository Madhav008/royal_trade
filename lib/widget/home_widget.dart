import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:royaltrade/model/post_model.dart';
import 'package:royaltrade/screen/binary_signal.dart';
import 'package:royaltrade/screen/free_signal.dart';
import 'package:royaltrade/screen/plans_screen.dart';
import 'package:royaltrade/screen/vip_binary_signal.dart';
import 'package:royaltrade/screen/vip_signal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:royaltrade/widget/vipBinaryWidget.dart';

class HomeWidget extends StatelessWidget {
  String uid;
  HomeWidget(this.uid);
  CollectionReference post = FirebaseFirestore.instance.collection('Posts');

  CollectionReference subscription =
      FirebaseFirestore.instance.collection('Subscription');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Column(children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreeSignalScreen(),
                  ));
            },
            child: Card(
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                color: Color(0xff232946),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xfff6d365), Color(0xfffda085)],
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                    ),
                    height: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.euro,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: BorderedText(
                            strokeWidth: 1,
                            child: Text(
                              "Free Forex Signals",
                              style: GoogleFonts.sansita(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                            ),
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
                  ),
                )),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BinarySignal(),
                )),
            child: Card(
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                color: Color(0xff232946),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff2af598), Color(0xff009efd)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    height: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Icon(
                            Icons.attach_money,
                            size: 35,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: BorderedText(
                            strokeWidth: 1,
                            child: Text(
                              "Free Binary Signals",
                              style: GoogleFonts.sansita(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                            ),
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
                  ),
                )),
          ),
          GestureDetector(
            onTap: () async {
              var data = await subscription
                  .where('userId', isEqualTo: uid)
                  .where('end', isGreaterThanOrEqualTo: Timestamp.now())
                  .get();
              print(data.docChanges);

              if (data.docChanges.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VipSignalScreen(),
                    ));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlansScreen(uid),
                    ));
              }
            },
            child: Card(
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                color: Color(0xff232946),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffc471f5), Color(0xfffa71cd)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    height: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.add_business,
                            size: 30,
                            color: Colors.greenAccent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: BorderedText(
                            strokeWidth: 1,
                            child: Text(
                              "Forex VIP",
                              style: GoogleFonts.sansita(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)),
                            ),
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
                  ),
                )),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VipBinarySignalScreen(),)),
            child: Card(
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                color: Color(0xff232946),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff48c6ef), Color(0xff6f86d6)],
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                    ),
                    height: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.add_business,
                            size: 30,
                            color: Colors.yellow,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: BorderedText(
                            strokeWidth: 1,
                            child: Text(
                              "Binary VIP",
                              style: GoogleFonts.sansita(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)),
                            ),
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
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Recent News",
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color(0xff232946),
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/news1.png"),
                        fit: BoxFit.fitWidth)),
                child: StreamBuilder(
                  stream: post.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var post = Posts.fromFirestore(
                              snapshot.data.docs[index].data());
                          DateTime date = post.date.toDate();
                          var _date = DateFormat('yyyy-MM-dd').format(date);
                          return ListTile(
                            title: Text(
                              post.title,
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: Image.network(post.img),
                            subtitle: Text(
                              _date,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                        itemCount: snapshot.data.docs.length,
                      );
                    } else {
                      return Center(child: Text("loading"));
                    }
                  },
                ),
              ),
            ),
          )
        ])
      ]),
    );
  }
}
