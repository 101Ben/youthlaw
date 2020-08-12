import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:youthlaw/HomeInfo.dart';
import 'package:youthlaw/HomePage.dart';
import 'package:youthlaw/Images/Logo.dart';
import 'package:youthlaw/NavigationBar.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:youthlaw/PeopleInfo.dart';
import 'package:youthlaw/PictureInfo.dart';
import 'package:youthlaw/Schedule/Schedule.dart';
import 'package:youthlaw/Schedule/ScheduleCard.dart';
import 'package:youthlaw/fetch_helper/News.dart';
import 'package:youthlaw/fetch_helper/NewsCard.dart';
import 'package:youthlaw/fetch_helper/NewsObject.dart';
import 'package:youthlaw/fetch_helper/fetch_preview.dart';
import 'package:youthlaw/globals.dart' as globals;
import 'package:url_launcher/url_launcher.dart';


class HomeContentDesktop extends StatefulWidget {
  HomeContentDesktop({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeContentDesktopState createState() => HomeContentDesktopState();
}

class HomeContentDesktopState extends State<HomeContentDesktop> {
//  var _dateNow = new DateTime.now();
//  Timer _timer;
//  int day;
//  int hour;
//  int minute;
//  int sec;
//
////  int day = globals.days;
////  int hour = globals.hours;
////  int minute = globals.minutes;
////  int sec = globals.secs;
//
//  void _startTimerDesktop(){
//    var difference = globals.eventDate.difference(_dateNow);
////    globals.days = difference.inDays;
////    globals.hours = difference.inHours % 24;
////    globals.minutes = difference.inMinutes % 60;
////    globals.secs = difference.inSeconds % 60;
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

  Widget PageContent;

  List<MenuInfo> _Menu = List<MenuInfo>();

  Future<List<MenuInfo>> fetchMenuInfo() async {
    var url =
        'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/homeMessage.json';
    var response = await http.get(url);

    var cards = List<MenuInfo>();

    if (response.statusCode == 200) {
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(MenuInfo.fromJson(cardJson));
      }
    }
    return cards;
  }

//

  List<PicInfo> _pictures = List<PicInfo>();

  Future<List<PicInfo>> fetchPicInfo() async {
    var url =
        'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/galleryLink.json';
    var response = await http.get(url);

    var cards = List<PicInfo>();

    if (response.statusCode == 200) {
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(PicInfo.fromJson(cardJson));
      }
    }
    return cards;
  }

  List<PeopleInfo> _people = List<PeopleInfo>();

  Future<List<PeopleInfo>> fetchPeopleInfo() async {
    var url =
        'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/peopleBio.json';
    var response = await http.get(url);
    var cards = List<PeopleInfo>();
    if (response.statusCode == 200) {
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(PeopleInfo.fromJson(cardJson));
      }
    }
    return cards;
  }

  List<Logo> _logo = List<Logo>();
  Future<List<Logo>> fetchLogoInfo() async {
    var url =
        'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/logos.json';
    var response = await http.get(url);
    var cards = List<Logo>();
    if (response.statusCode == 200) {
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(Logo.fromJson(cardJson));
      }
    }
    return cards;
  }


  List<Schedule> _schedule = List<Schedule>();
  Future<List<Schedule>> fetchSchedule() async {
    var url = 'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/Schedules.json';
    var response = await http.get(url);
    var cards = List<Schedule>();
    if (response.statusCode == 200){
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(Schedule.fromJson(cardJson));
      }
    }
    return cards;
  }

  List<News> _newsList = new List<News>();
  Future<List<News>> fetchNewsList() async {
    var url = 'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/NewsLink/NewsInfo.json';
    var response = await http.get(url);
    var cards = List<News>();
    if (response.statusCode == 200) {
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(News.fromJson(cardJson));
      }
    }
    return cards;
  }

//  List<NewsObject> dataList = new List<NewsObject>();
//
//  Future<List<NewsObject>> fetchedNews() async {
////    var temp = await fetchNewsList();
////    var list = new List<NewsObject>();
////    for (News card in temp){
////      FetchPreview().fetch(card.link).then((res) => {
////        list.add(new NewsObject(res, card.link))
////      });
////    }
////    return list;
//    var list = new List<NewsObject>();
//    fetchNewsList().then((res) {
//      List<News> _newsList = new List<News>();
//      _newsList.addAll(res);
//      for (News card in res){
//        FetchPreview().fetch(card.link).then((res) => {
//          list.add(new NewsObject(res, card.link))
//        });
//      }
//    });
//
//    return list;
//
//  }

  @override
  void initState() {
    fetchPeopleInfo().then((people) {
      setState(() {
        _people.addAll(people);
      });
    });
    fetchPicInfo().then((entry) {
      setState(() {
        _pictures.addAll(entry);
      });
    });
    fetchLogoInfo().then((logos) {
      setState(() {
        _logo.addAll(logos);
      });
    });
    fetchSchedule().then((schedule) {
      setState(() {
        _schedule.addAll(schedule);
      });
    });
    fetchNewsList().then((news) {
      setState(() {
        _newsList.addAll(news);
      });
    });
    super.initState();
  }

  void downloadFile(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

  Widget homeLink() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 280.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            //margin: const EdgeInsets.all(12),
            child: Image.network(
              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Judge Charles V. Johnson Youth & Law Forum ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 64,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 12.0),
            child: Text(
              "Upcoming Events",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 32.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(),
          Row(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                margin: const EdgeInsets.all(22),
                child: Image.network(
                  'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/banner.png',
                  fit: BoxFit.fill,
                  width: 400,
                  height: 400,
                  semanticLabel: "2020 Forum",
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  child: SelectableText(
                    globals.homeMessage,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black,
            child: FlatButton(
              hoverColor: Colors.grey,
              //color: Colors.greenAccent,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12)),
              child: Text(
                "Information and Registration here",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                color:Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                setState(() {
                  globals.currentPage = 3;
                  PageContent = forumLink();
                });
              },
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 12.0),
            child: Text(
              "News & Articles",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 32.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
//          dataList.map((val) => {
//            _buildPreviewWidget(dataList[i], _newsList[i].link),
//          })
        Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 6.0),
//            height: 200.0,
//            child: GridView.builder(
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2,
//                  mainAxisSpacing: 12,
//                  crossAxisSpacing: 2
//                ),
//                itemCount: _newsList.length,
//                itemBuilder: (BuildContext context, int index){
//                  return NewsCard( url: _newsList[index].link, picture: _newsList[index].picture,
//                  message: _newsList[index].message);
//                }),
            child: Column(
              children: [
                for (int i = 0; i < _newsList.length; i++)
            NewsCard( url: _newsList[i].link, picture: _newsList[i].picture,
                  message: _newsList[i].message)
              ],
            ),
          ),

          SizedBox(
            height: 200.0,
          ),
          BottomPage(),
        ],
      ),
    );
  }

  Widget infoLink() {
    return Container(
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 240.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            //margin: const EdgeInsets.all(12),
            child: Image.network(
              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
              fit: BoxFit.fill,
            ),
          ),
          header("Information"),
          Divider(),
          Text(
            "What is it",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 128.0),
              child: SelectableText(
                globals.whatIsIt,
                scrollPhysics: BouncingScrollPhysics(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(),
          SelectableText(
            "Objectives",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          SizedBox(
            child: Padding(
              padding:
              EdgeInsets.symmetric(vertical: 32.0, horizontal: 128.0),
              child: SelectableText(
                globals.objectives,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(),
          SelectableText(
            "History",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          SizedBox(
            child: Padding(
              padding:
              EdgeInsets.symmetric(vertical: 32.0, horizontal: 128.0),
              child: SelectableText(
                globals.history,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 300.0,
          ),
          BottomPage(),
        ],
      )),
    );
  }


  Widget forumLink() {
    List<PeopleInfo> _speakers = List<PeopleInfo>();
    for (var temp in _people) {
      if (temp.group == "speaker20") {
        _speakers.add(temp);
      }
    }
    List<String> _banner = List<String>();

    for (var temp in _pictures) {
      if (temp.group == "banner") _banner.add(temp.picLink);
    }

    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              //margin: const EdgeInsets.all(12),
              child: Image.network(
                'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
                fit: BoxFit.fill,
              ),
            ),
            header("The Power of One: In Each of Us a Flame"),
            Divider(),
            Container(
              width: 400,
              padding: EdgeInsets.only(left: 70.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 70,
              //width: 140,
              child: Center(child: countDown()),
            ),
            SizedBox(
              child: SelectableText(
                'Date: September 26, 2020',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  backgroundColor: Colors.white12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                color: Colors.black,
                child: FlatButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12)),
                  child: Text(
                    "Guest Speakers",
                    style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    "Schedule",
                    style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
//                  onPressed: () {
//                    setState(() {
//                      contentImage = Column(
//                        children: <Widget>[
//                          for(var i = 0; i < _schedule.length; i++)
//                            ScheduleCard(duration: _schedule[i].duration,
//                              id: _schedule[i].id, link: _schedule[i].link, location: _schedule[i].location, summary: _schedule[i].summary,
//                              theme: _schedule[i].theme, time: _schedule[i].time,)
////                          Container(
////                            decoration: BoxDecoration(
////                              shape: BoxShape.rectangle,
////                            ),
////                            margin: const EdgeInsets.all(12),
////                            child: Image.network(
////                              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/assetslogo/scheduleOne.png',
////                              fit: BoxFit.fill,
////                            ),
////                          ),
////                          Container(
////                            decoration: BoxDecoration(
////                              shape: BoxShape.rectangle,
////                            ),
////                            margin: const EdgeInsets.all(12),
////                            child: Image.network(
////                              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/assetslogo/scheduleTwo.png',
////                              fit: BoxFit.fill,
////                            ),
////                          ),
//                        ],
//                      );
//                    });
//                    build(context);
//                  },
//                ),
//                FlatButton(
//                  hoverColor: Colors.grey,
//                    color: Colors.greenAccent,
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(12)),
//                  child: Text(
//                    "Register HERE",
//                    style: TextStyle(
//                      fontSize: 20,
//                      decoration: TextDecoration.underline,
//                      color: Colors.orangeAccent,
//                    ),
//                  ),
//                  onPressed: _launchURL,
//                ),
//                FlatButton(
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(12)),
//                  hoverColor: Colors.grey,
//                  child: Text(
//                    "Speaker Bio",
//                    style: TextStyle(
//                      fontSize: 20,
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                  onPressed: () {
//                    setState(() {
//                      contentImage = Container(
//                        padding: EdgeInsets.symmetric(
//                            vertical: 32.0, horizontal: 128.0),
//                        child: Column(
//                          children: [
//                            for (var i = 0; i < _speakers.length; i++)
//                              leaderCard(_speakers[i].link, _speakers[i].name,
//                                  _speakers[i].bio),
//                          ],
//                        ),
//                      );
//                    });
//                    build(context);
//                  },
//                ),
              ],
            ),
            Container(
              child: Column(
                        children: <Widget>[
                          for(var i = 0; i < _schedule.length; i++)
                            ScheduleCard(duration: _schedule[i].duration,
                              id: _schedule[i].id, link: _schedule[i].link, location: _schedule[i].location, summary: _schedule[i].summary,
                              theme: _schedule[i].theme, time: _schedule[i].time, context: context,),
                        ]
              ),
            ),
            Divider(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.0, left: 12.0),
              child: Text(
                "Current and Past Flyers",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 32.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 300.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _banner.length,
                itemBuilder: (context, index){
                  return
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          margin: const EdgeInsets.all(12),
                          child: Image.network(_banner[index], fit:BoxFit.fill),
                        ),
                        RaisedButton(
                          onPressed: (){
//                            downloadFile(_banner[index]);
                              String url = _banner[index];
                            canLaunch(url).then((val ) =>{
                              launch(url)
                            }).catchError(() => {
                              throw 'Could not launch $url'
                            });
                          },
                          child: Text(
                            "View"
                          ),
                        )
                      ],
                    );
                },
              ),
            ),

//            FlatButton(
//              child: Text(
//                'DownLoad Schedule',
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                  fontStyle: FontStyle.italic,
//                  fontSize: 16,
//                  decoration: TextDecoration.underline,
//                ),
//              ),
//              onPressed: () {
//                _launchDownloadSchedule();
//              },
//            ),
            SizedBox(
              height: 200.0,
            ),
            BottomPage(),
          ],
        ),
      ),
    );
  }

  _launchDownloadSchedule() async {
    const url =
        'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/ylf%202020%20schedule.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL() async {
    const url = 'https://forms.gle/n6EQ8fP3L9TtBLN67';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget historyLink() {
    List<PeopleInfo> _leaders = List<PeopleInfo>();
    for (var temp in _people) {
      if (temp.group == "leader") {
        _leaders.add(temp);
      }
    }
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 240.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              //margin: const EdgeInsets.all(12),
              child: Image.network(
                'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
                fit: BoxFit.fill,
              ),
            ),
            header("Founders"),
            Divider(),
            Container(
//              height: 6000.0,
              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 128.0),
              child: Column(
                children: [
                  for (var i = 0; i < _leaders.length; i++)
                    leaderCard(
                        _leaders[i].link, _leaders[i].name, _leaders[i].bio),
                ],
              ),
//              ListView.builder(
//                scrollDirection: Axis.vertical,
//                itemCount: _leaders.length,
//                itemBuilder: (context, index){
//                  return
//                    leaderCard(_leaders[index].link, _leaders[index].name, _leaders[index].bio);
//                },
//              ),
            ),
            SizedBox(
              height: 140.0,
            ),
            BottomPage(),
          ],
        ),
      ),
    );
  }

  Widget sponsorsLink() {
//    List<String> logo = List<String>();
//    for (var temp in _pictures){
//      if (temp.group == "logo") logo.add(temp.picLink);
//    }

    return Container(
      child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 240.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                //margin: const EdgeInsets.all(12),
                child: Image.network(
                  'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
                  fit: BoxFit.fill,
                ),
              ),
              header("Our Sponsors"),
              Divider(),
              for (var i = 0; i < _logo.length; i++)
                Container(
                    child: Column(
                        children:[
                          Container(
                              width: 300.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              margin: const EdgeInsets.all(32),
                              child: Image.network(_logo[i].link, fit: BoxFit.cover)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0),
                            child: SelectableText(_logo[i].text, style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ), textAlign: TextAlign.center,),
                          ),
                        ]
                    )
                ),
          SizedBox(
            height: 100.0,
          ),
          BottomPage(),
        ],
      )),
    );
  }

  Widget galleryLink() {
    List<String> pic2017 = List<String>();
    List<String> picSeaH = List<String>();
    List<String> committee = List<String>();
    List<String> pic2010 = List<String>();
    List<String> pic2014 = List<String>();
    List<String> pic2016 = List<String>();

    for (var temp in _pictures) {
      if (temp.group == "other") pic2016.add(temp.picLink);
      else if (temp.group == "2017") pic2017.add(temp.picLink);
      else if (temp.group == "sea") picSeaH.add(temp.picLink);
      else if (temp.group == "committee") committee.add(temp.picLink);
      else if (temp.group == "2010") pic2010.add(temp.picLink);
      else if (temp.group == "2014") pic2014.add(temp.picLink);
      else if (temp.group == "2016") pic2016.add(temp.picLink);
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 240.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            //margin: const EdgeInsets.all(12),
            child: Image.network(
              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
              fit: BoxFit.fill,
            ),
          ),
          header("Memories and Activities"),
//          Container(
//            height: 100.0,
//            child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: 18,
//              itemBuilder: (context, index){
//                return Container(
//                  width: 100.0,
//                  color: Colors.primaries[index],
//                );
//              },
//            ),
//          ),
          Divider(),
          GalleryRow("Youth and Law Forum - Session of 2017", pic2017),
          GalleryRow("Youth and Law Forum - Seahawks Training Camp in 2017", picSeaH),
          GalleryRow("Youth and Law Forum - Session of 2016 ", pic2016),
          GalleryRow("Youth and Law Forum - Session of 2014 ", pic2014),
          GalleryRow("Youth and Law Forum - Session of 2010 ", pic2010),
          GalleryRow("The Steering Committee at Work ", committee),
          SizedBox(
            height: 300.0,
          ),
          BottomPage(),
        ],
      ),
    );

    List<Container> _buildGridTileList(int count) => List.generate(
        count,
        (i) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              margin: const EdgeInsets.all(12),
              child: Image.network(_pictures[i].picLink),
            ));
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildGridTileList(_pictures.length),
      ),
    );
  }

  Widget GalleryRow(String title, List<String> list){
    return Container(
      height: 250.0,
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index){
                return
                  Container(
                    width: 200.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    margin: const EdgeInsets.all(12),
                    child: Image.network(list[index], fit:BoxFit.fill),
                  );
              },
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget header(String text) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: Center(
                child: Text(
                  "Judge Charles V. Johnson Youth & Law Forum ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 58,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget countDown() {
    int day = globals.days;
    int hour = globals.hours;
    int minute = globals.minutes;
    int sec = globals.secs;
    return Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$day :',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                'days',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ' $hour :',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                'hours',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ' $minute :',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                'minutes',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ' $sec',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                ' seconds',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: NavigationBar(),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.symmetric(horizontal: 8),
//                    child: Center(
//                      child: SelectableText(
//                        "Judge Charles V. Johnson",
//                        style: TextStyle(
//                          fontWeight: FontWeight.w400,
//                          fontStyle: FontStyle.italic,
//                          fontSize: 38,
//                        ),
//                      ),
//                    ),
//                  ),
                  Container(
                    child: globals.currentPage == 1
                        ? homeLink()
                        : (globals.currentPage == 2
                            ? infoLink()
                            : globals.currentPage == 3
                                ? forumLink()
                                : globals.currentPage == 4
                                    ? historyLink()
                                    : globals.currentPage == 5
                                        ? sponsorsLink()
                                        : galleryLink()), //PageContent ,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class leaderCard extends StatelessWidget {
  String link;
  String name;
  String message;

  leaderCard(String lnk, String nm, String msg) {
    link = lnk;
    name = nm;
    message = msg;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
        child: Row(
          children: <Widget>[
            Container(
                width: 120.0,
                height: 120.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      //fit: BoxFit.fill,
                      image: new NetworkImage(link),
                    ))),
            Divider(),
            Expanded(
              child: SizedBox(
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text("\n" + message,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 18.0, left: 40.0, right: 40.0),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contact information\n",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SelectableText(
                'Phone: (206) 257-5572\n',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SelectableText(
                'email: youthandlawforum@gmail.com\n',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SelectableText(
                'Address: MLK FAME Community Center\n3201 E Republican Street\nSeattle, WA 98112\n',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Connect on Social Media",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  margin: const EdgeInsets.all(1.0),
                  child: Image.network(
                      'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/faceIcon.png',
                      fit: BoxFit.fill),
                ),
                onPressed: _launchFaceBookURL,

                /// provide facebook link
              ),
              FlatButton(
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  margin: const EdgeInsets.all(1.0),
                  child: Image.network(
                      'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/twittweIcon.png',
                      fit: BoxFit.fill),
                ),
                onPressed: _launchTweetURL,

                /// provide twitter link
              ),
              FlatButton(
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  margin: const EdgeInsets.all(1.0),
                  child: Image.network(
                      'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/InstaIcon.png',
                      fit: BoxFit.fill),
                ),
                onPressed: _launchInstaURL,

                /// provide instagram link
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(),
              Text(
                "All rights reserved • 2020",
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }

  _launchFaceBookURL() async {
    const url = 'https://www.facebook.com/youthandlaw/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchInstaURL() async {
    const url =
        'https://www.instagram.com/youthlawforum/?igshid=1e7b3awcc459k';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchTweetURL() async {
    const url = 'https://twitter.com/youthlawforum?lang=en';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

/// this is the order of the Number
/// 1 -> Home
/// 2 -> Information
/// 3 -> Annual Forum
/// 4 -> Founders
/// 5 -> Sponsors
/// 6 -> Gallery
