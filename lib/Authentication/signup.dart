import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/Authentication/login.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';
import 'package:royaltrade/screen/home.dart';

class SignUp2 extends StatefulWidget {
  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  bool passwordVisible = true;
  bool tick = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff232946),
        body: ListView(
          children: <Widget>[
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Create New Account',
                    style: GoogleFonts.laila(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      color: Color(0xffb8c1ec),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 10),
              child: StreamBuilder<String>(
                  stream: authBloc.name,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changeName,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: "Full Name",
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffeebbc3)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA80B2)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 10),
              child: StreamBuilder<String>(
                  stream: authBloc.username,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changeUsername,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: "User Name",
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffeebbc3)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA80B2)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 5),
              child: StreamBuilder<String>(
                  stream: authBloc.email,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changeEmail,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        errorText: snapshot.error,
                        hintText: "Enter your email",
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffeebbc3)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA80B2)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 0.0, left: 10, right: 10, bottom: 10),
              child: StreamBuilder<String>(
                  stream: authBloc.password,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changePassword,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        errorText: snapshot.error,
                        hintText: "Enter your password",
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffeebbc3)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA80B2)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xffFA80B2)),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Checkbox(
                  activeColor: Color(0xffeebbc3),
                  focusColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      tick = !tick;
                    });
                  },
                  value: tick,
                ),
                title: Text(
                  'I Accept the policy and terms',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 20),
              child: StreamBuilder<bool>(
                  stream: authBloc.isValid,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return FlatButton(
                        onPressed: () {
                          authBloc.signupEmail(context).then((value) {
                            if (value.uid != null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                      uid: value.uid,
                                    ),
                                  ));
                            }
                          });
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffeebbc3),
                          ),
                          child: Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return FlatButton(
                        onPressed: () => authBloc.signupEmail(context),
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffeebbc3),
                          ),
                          child: Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      'images/google.png',
                    ),
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLoading = true;
                      });
                      authBloc.googleSignIn().whenComplete(() async {
                        var user = FirebaseAuth.instance.currentUser;
                        if (user.uid != null) {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                      uid: user.uid,
                                    ),
                              ));
                        }
                      });
                    },
                    child: Text(
                      'REGISTER WITH GOOGLE',
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.green,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login2(),
                          ));
                    },
                    child: Text(
                      ' Sign In',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
