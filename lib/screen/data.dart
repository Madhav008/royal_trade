import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/Authentication/login.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';
import 'package:royaltrade/model/post_model.dart';
import 'package:royaltrade/model/user.dart';
import 'package:royaltrade/screen/posts.dart';
import 'package:royaltrade/services/flutfirebase.dart';

class DataScreen extends StatefulWidget {
  String uid;
  DataScreen({this.uid});
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthBloc>(context, listen: false);
  }

  String title;
  String des;
  DateTime date = DateTime.now();
  String image;

  FireStoreServices firestoreService = new FireStoreServices();
  @override
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                authBloc.signOutUser();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login2()));
              })
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: firestoreService.fetchUser(widget.uid),
            builder: (context, snapshot) {
              Users user = snapshot.data;
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      child: Text(user.name),
                    ),
                    Container(
                      child: Text(user.email),
                    ),
                    Container(
                        // child: Image.network(user.image),
                        ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Title"),
                onChanged: (value) => title = value,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Description"),
                onChanged: (value) => des = value,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Image"),
                onChanged: (value) => image = value,
              ),
            ),
          ),
          RaisedButton(
              onPressed: () {
                var post = Posts(
                  title: title,
                  description: des,
                  img: image,
                );

                firestoreService.addPost(post);
              },
              child: Text("Add")),
          FlatButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PostScreen(),
                  )),
              child: Text("data")),
          AlertDialog(
            title: Text(
              "Error",
            ),
            content: Text("Wrong Password"),
            actions: <Widget>[
              OutlineButton(
                onPressed: () {
                  Navigator.canPop(context);
                },
                child: Text("Ok"),
              ),
            ],
          ),
        ],
      ),
    );
  }

 
}
