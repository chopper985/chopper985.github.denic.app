import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final _formkey = new GlobalKey<FormState>();
  String? old_pass;
  String? new_pass;
  String? confim_new_pass;
  final _auth = FirebaseAuth.instance;

  tapChangePass() {
    if (_formkey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.pink),
                ),
              ),
          barrierColor: Colors.grey.shade100,
          barrierDismissible: false);
      User? currentUser = _auth.currentUser; 
      currentUser!.updatePassword(confim_new_pass!);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _formkey,
            child: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                height: 38,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: 60,
                  ),
                  Center(
                    child: Image.asset(
                      'images/logo_nhakhoa_icon.png',
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/chopper.jpg'),
                  radius: 50,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Thay ?????i m???t kh???u',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  validator: (val) =>
                      val!.trim().length < 6 ? 'M???t kh???u c?? kh??ng ????ng!' : null,
                  onChanged: (val) {
                    old_pass = val.trim();
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintText: '??i???n m???t kh???u c??',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    labelText: 'M???t kh???u c??',
                    prefixIcon: Container(
                        child: new Icon(
                      LineAwesomeIcons.lock,
                      color: Colors.black,
                    )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  validator: (val) => val!.trim().length < 6
                      ? 'Vui l??ng ??i???n ????ng m???t kh???u m???i'
                      : null,
                  onChanged: (val) {
                    new_pass = val.trim();
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintText: '??i???n m???t kh???u m???i',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    labelText: 'M???t kh???u m???i',
                    prefixIcon: Container(
                        child: new Icon(
                      LineAwesomeIcons.key,
                      color: Colors.black,
                    )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                child: TextFormField(
                  obscureText: true,
                  validator: (val) => val!.trim() != new_pass
                      ? 'M???t kh???u nh???p l???i kh??c m???t kh???u m???i!'
                      : null,
                  onChanged: (val) {
                    confim_new_pass = val.trim();
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintText: '??i???n l???i m???t kh???u m???i',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    labelText: 'Nh???p l???i m???t kh???u m???i',
                    prefixIcon: Container(
                        child: new Icon(
                      LineAwesomeIcons.key,
                      color: Colors.black,
                    )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.orange]),
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextButton(
                      onPressed: () => tapChangePass(),
                      child: Text(
                        'Thay ?????i',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
              )
            ]))));
  }
}
