import 'package:chatapp/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Firebase.initializeApp();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Login page"),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (val) => val.endsWith("@gmail.com")
                      ? null
                      : "Please enter a valid email",
                  onSaved: (val) => _email = val,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val.length < 8 ? "Please enter a valid password" : null,
                  onSaved: (val) => _password = val,
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () async {
              _submit();

              try {
                // Firebase.initializeApp();
                User user = (await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)) as User;
                if (user != null) {
                  print("User created");
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text("Sign up"),
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      )),
    );
  }
}
