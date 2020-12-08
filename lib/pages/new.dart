import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {

  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, index){
                          DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                          final User user = auth.currentUser;
                          final userEmail = user.email;
                          if(documentSnapshot['email'] == userEmail ){
                            return Text(documentSnapshot['post']);
                          }else{
                            return null;
                          }
                        }
                      
                    );
                  }else{
                    return null;
                  }
                },
              ),
            
      
    );
  }
}