import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:provider/provider.dart';
import 'package:royaltrade/bloc/auth_bloc.dart';
import 'package:royaltrade/bloc/signal_Id_bloc.dart';
import 'package:royaltrade/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authBloc = AuthBloc();
  final signalId = SignalIdBloc();

  @override
  void dispose() {
    authBloc.dispose();
    signalId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
          providers: [
            Provider(
              create: (context) => authBloc,
            ),
            Provider(create: (context) => signalId,)
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Color.fromRGBO(149, 76, 233, 1),
                primaryColorDark: Color.fromRGBO(149, 76, 233, 1),
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home:
                  MyHomePage() /* StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DataScreen(
                    uid: FirebaseAuth.instance.currentUser.uid,
                  );
                } else {
                  return Login2();
                }
              }, */
              )),
    );
  }
}
