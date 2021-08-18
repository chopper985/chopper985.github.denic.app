import 'package:flutter/material.dart';

class AppointmentShedule extends StatefulWidget {
  const AppointmentShedule({Key? key}) : super(key: key);

  @override
  _AppointmentSheduleState createState() => _AppointmentSheduleState();
}

class _AppointmentSheduleState extends State<AppointmentShedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'images/bell.png',
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Nhắc nhở!',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink)),
                  onPressed: () => print(''),
                  child: Text(
                    'HỦY',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              'Bạn có lịch hẹn',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Thời gian: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '11:00',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                'Ngày: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '3/6/2021',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(height: 16,),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Phòng khám: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: '206 Ấp bình tả 2 xã đức ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal )),
          ])),
          SizedBox(height: 25,),
          Divider(height: 2,color: Colors.black,)
        ],
      ),
    );
  }
}
