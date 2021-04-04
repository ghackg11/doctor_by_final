import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_by_final/datamodels/Doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constants.dart';
import 'NonDoctorPage.dart';

// ignore: must_be_immutable
class MePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MeDoctorPageState();
  }
}

class MeDoctorPageState extends State<MePage> {



  List<String> listOfCategories = ['Cardiac Arrest', 'Trauma/Injury', 'Pregnancy Related', 'Breathing Issue', 'Intoxication'];


  @override
  Widget build(BuildContext mycontext) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("Doctors").doc(meDocId).get(),
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.done && snapshot.hasData){

          List<String> selected = List();
          List<dynamic> onlinedata = snapshot.data['selectedCategories'];
          onlinedata.map((e) => selected.add(e));

            Doctor me = Doctor(
              snapshot.data['name'],
              snapshot.data['phoneNum'],
              snapshot.data['email'],
              snapshot.data['degree'],
              selected,
            );
          return Scaffold(
            body: MaterialApp(
              color: Colors.white,
              theme: ThemeData(
                fontFamily: 'Comfortaa',
                primaryColor: kColorDarkGrey,
                accentColor: kColorOrange,
              ),
              debugShowCheckedModeBanner: false,
              home: Material(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(color: kColorLightGrey),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser.photoURL),
                                          radius: 45.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'DR. ${me.name}',
                                              style: TextStyle(
                                                  fontSize: 15, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text('${me.degree}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("${me.phnNum}"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: FlatButton(child: Text('Available Now', style: TextStyle(fontSize: 20),), onPressed: ()async{
                                    ScaffoldMessenger.of(mycontext).showSnackBar(
                                        SnackBar(content: Text(
                                            'Leaving...')));
                                    FirebaseFirestore.instance.collection("Doctors").doc(me.id).delete();
                                    Navigator.push(mycontext, MaterialPageRoute(builder: (mycontext)=> NonDoctorPage(mycontext)));
                                  },)
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text('Categories Selected:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                    ),

                    Wrap(
                      children: [
                        for (int i = 0; i < listOfCategories.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChip(
                              label: Padding(
                                padding: EdgeInsets.all(me.selectedCategories.contains(listOfCategories[i]) ? 2.0 : 0.0),
                                child: Text(listOfCategories[i]),
                              ),
                              backgroundColor: kColorLightGrey,
                              selectedColor: kColorDarkGrey,
                              labelStyle:
                              TextStyle(color: me.selectedCategories.contains(listOfCategories[i]) ? Colors.white : Colors.black),
                              showCheckmark: true,
                              checkmarkColor: kColorOrange,
                              selected: me.selectedCategories.contains(listOfCategories[i]),
                              onSelected: (bool value) {  },
                            ),
                          ),
                      ],
                    ),

                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top:8),
                        decoration: BoxDecoration(
                            color: kColorDarkestGrey
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child:Container()
                        ),
                      ),
                    ),

                  ],
                ),


              ),
            ),
          );

        }
        return Center(child: Container(child: CircularProgressIndicator(), width: 50, height: 50,));
      },
    );
  }
}
