import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/screen/change_password_screen.dart';
import 'package:flutter_dental_clinic_app/screen/login_screen.dart';
import 'package:flutter_dental_clinic_app/screen/inforPersonal_screen.dart';
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
          padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('images/chopper.jpg'),  
              ),
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => InforPersonal())),
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
          layout: InforPersonal(),
        ),
        ProfieMenu(iconProfile: LineAwesomeIcons.gift, titleProfile: 'Rewards',layout: InforPersonal(),),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.history,
            titleProfile: 'Lịch sử khám',layout: InforPersonal(),),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.lock, titleProfile: 'Đổi mật khẩu',layout: ChangePass(),),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.info_circle,
            titleProfile: 'Thông tin hổ trợ khách hàng',layout: InforPersonal(),),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.globe,
            titleProfile: 'Các chi nhánh phòng khám',layout:InforPersonal()),
        ProfieMenu(
            iconProfile: LineAwesomeIcons.sign_out, titleProfile: 'Đăng xuất',layout:Login())
      ],
    );
  }
}
