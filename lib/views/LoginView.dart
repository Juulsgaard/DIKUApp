import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String _username;
  String _password;
  
  void onLogin() {
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Login"),
              TextFormField(
                onSaved: (val) => _username = val,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextFormField(
                onSaved: (val) => _password = val,
                decoration: InputDecoration(labelText: "Password"),
              ),
              RaisedButton(
                onPressed: onLogin,
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
