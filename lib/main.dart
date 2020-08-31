import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
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
