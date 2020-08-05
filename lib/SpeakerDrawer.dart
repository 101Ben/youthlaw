import 'package:flutter/material.dart';
import 'package:youthlaw/HomeContentDesktop.dart';
import 'package:youthlaw/HomePage.dart';
import 'package:youthlaw/NavigationBarButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youthlaw/PeopleInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class SpeakerDrawer extends StatefulWidget{
  @override
  SpeakerDrawerState createState() => SpeakerDrawerState();
}

class SpeakerDrawerState extends State<SpeakerDrawer> {

  List<PeopleInfo> _people = List<PeopleInfo>();
  Future<List<PeopleInfo>> fetchPeopleInfo() async {
    var url = 'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/peopleBio.json';
    var response = await http.get(url);
    var cards = List<PeopleInfo>();
    if (response.statusCode == 200){
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(PeopleInfo.fromJson(cardJson));
      }
    }
    return cards;
  }

  @override
  void initState(){
    fetchPeopleInfo().then((people){
      setState(() {
        _people.addAll(people);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PeopleInfo> _speakers = List<PeopleInfo>();
    for (var temp in _people) {
      if (temp.group == "speaker20") {
        _speakers.add(temp);
      }
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width / 3.0,
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
              "Speakers Bio",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Divider(),
      Container(
        padding: EdgeInsets.symmetric(
            vertical: 32.0, horizontal: 12.0),
        child: Column(
          children: [
            for (var i = 0; i < _speakers.length; i++)
              leaderCard(_speakers[i].link, _speakers[i].name,
                  _speakers[i].bio),
          ],
        ),
      ),
        ],
      ),
    );
  }
}