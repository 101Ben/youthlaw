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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: FlatButton(
                  hoverColor: Colors.grey,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12)
                  ),
                  child: Text(
                    "Registration",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed:  _launchURL
                  ,
                ),
              ),
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
                  hoverColor: Colors.lightBlueAccent,
                  color: Colors.lightBlue,
                  child: Text(
                    "Volunteer with us",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 22
                    ),
                  ),
                    onPressed:  _launchVolunteerURL
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: RaisedButton(
                  hoverColor: Colors.orange ,
                  color: Colors.orangeAccent,
                  child: Text(
                    'DONATE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 22
                    ),
                  ),
                onPressed: (){
                  Navigator.pushNamed(context, '/donate');
                },
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
    const url = 'https://docs.google.com/forms/d/e/1FAIpQLSdDE4MKEcAVeQ_mnXONjLqQ6HADItM61NUf5bSUwUZf_8rm0g/viewform?usp=sf_link';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchVolunteerURL() async {
    const url = "https://docs.google.com/forms/d/e/1FAIpQLSd6w4vz_hhyaCci4tnmTZnKauSruYEGEY0BP5elxX6S9Q8nig/viewform?usp=sf_link";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

