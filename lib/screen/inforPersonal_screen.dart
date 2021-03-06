import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/screen/bottom_navigator_screen.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class InforPersonal extends StatefulWidget {
  const InforPersonal({Key? key}) : super(key: key);

  @override
  _InforPersonalState createState() => _InforPersonalState();
}

class _InforPersonalState extends State<InforPersonal> {
  final _formkey = new GlobalKey<FormState>();
  String? name;
  String? birthday;
  String? sex;
  String? address;
  String? phone_number;
  String? email;
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _birthdaycontroller = new TextEditingController();
  TextEditingController _sexcontroller = new TextEditingController();
  TextEditingController _addresscontroller = new TextEditingController();
  TextEditingController _phone_numbercontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();

  tapUpdate() {
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
                'Th??ng tin c?? nh??n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: BuildTextField(
                  'Vui l??ng ??i???n t??n c???a b???n!',
                  _namecontroller,
                  name,
                  '??i???n h??? v?? t??n c???a b???n',
                  'H??? v?? t??n',
                  LineAwesomeIcons.user),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: BuildTextField(
                  'Vui l??ng ??i???n ng??y sinh c???a b???n!',
                  _birthdaycontroller,
                  birthday,
                  '??i???n ng??y sinh c???a b???n',
                  'Ng??y sinh',
                  LineAwesomeIcons.birthday_cake),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: BuildTextField(
                  'Vui l??ng ??i???n gi???i t??nh c???a b???n!',
                  _sexcontroller,
                  sex,
                  '??i???n gi???i t??nh c???a b???n',
                  'Gi???i t??nh',
                  LineAwesomeIcons.transgender),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: BuildTextField(
                  'Vui l??ng ??i???n s??? ??i???n tho???i c???a b???n!',
                  _phone_numbercontroller,
                  phone_number,
                  '??i???n s??? ??i???n tho???i c???a b???n',
                  'S??? ??i???n tho???i',
                  LineAwesomeIcons.mobile_phone),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: BuildTextField(
                  'Vui l??ng ??i???n email c???a b???n!',
                  _emailcontroller,
                  email,
                  '??i???n email c???a b???n',
                  'Email',
                  LineAwesomeIcons.google_plus_square),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
              child: BuildTextField(
                  'Vui l??ng ??i???n ?????a ch??? c???a b???n!',
                  _addresscontroller,
                  address,
                  '??i???n ?????a ch??? c???a b???n',
                  '?????a ch???',
                  LineAwesomeIcons.globe),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.pink]),
                      border: Border.all(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                    onPressed: () => tapUpdate(),
                    child: Text(
                      'C???p nh???t',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }

  TextFormField BuildTextField(
      String vali,
      TextEditingController name_controller,
      String? name,
      String placeholder,
      String lable_text,
      IconData iconData) {
    return TextFormField(
      controller: name_controller,
      validator: (val) => val!.trim().length == 0 ? vali : null,
      onChanged: (val) {
        name = val.trim();
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        fillColor: Colors.black,
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        labelText: lable_text,
        prefixIcon: Container(
            child: new Icon(
          iconData,
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
    );
  }
}
