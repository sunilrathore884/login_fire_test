import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_fire_test/Screen/HomePage.dart';
import 'package:login_fire_test/Screen/signin.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return _checkUser();
  }
  _checkUser(){
    if (FirebaseAuth.instance.currentUser != null) {
      return HomePage();
    }
    else{
      return Signin();
    }

  }
}
