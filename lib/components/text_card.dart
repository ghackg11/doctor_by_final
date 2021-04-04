import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class TextCard extends StatelessWidget {
  final EdgeInsets margin;
  final Widget child;

  const TextCard({this.margin, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.all(5.0),
      margin: margin,
      decoration: BoxDecoration(
        color: kColorLightGrey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
