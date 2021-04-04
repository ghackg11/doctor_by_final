import 'package:doctor_by_final/constants.dart';
import 'package:doctor_by_final/screens/doctorFormScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NonDoctorPage extends StatelessWidget{

  BuildContext parentContext;

  NonDoctorPage(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("https://i.ibb.co/XtPF3VX/pharmacy-Mesa-de-trabajo-1-removebg-preview.png", height: MediaQuery.of(context).size.height/2,),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right: 16.0),
            child: InkWell(
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 10,
                alignment: Alignment.center,
                padding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: kColorOrange,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DoctorForm(parentContext)));
                  },
                  // TODO : Add function to request assistance
                  child: Text(
                    'Are you a doctor?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: MediaQuery
                        .of(context)
                        .size
                        .height / 35),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),),
    );

  }

}