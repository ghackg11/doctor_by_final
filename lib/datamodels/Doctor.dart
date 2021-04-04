import 'dart:core';

import 'dart:io';

import 'package:uuid/uuid.dart';


class Doctor{

  String name;
  String phnNum;
  String email;
  String degree;
  List<String> selectedCategories;
  String id = Uuid().v1();

  Doctor(this.name, this.phnNum, this.email, this.degree, this.selectedCategories);

}