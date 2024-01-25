import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_fire_test/Screen/signin.dart';
import '../Uihelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
TextEditingController titleController= TextEditingController();
TextEditingController descController= TextEditingController();

addData(String title,String Desc)async{
  if (title=="" && Desc=="") {
    return UiHelper.CustomAlertBox(context,"Enter Required Fields");
  }
  else{
    FirebaseFirestore.instance.collection("Notes").doc(title).set({
      "Title": title,
      "Descreption":Desc,
    }).then((value){
      UiHelper.CustomAlertBox( context,"Data Upload");
    });
  }
  
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            _logout(context);
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController,"Enter Title", Icons.title),
          UiHelper.CustomTextField(descController,"Enter Descreption", Icons.description_outlined),

          SizedBox(height: 20,),
          ElevatedButton(onPressed:(){
            addData(titleController.text.toString(),descController.text.toString());
          }, child: Text("Save Data"))

        ],
      ),
    );
  }
  _logout(BuildContext context)async{
    await
    FirebaseAuth.instance.signOut().then((value){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Signin()));

      //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Signin()));
    });
  }
}


