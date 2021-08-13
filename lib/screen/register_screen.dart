import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/screen/login_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  String? email;
  String? pass;
  String? confirm_pass;
  String? name;
  String? phone_number;

  bool visibility_state_pass = true;
  bool visibility_state_confirm_pass = true;
  tapRegisterButton() async {
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

      final _auth = FirebaseAuth.instance;
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email!, password: pass!);

      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
        constraints: BoxConstraints.expand(),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Create a new account',
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: new Image.asset('images/rang.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: TextFormField(
                    validator: (val) => val!.trim().length == 0
                        ? 'Please enter your full name!'
                        : null,
                    onChanged: (val) {
                      name = val.trim();
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      labelText: "Full name",
                      prefixIcon: Container(
                          child: new Icon(
                        Icons.account_box,
                        color: Colors.black,
                      )),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    validator: (val) => val!.trim().length == 0
                        ? 'Please enter your email!'
                        : null,
                    onChanged: (val) {
                      email = val.trim();
                    },
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    validator: (val) => val!.trim().length == 0
                        ? 'Please enter your phone number!'
                        : null,
                    onChanged: (val) {
                      phone_number = val.trim();
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      labelText: "Phone number",
                      prefixIcon: Container(
                        child: new Image.asset('images/phonenumber_icon.png'),
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
                          obscureText: visibility_state_pass,
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
                                child: new Image.asset('images/pass_icon.png'),
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
                                    visibility_state_pass == true
                                        ? visibility_state_pass = false
                                        : visibility_state_pass = true;
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        TextFormField(
                          validator: (val) {
                            val!.trim().length < 6
                                ? 'Please enter the correct password!'
                                : null;
                            val.trim() != pass
                                ? 'Please confirm the correct password!'
                                : null;
                          },
                          onChanged: (val) {
                            confirm_pass = val.trim();
                          },
                          obscureText: visibility_state_confirm_pass,
                          cursorColor: Colors.black,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                              hintText: "Confirm your password",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              labelText: "Confirm Password",
                              prefixIcon: Container(
                                width: 50,
                                child: new Image.asset('images/pass_icon.png'),
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
                                    visibility_state_confirm_pass == true
                                        ? visibility_state_confirm_pass = false
                                        : visibility_state_confirm_pass = true;
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
                        onPressed: () => tapRegisterButton(),
                        child: Text(
                          'Sign up',
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
      ),
    );
  }
}
