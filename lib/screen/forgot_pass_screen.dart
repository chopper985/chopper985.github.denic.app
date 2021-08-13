import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dental_clinic_app/screen/login_screen.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  String? email;
  TextEditingController _emailController = new TextEditingController();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  tapResetPassword() {
    final _auth = FirebaseAuth.instance;
    _auth.sendPasswordResetEmail(email: email!);
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                    child: Text(
                  'Recover forgotten password!',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => tapResetPassword(),
                      child: Text(
                        'Send request',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
