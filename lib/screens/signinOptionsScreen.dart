import 'package:doctor_by_final/screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class SignInOptionsScreen extends StatelessWidget{

  static bool err = false;

  Future<String> _signUp(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    if(data.password.length<6) return "Please make a password of length 6 or more";
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: data.name, password: data.password);
    return null;
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return FlutterLogin(
    title: 'DocBy',
    onSubmitAnimationCompleted: () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    },
      onSignup: _signUp,

    );

  }

}