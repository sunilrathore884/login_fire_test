import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_fire_test/Screen/ForgetPassword.dart';
import 'package:login_fire_test/Screen/HomePage.dart';
import 'package:login_fire_test/Screen/signin.dart';
import 'package:login_fire_test/Uihelper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signup(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.CustomAlertBox(context, "Enter Your Required Field");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          UiHelper.CustomAlertBox(context, "User created");
          FirebaseFirestore.instance.collection("User").doc(email).set({
            "Email":email,
            "Password":password,
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomAlertBox(context, ex.code.toString());
        //log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signup",
          style: TextStyle(color: Colors.pink),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Enter Email", Icons.mail),
          UiHelper.CustomTextField(
              passwordController, "Enter Password", Icons.password_outlined),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    signup(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Text("Sign UP")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signin()));
                  },
                  child: Text("Sign IN"))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Text("Forgot Password"))
        ],
      ),
    );
  }
}
