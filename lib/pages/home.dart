import 'package:chatapp/pages/new.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _postController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  addNote(post, em) async{
    Map<String, dynamic> postData = {
      'email': em,
      'post': post
    };
    FirebaseFirestore.instance.collection('Posts').add(postData).whenComplete(() => print("added"));
    // DocumentReference documentReference = FirebaseFirestore.instance.collection('Posts').doc("value");
    // documentReference.set(postData).whenComplete(() => print('posted by $em'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async{
              await FirebaseAuth.instance.signOut().then((value) => Navigator.pop(context));
              // Navigator.pop(context);
            },
            )
        ],
      ),
      body: ListView(
          children: [
            TextField(
              controller: _postController,

            ),
            RaisedButton(
              child: Text("Add"),
              onPressed: () {
                
                final User user = auth.currentUser;
                final userEmail = user.email;
                addNote(_postController.text, userEmail );
              }
            ),
            RaisedButton(
              child: Text("Navigate to new page"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()))
            )

          ],
        ),
      
    );
}
}
