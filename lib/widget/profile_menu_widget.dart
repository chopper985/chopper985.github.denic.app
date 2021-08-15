import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/screen/login_screen.dart';
import 'package:flutter_dental_clinic_app/screen/inforPersonal_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final _googleSignIn = new GoogleSignIn();
  bool check = false;

  Future<void> _signOut() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Xác nhận',
          style: TextStyle(color: Colors.black),
        ),
        content: Text('Bạn có thực sự muốn đăng xuất không?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Không'),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await _googleSignIn.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false);
            },
            child: const Text('Có'),
          ),
        ],
      ),
      barrierColor: Colors.grey.shade100,
      barrierDismissible: false,
    );
    // final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
  }

  Future<void> _layoutItem() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => widget.layout));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          widget.titleProfile == 'Đăng xuất' ? _signOut() : _layoutItem(),
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
