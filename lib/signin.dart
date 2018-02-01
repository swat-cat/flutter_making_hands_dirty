import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State createState() => new SignInState();
}

class SignInState extends State<SignIn> {
  String _signin = "Sign In";
  String _signup = "Sign up";
  String _alreadyHaveAccount = "Already have account?";
  String _haveNoAccount = "Have no account?";
  SignState signState = SignState.SIGNIN;

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  final TextEditingController _confirmPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(title: new Text(getLabel())),
    body: new Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildEmailTextField(),
          buildPasswordTextField(context),
          signState == SignState.SIGNUP?buildConfirmPassTextField():new Container(),
          confirmButton(),
          messageLabel(),
          toggleSignState()
        ],
      ),
    ),
      );

  Widget buildEmailTextField() => new Container(
    alignment: new Alignment(0.5, 0.5),
    height: 30.0,
    margin: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration:
            new BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
                border: new Border.all(color: Colors.grey)),
        child: new TextField(
          controller: _emailController,
          decoration: new InputDecoration.collapsed(hintText: "Email"),
        ),
      );

  Widget buildPasswordTextField(BuildContext context) => new Container(
        alignment: new Alignment(0.5, 0.5),
        height: 30.0,
        margin: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration:
            new BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
                border: new Border.all(color: Colors.grey)),
        child: new TextField(
          obscureText: true,
          controller: _passController,
          decoration: new InputDecoration.collapsed(hintText: "Password"),
        ),
      );

  Widget buildConfirmPassTextField() => new Container(
    alignment: new Alignment(0.5, 0.5),
    height: 30.0,
    margin: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    decoration:
    new BoxDecoration(
        borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
        border: new Border.all(color: Colors.grey)),
    child: new TextField(
      obscureText: true,
      controller: _confirmPassController,
      decoration: new InputDecoration.collapsed(hintText: "Confirm password"),
    ),
  );

  Widget confirmButton() => new Padding(padding: new EdgeInsets.all(8.0),
      child: new RaisedButton(
      color: new Color(0xff64B5F6),
      onPressed: _confirmPressed,
      child: new Text(
        getLabel(),
        style: new TextStyle(
          color: new Color(0xffffffff)
        ),
      )));

  Widget messageLabel() => new Text(message());

  Widget toggleSignState() => new FlatButton(
      onPressed: _toggleSignState,
      child: new Text(
         getReverseLabel(),
        style: new TextStyle(color: new Color(0xff64B5F6)),
      ));

  void _confirmPressed() {
    
  }

  void _toggleSignState() {
    setState(()=>signState = signState == SignState.SIGNIN?SignState.SIGNUP:SignState.SIGNIN);
  }

  String getLabel(){
    return signState == SignState.SIGNIN?_signin:_signup;
  }

  String getReverseLabel(){
    return signState == SignState.SIGNIN?_signup:_signin;
  }

  String message(){
    return signState == SignState.SIGNIN?_haveNoAccount:_alreadyHaveAccount;
  }
}

enum SignState{
  SIGNIN,SIGNUP
}