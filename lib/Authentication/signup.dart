import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/Authentication/login.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';

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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Create New Account',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    StreamBuilder<String>(
                        stream: authBloc.name,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: authBloc.changeName,
                            decoration: InputDecoration(
                              hintText: "Full Name",
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
                        stream: authBloc.username,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: authBloc.changeUsername,
                            decoration: InputDecoration(
                              hintText: "User Name",
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
                    ListTile(
                      leading: Checkbox(
                        onChanged: (value) {
                          setState(() {
                            tick = !tick;
                          });
                        },
                        value: tick,
                      ),
                      title: Text('I Accept the policy and terms'),
                    ),
                    StreamBuilder<bool>(
                        stream: authBloc.isValid,
                        builder: (context, snapshot) {
                          if (snapshot.data == true) {
                            return FlatButton(
                              onPressed: authBloc.signupEmail,
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(250, 128, 178, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN UP',
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
                              onPressed: authBloc.signupEmail,
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(250, 128, 178, 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN UP',
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
                      height: 30,
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
                            'REGISTER WITH GOOGLE',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account?',
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
                                  builder: (context) => Login2(),
                                ));
                          },
                          child: Text(
                            'Sign In',
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
