import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/screen/login_screen.dart';
import 'package:flutter_dental_clinic_app/screen/text.dart';
import 'package:flutter_dental_clinic_app/widget/profile_menu_widget.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class Personal extends StatefulWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.fromLTRB(24, 20, 8, 8),
          child: Row(
            children: [
              Container(
                  height: 61,
                  child: Image.asset(
                    'images/avatar_dental_icon.png',
                    width: 50,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Times New Roman"),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () => print('AA'),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Chỉnh sửa tài khoản   ',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      WidgetSpan(
                          child: Icon(Icons.arrow_forward_ios,
                              size: 15, color: Colors.black))
                    ])),
                  ),
                ],
              ))
            ],
          ),
        ),
        ProfieMenu(
          iconProfile: LineAwesomeIcons.user,
          titleProfile: 'Thông tin tài khoản',
          layout: Test,
        ),
        ProfieMenu(iconProfile: LineAwesomeIcons.gift, titleProfile: 'Rewards',layout: Test,),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.history,
            titleProfile: 'Lịch sử khám',layout: Test,),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.lock, titleProfile: 'Đổi mật khẩu',layout: Test,),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.info_circle,
            titleProfile: 'Thông tin hổ trợ khách hàng',layout: Test,),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.globe,
            titleProfile: 'Các chi nhánh phòng khám',layout:Test),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.sign_out, titleProfile: 'Đăng xuất',layout:Login)
      ],
    );
  }
}
