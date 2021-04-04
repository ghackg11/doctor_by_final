import 'package:doctor_by_final/constants.dart';
import 'package:doctor_by_final/screens/MePage.dart';
import 'package:doctor_by_final/screens/NonDoctorPage.dart';
import 'package:doctor_by_final/screens/doctorFormScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page3 extends StatelessWidget{

  BuildContext parentContext;

  Page3(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: meDocId==null?NonDoctorPage(parentContext): MePage()
      child: Center(child: Text("Page3"),),

    );
  }

}