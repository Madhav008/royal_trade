import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/Authentication/login.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';
import 'package:royaltrade/screen/data.dart';

class SignUp2 extends StatefulWidget {
  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  bool passwordVisible = true;
  bool tick = false;
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff232946),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Create New Account',
                  style: GoogleFonts.laila(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    color: Color(0xffb8c1ec),
                  ),
                ),
              ),
           Spacer(),
              StreamBuilder<String>(
                  stream: authBloc.name,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changeName,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffeebbc3)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffFA80B2)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    );
                  }),
             Spacer(),
              StreamBuilder<String>(
                  stream: authBloc.username,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changeUsername,
                      decoration: InputDecoration(
                        hintText: "User Name",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffeebbc3)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffFA80B2)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    );
                  }),
                         Spacer(),

              StreamBuilder<String>(
                  stream: authBloc.email,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changeEmail,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffeebbc3)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffFA80B2)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    );
                  }),
              StreamBuilder<String>(
                  stream: authBloc.password,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changePassword,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          errorText: snapshot.error,
                          hintText: "Enter your password",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 18),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffeebbc3)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFA80B2)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          suffix: IconButton(
                            iconSize: 25,
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          )),
                    );
                  }),
                         Spacer(),

              ListTile(
                leading: Checkbox(
                  checkColor: Colors.white,
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
              StreamBuilder<bool>(
                  stream: authBloc.isValid,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return FlatButton(
                        onPressed: () {
                          authBloc.signupEmail(context).then((value) {
                            if (value.uid != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataScreen(
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
                        Spacer(),

              Row(
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
                      authBloc.googleSignIn().whenComplete(() async {
                        var user = FirebaseAuth.instance.currentUser;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataScreen(
                                uid: user.uid,
                              ),
                            ));
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
                         Spacer(),

              Row(
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
                      Navigator.push(
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
            ],
          ),
        ),
      ),
    );
  }
}
