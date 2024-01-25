import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_fire_test/Screen/signup.dart';
import 'package:login_fire_test/Uihelper.dart';

import 'HomePage.dart';
class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordContoller=TextEditingController();
  
  signin(String email,String password)async{
    if (email==""&& password=="") {
      return UiHelper.CustomAlertBox(context, "Enter Required Fields");
    }
    else{
      UserCredential ? userCredential;
      try{
          userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
          UiHelper.CustomAlertBox(context,"User Sign IN");
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.CustomAlertBox(context,ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signin Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController,"Enter Email", Icons.mail),
          UiHelper.CustomTextField(passwordContoller,"Enter Password",Icons.password_outlined),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[ ElevatedButton(onPressed: (){
              signin(emailController.text.toString(), passwordContoller.text.toString());
            }, child:Text("Sign IN")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
            }, child:Text("Signup"))


            ],
          ),



        ],
      ),
    );

  }
}
