import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
                      val.length < 8 ? "Please enter a strong password" : null,
                  onSaved: (val) => _password = val,
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () async {
              _submit();
              try {
                User user = (await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text))
                    .user;
                if (user != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text("Login"),
          ),
          RaisedButton(
            child: Text("Sign up"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
        //   RaisedButton(
        //     child: Text("Stream builder"),
        //     onPressed: (){},
        //   )
        // ],
         

        ]
      )),
    );
  }
}
