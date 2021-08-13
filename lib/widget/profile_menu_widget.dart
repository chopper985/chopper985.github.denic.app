import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/screen/login_screen.dart';
import 'package:flutter_dental_clinic_app/screen/text.dart';

class ProfieMenu extends StatefulWidget {
  final IconData iconProfile;
  final String titleProfile;
  final layout;
  const ProfieMenu(
      {Key? key,
      required this.iconProfile,
      required this.titleProfile,
      required this.layout})
      : super(key: key);

  @override
  _ProfieMenuState createState() => _ProfieMenuState();
}

class _ProfieMenuState extends State<ProfieMenu> {
    Future<Login> _signOut() async {
    // final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
        (route) => false);
    return Login();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.titleProfile == 'Đăng xuất'
          ? _signOut()
          : Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget.layout)),
      child: Ink(
        height: 70,
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              widget.iconProfile,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.titleProfile,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined,
                size: 18, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
