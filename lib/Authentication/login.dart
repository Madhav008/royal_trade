import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/Authentication/reset_pass.dart';
import 'package:royaltrade/Authentication/signup.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/backGround2.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/Logo.png'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    StreamBuilder<String>(
                        stream: authBloc.email,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: authBloc.changeEmail,
                            decoration: InputDecoration(
                              errorText: snapshot.error,
                              hintText: "Enter your email",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[300]),
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
                            onChanged: authBloc.changePassword,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                hintText: "Enter your password",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]),
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
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<bool>(
                        stream: authBloc.isValid,
                        builder: (context, snapshot) {
                          if (snapshot.data == true) {
                            return FlatButton(
                              onPressed: () {
                                authBloc.signInEmail();
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(250, 128, 178, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return FlatButton(
                              onPressed: () {
                                authBloc.signInEmail();
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(250, 128, 178, 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN IN',
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
                    SizedBox(
                      height: 10,
                    ),
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
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                            'images/google.png',
                          ),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            authBloc.googleSignIn();
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
                    SizedBox(
                      height: 110,
                    ),
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
                            'Register',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
