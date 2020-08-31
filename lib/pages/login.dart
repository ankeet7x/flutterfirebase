import 'package:flutter/material.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }

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
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (val) => !val.endsWith("@gmail.com")
                      ? "Please enter a valid email"
                      : null,
                  onSaved: (val) => _email = val,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val.length < 8 ? "Please enter a strong password" : null,
                  onSaved: (val) => _password = val,
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: _submit,
            child: Text("Login"),
          ),
          RaisedButton(
            child: Text("Sign up"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          )
        ],
      )),
    );
  }
}
