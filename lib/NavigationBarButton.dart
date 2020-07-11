import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:youthlaw/globals.dart' as globals;

class NavigationBarButton extends StatefulWidget{
  String txt;
  Route route;
  int pageNum;
  int isMobile;
  NavigationBarButton(String t, int num, Route r, int mobile){
    txt = t;
    route = r;
    pageNum = num;
    isMobile = mobile;
  }
  @override
  NavigationBarButtonState createState() => NavigationBarButtonState(txt, pageNum, route, isMobile);
}

class NavigationBarButtonState extends State<NavigationBarButton> {
  String txt;
  Route route;
  int pageNum;
  int isMobile;
  NavigationBarButtonState(String t, int num, Route r, int mobile) {
    txt = t;
    route = r;
    pageNum = num;
    isMobile = mobile;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: FlatButton(
        hoverColor: Colors.grey,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12)
        ),
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            //decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          setState(() {
            globals.currentPage = pageNum;
            if (isMobile == 1) Navigator.of(context).pop();
          });
          //Navigator.push(context, route);
        },
      ),
    );
  }
}