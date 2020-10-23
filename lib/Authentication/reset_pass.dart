import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';

class PassReset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Reset"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                stream: authBloc.email,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: authBloc.changeEmail,
                    decoration: InputDecoration(
                      hintText: "Reset Email",
                    ),
                  );
                }
              ),
            ),
          ),
          RaisedButton(onPressed: authBloc.resetPassword,child: Text("Reset Password"),)
        ],
      ),
    );
  }
}
