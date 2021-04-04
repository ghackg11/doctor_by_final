import 'file:///C:/Users/gauta/Desktop/project/doctor_by_final/lib/screens/homePage.dart';
import 'package:doctor_by_final/constants.dart';
import 'package:doctor_by_final/screens/signinOptionsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      title: 'DocApp',
      themeMode: ThemeMode.light,
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: kColorDarkGrey
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Material(
      child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Something Went Wrong'),);
          }
          if(snapshot.connectionState == ConnectionState.done){
            if(FirebaseAuth.instance.currentUser==null){
              return SignInOptionsScreen();
            }
            return HomePage();
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
