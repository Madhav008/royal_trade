import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/Authentication/reset_pass.dart';
import 'package:royaltrade/Authentication/signup.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';
import 'package:royaltrade/screen/data.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  bool passwordVisible = true;

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
              Image(
                image: AssetImage('images/adi.png'),
),
              StreamBuilder<String>(
                  stream: authBloc.email,
                  builder: (context, snapshot) {
                    return TextFormField(
                      style: TextStyle(color: Colors.white),
                      onChanged: authBloc.changeEmail,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.grey[400]),
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
                          fillColor: Colors.white,
                          errorText: snapshot.error,
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.grey[400]),
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
              StreamBuilder<bool>(
                  stream: authBloc.isValid,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return FlatButton(
                        onPressed: () {
                          authBloc.signInEmail(context).then((value) {
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
                              'Log In',
                              style: TextStyle(
                                color: Color(0xff232946),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return FlatButton(
                        onPressed: () {
                          authBloc.signInEmail(context);
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffeebbc3),
                          ),
                          child: Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
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
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PassReset(),
                      ));
                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
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
                        if (user.uid != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DataScreen(
                                  uid: user.uid,
                                ),
                              ));
                        }
                      });
                    },
                    child: Text(
                      'SIGN IN WITH GOOGLE',
                      style: TextStyle(
                        fontSize: 15.0,
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
                    'Dont have an account?',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp2(),
                          ));
                    },
                    child: Text(
                      ' Register',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
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
