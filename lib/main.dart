import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's Chat",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
