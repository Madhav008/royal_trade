import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:royaltrade/model/user.dart';
import 'package:royaltrade/services/flutfirebase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreServices _firestoreService = FireStoreServices();

  //GET DATA

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get isValid =>
      CombineLatestStream.combine2(email, password, (email, password) => true);
  Stream<String> get name => _name.stream;
  Stream<String> get username => _username.stream;

//SET DATA

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeUsername => _username.sink.add;

  dispose() {
    _email.close();
    _password.close();
    _username.close();
    _name.close();
  }

  //TRANSFORMER

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (regExpEmail.hasMatch(email.trim())) {
      sink.add(email.trim());
    } else {
      sink.addError("Must Be Vaild Email Address");
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password.trim());
    } else {
      sink.addError("6 Character Minimum");
    }
  });

  //Functions

  signupEmail() async {
    print('Signing up with username and password');
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: _email.value.trim(), password: _password.value.trim());
      var user = Users(
          userId: authResult.user.uid,
          email: _email.value.trim(),
          username: _username.value,
          name: _name.value,
          isAdmin: false,
          image: null);
      await _firestoreService.addUser(user);
    } catch (error) {
      print(error);
    }
  }

  signInEmail() async {
    print('Signing up with username and password');
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: _email.value.trim(), password: _password.value.trim());
    } catch (error) {
      print(error);
    }
  }

  resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _email.value.trim());
    } catch (e) {
      print(e);
    }
  }

  Future<bool> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await _auth.signInWithCredential(credential);

      var user = Users(
          userId: result.user.uid,
          name: result.user.displayName,
          username: result.user.displayName,
          email: result.user.email,
          isAdmin: false,
          image: result.user.photoURL);
      await _firestoreService.addUser(user);
    }
  }

  Future<bool> signOutUser() async {
    await FirebaseAuth.instance.signOut();
    await _auth.signOut();
    return Future.value(true);
  }
}
