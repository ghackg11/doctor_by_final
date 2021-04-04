import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';


class SideNavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '${FirebaseAuth.instance.currentUser.displayName}',
                style: TextStyle(color: kColorWhite, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
                color: kColorLightGrey,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: FirebaseAuth.instance.currentUser.photoURL!=null?NetworkImage(FirebaseAuth.instance.currentUser.photoURL): AssetImage(''),
                )),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.heartbeat),
            title: Text('SOS'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.medical_services),
            title: Text('Home Visit'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
