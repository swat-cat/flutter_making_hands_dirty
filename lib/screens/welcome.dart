import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_making_hands_dirty/base/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => new _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:new Center(
            child: new Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: new Image(
                    image: new AssetImage('images/booking.png')))));
  }

  Future<FirebaseUser> checkForUser()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser();
  }

  @override
  void initState() {
    checkForUser().then((user){
      if(user == null){
        Navigator.of(context).pushNamed("/signin");
      }
      else{
        //TODO navigate to main
      }
    });
  }
}
