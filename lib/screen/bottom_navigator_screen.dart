import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/screen/book_screen.dart';
import 'package:flutter_dental_clinic_app/screen/forgot_pass_screen.dart';
import 'package:flutter_dental_clinic_app/screen/home_screen.dart';
import 'package:flutter_dental_clinic_app/screen/pesonal.dart';
import 'package:flutter_dental_clinic_app/screen/register_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'appointment_schedule_screen.dart';
import 'login_screen.dart';

class Bottom_Navigator extends StatefulWidget {
  const Bottom_Navigator({Key? key}) : super(key: key);

  @override
  _Bottom_NavigatorState createState() => _Bottom_NavigatorState();
}

class _Bottom_NavigatorState extends State<Bottom_Navigator> {
  int current_index = 0;
  final tabs = [Calendar(), Home(),Book(), Personal() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 44),
              height: 120,
              child: Image.asset(
                'images/logo_nhakhoa_icon.png',
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(child: tabs[current_index])
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current_index,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 13,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                  size: 25,
                ),
                label: 'Lịch hẹn'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 25,
                ),
                label: 'Trang Chủ',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_online,
                  color: Colors.black,
                  size: 25,
                ),
                label: 'Đặt lịch',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: Colors.black, size: 25),
              label: 'Cá Nhân',
              backgroundColor: Colors.blue,
            )
          ],
          onTap: (index) {
            setState(() {
              current_index = index;
            });
          }),
    );
  }
}
