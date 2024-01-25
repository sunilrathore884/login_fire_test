import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_fire_test/Uihelper.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  forgot(String email)async{
if (email=="") {
  return UiHelper.CustomAlertBox(context,"Enter Email ID");
}
else{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
    UiHelper.CustomAlertBox(context,"We have Sent a Mail To Reset Password");
  });
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          UiHelper.CustomTextField(emailController, "Enter Email ID", Icons.mail),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            forgot(emailController.text.toString());
          }, child: Text("Send OTP"))

        ],
      ),
    );
  }
}
