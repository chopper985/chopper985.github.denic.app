import 'package:flutter/material.dart';
import 'package:flutter_dental_clinic_app/widget/appointment_schedule_widget.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: 200,
          padding: EdgeInsets.all(5),
          constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Lịch hẹn',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView(
                children: [
                  AppointmentShedule(),
                  AppointmentShedule(),
                  AppointmentShedule(),
                  AppointmentShedule(),
                  AppointmentShedule(),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
