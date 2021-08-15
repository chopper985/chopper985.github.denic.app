import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/controller/sign_in_google.dart';
import 'package:flutter_dental_clinic_app/screen/forgot_pass_screen.dart';
import 'package:flutter_dental_clinic_app/screen/home_screen.dart';
import 'package:flutter_dental_clinic_app/screen/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'bottom_navigator_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = new GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  String? email;
  String? pass;
  late final _auth = FirebaseAuth.instance;
  bool visibility_state = true;
  bool _isSigningIn = false;

  tapLoginButton() async {
    if (_formkey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        )),
        barrierColor: Colors.grey.shade100,
        barrierDismissible: false,
      );
    }
    UserCredential user = await _auth
        .signInWithEmailAndPassword(email: email!, password: pass!)
        .catchError((e) {
      Fluttertoast.showToast(
          msg: "Email hoặc mật khẩu của bạn không đúng!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    if (user != null) {
      
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Bottom_Navigator()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: new Image.asset(
                        'images/logo_nhakhoa_icon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    'Login to coutinue using App',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: new Image.asset('images/rang.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      validator: (val) => val!.trim().length == 0
                          ? 'Please enter your email!'
                          : null,
                      onChanged: (val) {
                        email = val.trim();
                      },
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        labelText: "Email",
                        prefixIcon: Container(
                          child: new Image.asset('images/email_icon.png'),
                          width: 50,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          TextFormField(
                            validator: (val) => val!.trim().length < 6
                                ? 'Please enter the correct password!'
                                : null,
                            onChanged: (val) {
                              pass = val.trim();
                            },
                            controller: _passController,
                            obscureText: visibility_state,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                                hintText: "Enter your password",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                labelText: "Password",
                                prefixIcon: Container(
                                  width: 50,
                                  child:
                                      new Image.asset('images/pass_icon.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      visibility_state == true
                                          ? visibility_state = false
                                          : visibility_state = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                                )),
                          ),
                        ]),
                  ),
                  Container(
                    constraints:
                        BoxConstraints.loose(Size(double.infinity, 40)),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: InkWell(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ForgotPass())),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () => tapLoginButton(),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: RichText(
                      text: TextSpan(
                          text: "New user?",
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                          children: [
                            TextSpan(
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Register())),
                              text: " Sign up for a new account",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          ]),
                    ),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(" OR "),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(child: Divider(color: Colors.black87)),
                  ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  shape: BoxShape.circle),
                              child: GestureDetector(
                                child: Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                  size: 62,
                                ),
                                onTap: () => print(''),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  shape: BoxShape.circle),
                              child: GestureDetector(
                                  child: Image.asset(
                                    'images/google_icon.png',
                                    fit: BoxFit.contain,
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      _isSigningIn = true;
                                    });
                                    User? user =
                                        await Authentication.signInWithGoogle(
                                            context: context);
                                    setState(() {
                                      _isSigningIn = false;
                                    });
                                    if (user != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Bottom_Navigator(),
                                        ),
                                      );
                                    }
                                    ;
                                  }))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
