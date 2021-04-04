import 'package:doctor_by_final/components/homePageBody.dart';
import 'package:doctor_by_final/components/sideNavDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      drawer: SideNavDrawer(),
      appBar: AppBar(
        title: Text('DocApp'),
      ),
      body: HomePageBody(),
    );
  }



}