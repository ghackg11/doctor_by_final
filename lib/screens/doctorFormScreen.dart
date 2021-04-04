



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_by_final/datamodels/Doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:input_sheet/components/IpsCard.dart';
import 'package:input_sheet/components/IpsIcon.dart';
import 'package:input_sheet/components/IpsLabel.dart';
import 'package:input_sheet/components/IpsPhoto.dart';
import 'package:input_sheet/components/IpsValue.dart';
import 'package:input_sheet/input_sheet.dart';
import 'package:input_sheet/inputs/IpsInputMultioptions.dart';


import '../constants.dart';
import 'MePage.dart';



class DoctorForm extends StatefulWidget{

  BuildContext parentContext;

  DoctorForm(this.parentContext);

  @override
  State<StatefulWidget> createState() {
    return DoctorFormState(parentContext);
  }

}

class DoctorFormState extends State<DoctorForm>{

  String _name = FirebaseAuth.instance.currentUser.displayName;
  String _phnNum;
  String _degree;
  String _email = FirebaseAuth.instance.currentUser.email;
  List<String> _selectedCategories = List();
  String _valueOfCat;
  BuildContext parentContext;

  


  DoctorFormState(this.parentContext);




  @override
  Widget build(BuildContext context) {


    _valueOfCat = "";
    for(int i=0;i<_selectedCategories.length-1;i++) {
      _valueOfCat+=_selectedCategories[i]+", ";
    }
    if(_selectedCategories.length>0)
    _valueOfCat+=_selectedCategories[_selectedCategories.length-1];

    return Material(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          //Your component to show data


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IpsCard(
              label: IpsLabel("Name"),
              value: IpsValue(_name ?? "Touch to edit..."),
              icon: IpsIcon(Icons.person),
              onClick: () {
                InputSheet(
                  //InputSheet implements the scope information of sheet
                  parentContext,
                  label: "Name",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).text(
                  //.text or any other option available type implemets the input type
                  placeholder: "Type here...",
                  textInputType: TextInputType.name,
                  value: _name,
                  onDone: (dynamic value) => setState(() {
                    _name = value;
                  }),
                );
              },
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IpsCard(
                  label: IpsLabel("Contact Number"),
                  value: IpsValue(_phnNum?? "Touch to edit..."),
                  icon: IpsIcon(Icons.phone),
                  error: _phnNum!=null && _phnNum.length!=10?Text('Please enter correct Phone Number', style: TextStyle(color: Colors.redAccent)): null,
                  onClick: () {
                    InputSheet(
                      //InputSheet implements the scope information of sheet
                      parentContext,
                      label: "Contact Number",
                      cancelText: "Cancel",
                      doneText: "Confirm",
                    ).text(
                      //.text or any other option available type implemets the input type
                      placeholder: "Type here...",
                      textInputType: TextInputType.phone,
                      value: _phnNum,
                      onDone: (dynamic value) => setState(() {
                        _phnNum = value;
                      }),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IpsCard(
                  label: IpsLabel("Highest Degree"),
                  value: IpsValue(_degree?? "Touch to edit..."),
                  icon: IpsIcon(Icons.book),
                  onClick: () {
                    InputSheet(
                      //InputSheet implements the scope information of sheet
                      parentContext,
                      label: "Highest Degree",
                      cancelText: "Cancel",
                      doneText: "Confirm",
                    ).text(
                      //.text or any other option available type implemets the input type
                      placeholder: "Type here...",
                      textInputType: TextInputType.name,
                      value: _degree,
                      onDone: (dynamic value) => setState(() {
                        _degree = value;
                      }),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IpsCard(
                  label: IpsLabel("Email"),
                  value: IpsValue(_email?? "Touch to edit..."),
                  icon: IpsIcon(Icons.email),
                  onClick: () {
                    InputSheet(
                      //InputSheet implements the scope information of sheet
                      parentContext,
                      label: "Email",
                      cancelText: "Cancel",
                      doneText: "Confirm",
                    ).text(
                      //.text or any other option available type implemets the input type
                      placeholder: "Type here...",
                      textInputType: TextInputType.emailAddress,
                      value: _email,
                      onDone: (dynamic value) => setState(() {
                        _email = value;
                      }),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IpsCard(
                    label: IpsLabel("Categories"),
                    value: IpsValue(_valueOfCat),
                    icon: IpsIcon(Icons.medical_services),
                    onClick: (){
                      InputSheet(context).multioptions(
                        options: { 'Cardiac Arrest':'Cardiac Arrest' ,'Trauma/Injury':'Trauma/Injury', 'Pregnancy Related':'Pregnancy Related', 'Breathing Issue': 'Breathing Issue', 'Intoxication': 'Intoxication'},
                        value: _selectedCategories,
                        onDone: (List<String> value) => setState(() {
                          _selectedCategories = value;
                        }),
                      );
                    }
                ),
              ),

              InkWell(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 12,
                  width: 200,
                  alignment: Alignment.center,
                  padding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: kColorOrange,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: InkWell(
                    child: Material(
                      color: Colors.transparent,
                      child: FlatButton(

                        onPressed: () {

                          if(_name!=null && _name.length!=0 && _phnNum!=null && _phnNum.length!=0 && _email!=null && _email.length!=0 && _degree!=null && _degree.length!=0 && _selectedCategories.length!=0){

                            Doctor d = Doctor(_name, _phnNum, _email, _degree, _selectedCategories);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(
                                      'Processing...')));
                              FirebaseFirestore instance = FirebaseFirestore
                                  .instance;
                              Future doc = instance
                                  .collection("Doctors").doc(d.id).set(
                                  {
                                    "id": d.id,
                                    "name": d.name,
                                    "phoneNum": d.phnNum,
                                    "email": d.email,
                                    "degree": d.degree,
                                    "selectedCategories": d.selectedCategories,
                                  }
                              );

                              doc.then((value) =>
                              {
                                meDocId = d.id,
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(
                                        'Details Saved Succesfully'))),
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MePage())),

                              });

                          }

                        },
                        // TODO : Add function to request assistance
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 40),
                        ),

                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }


}