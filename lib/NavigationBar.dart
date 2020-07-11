import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:youthlaw/HomePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youthlaw/NavigationBarButton.dart';

class NavigationBar extends StatefulWidget{
  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      color: Colors.white12,
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
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NavigationBarButton('Home',1, MaterialPageRoute(builder: (context) => HomePage()), 0),
              Divider(),
              NavigationBarButton('Information', 2, MaterialPageRoute(builder: (context) => HomePage()), 0),
              Divider(),
              NavigationBarButton('Annual Forum', 3,  MaterialPageRoute(builder: (context) => HomePage()), 0),
              Divider(),
              NavigationBarButton('Founders', 4,  MaterialPageRoute(builder: (context) => HomePage()), 0),
              Divider(),
              NavigationBarButton('Sponsors', 5,  MaterialPageRoute(builder: (context) => HomePage()), 0),
              Divider(),
              NavigationBarButton('Gallery', 6,  MaterialPageRoute(builder: (context) => HomePage()), 0),
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
                  onPressed:  _launchURL,
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

