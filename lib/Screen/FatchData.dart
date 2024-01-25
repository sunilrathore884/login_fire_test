import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FatchData extends StatefulWidget {
  const FatchData({super.key});

  @override
  State<FatchData> createState() => _FatchDataState();
}

class _FatchDataState extends State<FatchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FatchData"),
        centerTitle: true,
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Notes").snapshots()
      builder: (context,snapshot){
        if (snapshot.hasData) {
          return ListView.builder(itemBuilder:(context,index){
            return ListTile(
            leading: Text("${index+1}"),
            title: Text("${snapshot.data!.docs[index]["Title"]}"),
    subtitle: Text("${snapshot.data!.docs[index]["Descreption"]}"),
            );

    }, itemCount: snapshot.data!.docs.length, );

        }
        else{
          return Center(child: Text("No Data Found"),);
    }
    },),
    );
  }
}
