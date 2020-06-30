import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:youthlaw/HomeContentDesktop.dart';
import 'package:youthlaw/HomeContentMobile.dart';
import 'package:youthlaw/NavigationDrawer.dart';
import 'package:youthlaw/globals.dart' as globals;


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Timer _timer;
//  int days;
//  int hours;
//  int minutes;
//  int secs;
  void _startTimer(){
    var difference = globals.eventDate.difference(globals.dateNow);
    globals.days = difference.inDays;
    globals.hours = difference.inHours % 24;
    globals.minutes = difference.inMinutes % 60;
    globals.secs = difference.inSeconds % 60;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (globals.days == 0 && globals.hours == 0 && globals.minutes == 0 && globals.secs == 0){
          _timer.cancel();
        }
        else{
          if(globals.secs > 0)  {
            globals.secs--;
          }
          else if(globals.secs == 0) {
            if(globals.minutes > 0){
              globals.minutes--;
              globals.secs = 59;
            }
            else if(globals.minutes == 0){
              if (globals.hours > 0){
                globals.hours--;
                globals.minutes = 59;
                globals.secs = 59;
              }
              else if (globals.hours == 0){
                if (globals.days > 0){
                  globals.days--;
                  globals.hours = 23;
                  globals.minutes = 59;
                  globals.secs = 59;
                }
                else if(globals.days == 0){
                  _timer.cancel();
                }
              }
            }
          }
        }
      });
    });
  }

  void initState(){
    _startTimer();
    super.initState();
  }


//  var _dateNow = new DateTime.now();
//
//  Timer _timer;
//  int day;
//  int hour;
//  int minute;
//  int sec;
//
//  void _startTimerGlobal(){
//    var difference = globals.eventDate.difference(_dateNow);
//    day = difference.inDays;
//    hour = difference.inHours % 24;
//    minute = difference.inMinutes % 60;
//    sec = difference.inSeconds % 60;
//
//    if (_timer != null) {
//      _timer.cancel();
//    }
//    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//      setState(() {
//        if (day == 0 && hour == 0 && minute == 0 && sec == 0){
//          _timer.cancel();
//        }
//        else{
//          if(sec > 0)  {
//            sec--;
//          }
//          else if(sec == 0) {
//            if(minute > 0){
//              minute--;
//              sec = 59;
//            }
//            else if(minute == 0){
//              if (hour > 0){
//                hour--;
//                minute = 59;
//                sec = 59;
//              }
//              else if (hour == 0){
//                if (day > 0){
//                  day--;
//                  hour = 23;
//                  minute = 59;
//                  sec = 59;
//                }
//                else if(day == 0){
//                  _timer.cancel();
//                }
//              }
//            }
//          }
//        }
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return
      ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
//          drawer: sizingInformation.deviceScreenType ==
//              DeviceScreenType.mobile ? NavigationDrawer() : null,
          drawer: (sizingInformation.deviceScreenType ==
              DeviceScreenType.mobile) || (sizingInformation.deviceScreenType ==
              DeviceScreenType.tablet)  ? NavigationDrawer() : null,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: ScreenTypeLayout(
                  mobile: HomeContentMobile(),
                  desktop: HomeContentDesktop(),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

//
//floatingActionButton: FloatingActionButton(
//  onPressed: _incrementCounter,
//  tooltip: 'Increment',
//  child: Icon(Icons.add),
//)