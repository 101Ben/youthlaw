import 'package:flutter/material.dart';
import 'package:youthlaw/HomePage.dart';
import 'package:youthlaw/NavigationBarButton.dart';
import 'package:url_launcher/url_launcher.dart';


class NavigationDrawer extends StatefulWidget{
  @override
  NavigationDrawerState createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: 240.0,
      decoration: BoxDecoration(
          color: Colors.white,
          //boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]
      ),
      child:
      ListView(
        children: <Widget>[
          Container(
            height: 40.0,
            alignment: Alignment.center,
            color: Colors.black,
            child: Text(
              "WELCOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NavigationBarButton('Home',1, MaterialPageRoute(builder: (context) => HomePage())),
              Divider(),
              NavigationBarButton('Information', 2, MaterialPageRoute(builder: (context) => HomePage())),
              Divider(),
              NavigationBarButton('Annual Forum', 3,  MaterialPageRoute(builder: (context) => HomePage())),
              Divider(),
              NavigationBarButton('Founders', 4,  MaterialPageRoute(builder: (context) => HomePage())),
              Divider(),
              NavigationBarButton('Sponsors', 5,  MaterialPageRoute(builder: (context) => HomePage())),
              Divider(),
              NavigationBarButton('Gallery', 6,  MaterialPageRoute(builder: (context) => HomePage())),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: RaisedButton(
                  hoverColor: Colors.amberAccent ,
                  color: Colors.orangeAccent,
                  child: Text(
                    'DONATE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 22
                    ),
                  ),
                  onPressed: _launchURL,
                ),
              ),
              Divider(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
  _launchURL() async {
    const url = 'https://www.facebook.com/youthandlaw/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}