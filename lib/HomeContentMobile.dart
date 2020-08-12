import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:youthlaw/HomePage.dart';
import 'package:youthlaw/Images/Logo.dart';
import 'package:youthlaw/PeopleInfo.dart';
import 'package:youthlaw/Schedule/Schedule.dart';
import 'package:youthlaw/Schedule/ScheduleCard.dart';
import 'package:youthlaw/fetch_helper/News.dart';
import 'package:youthlaw/fetch_helper/NewsCard.dart';
import 'package:youthlaw/fetch_helper/NewsCardMobile.dart';
import 'package:youthlaw/globals.dart' as globals;
import 'dart:html' as html;
import 'package:youthlaw/HomeInfo.dart';
import 'package:youthlaw/PictureInfo.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class HomeContentMobile extends StatefulWidget {
  HomeContentMobile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeContentMobileState createState() => HomeContentMobileState();
}

class HomeContentMobileState extends State<HomeContentMobile> {

  Widget PageContent;
  List<MenuInfo> _Menu = List<MenuInfo>();
  Future<List<MenuInfo>> fetchMenuInfo() async {
    var url = 'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/homeMessage.json';
    var response = await http.get(url);
    var cards = List<MenuInfo>();
    if (response.statusCode == 200){
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(MenuInfo.fromJson(cardJson));
      }
    }
    return cards;
  }

  List<PicInfo> _pictures = List<PicInfo>();
  Future<List<PicInfo>> fetchPicInfo() async {
    var url = 'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/contentJson/galleryLink.json';
    var response = await http.get(url);

    var cards = List<PicInfo>();

    if (response.statusCode == 200){
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(PicInfo.fromJson(cardJson));
      }
    }
    return cards;
  }

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

  @override
  void initState(){
    fetchPicInfo().then((entry){
      setState(() {
        _pictures.addAll(entry);
      });
    });
    fetchPeopleInfo().then((people){
      setState(() {
        _people.addAll(people);
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

  void downloadFile(String url){
    html.AnchorElement anchorElement =  new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

  Widget homeLink(){
    return Container(
      child: Column(
        children: <Widget> [
          Container(
            width: double.infinity,
            height: 140.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            //margin: const EdgeInsets.all(12),
            child: Image.network(
              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Judge Charles V. Johnson\nYouth & Law Forum",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 28.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Divider(),
          RaisedButton(
            hoverColor: Colors.amberAccent ,
            color: Colors.orangeAccent,
            child: Text(
              'DONATE',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 22
              ),),
//            onPressed:  _launchDonateURL,
          onPressed: (){
            Navigator.pushNamed(context, '/donate');
          },
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 12.0, bottom: 22.0),
            child: Text(
              "Upcoming Events",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 32.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            margin: const EdgeInsets.all(22),
            child: Image.network(
              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/banner.png',
              fit: BoxFit.fill, width: 400, height: 400, semanticLabel: "2020 Forum", ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: SelectableText(
              globals.homeMessage,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Divider(),
          FlatButton(
            hoverColor: Colors.grey,
            //color: Colors.greenAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12)
            ),
            child: Text(
              "Information and Registration here",
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: (){
              setState(() {
                globals.currentPage = 3;
                PageContent = forumLink();
              });
            },
          ),
          Divider(),
          RaisedButton(
            color: Colors.black,
            child: Text(
              'Explore Site',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22
              ),),
            onPressed:  (){
              Scaffold.of(context).openDrawer();
            },
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
            padding: EdgeInsets.symmetric(horizontal: 18.0),
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
                  NewsCardMobile ( url: _newsList[i].link, picture: _newsList[i].picture,
                      message: _newsList[i].message)
              ],
            ),
          ),
          BottomPageMobile(),
        ],
      ),
    );
  }

  Widget infoLink(){
    return Container(
      child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                //margin: const EdgeInsets.all(12),
                child: Image.network(
                  'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
                  fit: BoxFit.fill,),
              ),
              header("Information"),
              Divider(),
              Text(
                "What is it",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                  child: SelectableText(
                    globals.whatIsIt,
                    scrollPhysics: BouncingScrollPhysics(),
                    style: TextStyle(
                        fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(),
              SelectableText(
                "Objectives",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                  child: SelectableText(
                    globals.objectives,
                    style: TextStyle(
                        fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(),
              SelectableText(
                "History",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                  child: SelectableText(
                    globals.history,
                    style: TextStyle(
                        fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 140.0,
              ),
              BottomPageMobile(),
            ],
          )
      ),
    );
  }

//  Widget contentImage = Column(
//    children: <Widget>[
//      Container(
//        decoration: BoxDecoration(
//          shape: BoxShape.rectangle,
//        ),
//        margin: const EdgeInsets.all(12),
//        child: Image.network(
//            'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/assetslogo/scheduleOne.png', fit: BoxFit.fill,),
//      ),
//      Container(
//        decoration: BoxDecoration(
//          shape: BoxShape.rectangle,
//        ),
//        margin: const EdgeInsets.all(12),
//        child: Image.network(
//            'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/assetslogo/scheduleTwo.png',
//        fit: BoxFit.fill),
//      ),
//    ],
//  );

  Widget forumLink(){
    List<PeopleInfo> _speakers = List<PeopleInfo>();
    for(var temp in _people){
      if(temp.group == "speaker20") {
        _speakers.add(temp);
      }
    }
    List<String> _banner = List<String>();

    for (var temp in _pictures) {
      if (temp.group == "banner") _banner.add(temp.picLink);
    }

    double _scale = 1.0;
    double _previousScale = 1.0;
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              //margin: const EdgeInsets.all(12),
              child: Image.network(
                'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
                fit: BoxFit.fill,),
            ),
            header("The Power of One: In Each of Us a Flame"),
            Divider(),
            Center(child: countDown()),
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
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding:EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                color: Colors.black,
                child: FlatButton(

                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12)
                  ),
                  child: Text(
                    "Register HERE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressed: _launchRegisterURL,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Schedule",
                    style: TextStyle(
                        fontSize: 28,
                    ),
                  ),
                ),
//                FlatButton(
//                  hoverColor: Colors.grey,
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(12)
//                  ),
//                  child: Text(
//                    "Schedule",
//                    style: TextStyle(
//                        fontSize: 20,
//                      decoration: TextDecoration.underline
//                    ),
//                  ),
//                  onPressed: (){
//                    setState(() {
//                      contentImage = Column(
//                        children: <Widget>[
////                          GestureDetector(
////                            onScaleStart: (ScaleStartDetails details) {
////                              print(details);
////                              _previousScale = _scale;
////                              setState(() {});
////                            },
////                            onScaleUpdate: (ScaleUpdateDetails details) {
////                              print(details);
////                              _scale = _previousScale * details.scale;
////                              setState(() {});
////                            },
////                            onScaleEnd: (ScaleEndDetails details) {
////                              print(details);
////
////                              _previousScale = 1.0;
////                              setState(() {});
////                            },
////                            child: Container(
////                              decoration: BoxDecoration(
////                                shape: BoxShape.rectangle,
////                              ),
////                              margin: const EdgeInsets.all(12),
////                              child: Transform(
////                                alignment: FractionalOffset.center,
////                                transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
////                                child: Image.network(
////                                    'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/assetslogo/scheduleOne.png'),
////                              ),
////                            ),
////                          ),
//                          Container(
//                            decoration: BoxDecoration(
//                              shape: BoxShape.rectangle,
//                            ),
//                            margin: const EdgeInsets.all(12),
//                            child: Image.network(
//                                'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/assetslogo/scheduleOne.png', fit: BoxFit.fill,),
//                          ),
//                          Container(
//                            decoration: BoxDecoration(
//                              shape: BoxShape.rectangle,
//                            ),
//                            margin: const EdgeInsets.all(12),
//                            child: Image.network(
//                                'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/assetslogo/scheduleTwo.png', fit: BoxFit.fill,),
//                          ),
//                        ],
//                      );
//                    });
//                    build(context);
//                  },
//                ),
//                FlatButton(
//                  hoverColor: Colors.grey,
//                  //color: Colors.greenAccent,
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(12)
//                  ),
//                  child: Text(
//                    "Register HERE",
//                    style: TextStyle(
//                        fontSize: 20,
//                      decoration: TextDecoration.underline,
//                      color: Colors.orangeAccent,
//                    ),
//                  ),
//                  onPressed: _launchRegisterURL,
//                ),
//                FlatButton(
//                  hoverColor: Colors.grey,
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(12)
//                  ),
//                  child: Text(
//                    "Speaker Bio",
//                    style: TextStyle(
//                        fontSize: 20,
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                  onPressed: (){
//                    setState(() {
//                      contentImage = Container(
//                        margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0),
//                        child:
//                        Column(
//                          children: [
//                            for (var i = 0; i < _speakers.length; i++)
//                              leaderCard(_speakers[i].link, _speakers[i].name, _speakers[i].bio),
//                          ],
//                        ),
////                        ListView.builder(
////                          scrollDirection: Axis.vertical,
////                          itemCount: _speakers.length,
////                          itemBuilder: (context, index){
////                            return
////                              leaderCard(_speakers[index].link, _speakers[index].name, _speakers[index].bio);
////                          },
////                        ),
//                      );
//                    });
//                    build(context);
//                  },
//                ),
              ],
            ),
            Divider(),
            Container(
              child: Column(
                  children: <Widget>[
                    for(var i = 0; i < _schedule.length; i++)
                      ScheduleCard(duration: _schedule[i].duration,
                        id: _schedule[i].id, link: _schedule[i].link, location: _schedule[i].location, summary: _schedule[i].summary,
                        theme: _schedule[i].theme, time: _schedule[i].time, context: context,),]
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric (horizontal: 12, vertical: 18.0),
              child: Text(
                "Current and Past Flyers",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _banner.length,
                itemBuilder: (context, index){
                  return
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 200.0,
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
//                  fontSize: 12,
//                  decoration: TextDecoration.underline,
//                ),),
//              onPressed: (){
//                _launchDownloadSchedule();              },
//            ),
            SizedBox(
              height: 140.0,
            ),
            BottomPageMobile(),
          ],
        ),
      ),
    );
  }

  _launchDownloadSchedule() async {
    const url = 'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/ylf%202020%20schedule.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchRegisterURL() async {
    const url = 'https://forms.gle/n6EQ8fP3L9TtBLN67';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchDonateURL() async {
    const url = 'https://www.facebook.com/youthandlaw/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget historyLink(){
    List<PeopleInfo> _leaders = List<PeopleInfo>();
    for(var temp in _people){
      if(temp.group == "leader") {
        _leaders.add(temp);
      }
    }
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              //margin: const EdgeInsets.all(12),
              child: Image.network(
                'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
                fit: BoxFit.fill,),
            ),
            header("Founders"),
            Divider(),
            Container(
//              height: 520.0,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
              child:
              Column(
                children: [
                  for (var i = 0; i < _leaders.length; i++)
                    leaderCard(_leaders[i].link, _leaders[i].name, _leaders[i].bio),
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
            BottomPageMobile(),
          ],
        ),
      ),
    );
  }

  Widget sponsorsLink(){
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
                height: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                //margin: const EdgeInsets.all(12),
                child: Image.network(
                  'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
                  fit: BoxFit.fill,),
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
                              margin: const EdgeInsets.all(12),
                              child: Image.network(_logo[i].link, fit: BoxFit.cover)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: SelectableText(_logo[i].text, textAlign: TextAlign.center, style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),),
                          ),
                        ]
                    )
                ),
//              Container(
//                height: 800.0,
//                color: Colors.grey,
//                margin: EdgeInsets.symmetric(horizontal: 18.0),
//                child: GridView.builder(
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 3,
//                    crossAxisSpacing: 5.0,
//                    mainAxisSpacing: 4.0,
//                    childAspectRatio: 0.9,
//                  ),
//                  itemCount: logo.length,
//                  itemBuilder: (context, index){
//                    return Container(
//                      width: 100.0,
//                      decoration: BoxDecoration(
//                        shape: BoxShape.rectangle,
//                      ),
//                      margin: const EdgeInsets.all(12),
//                      child: Image.network(logo[index], fit:BoxFit.fill),
//                    );
//                  },
//                ),
//              ),
              SizedBox(
                height: 140.0,
              ),
              BottomPageMobile(),
            ],
          )
      ),
    );
  }

  Widget galleryLink(){
    List<String> other = List<String>();
    List<String> pic2017 = List<String>();
    List<String> picSeaH = List<String>();
    List<String> committee = List<String>();
    List<String> pic2010 = List<String>();
    List<String> pic2014 = List<String>();
    List<String> pic2016 = List<String>();

    for (var temp in _pictures){
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
            height: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            //margin: const EdgeInsets.all(12),
            child: Image.network(
              'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/frontx.png',
              fit: BoxFit.fill,),
          ),
          header("Memories and Activities"),
          Divider(),
          GalleryRow("Youth and Law Forum - Session of 2017", pic2017),
          GalleryRow("Youth and Law Forum - Seahawks Training Camp in 2017", picSeaH),
          GalleryRow("Youth and Law Forum - Session of 2016", pic2016),
          GalleryRow("Youth and Law Forum - Session of 2014", pic2014),
          GalleryRow("Youth and Law Forum - Session of 2010", pic2010),
          GalleryRow("The Steering Committee at Work", committee),
          SizedBox(
            height: 140.0,
          ),
          BottomPageMobile(),
        ],
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

  Widget header(String text){
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  "Judge Charles V. Johnson\nYouth & Law Forum ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 24.0),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    fontSize: 22,
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

  Widget countDown(){
    int day = globals.days;
    int hour = globals.hours;
    int minute = globals.minutes;
    int sec = globals.secs;
    return Container(
      height: 60.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
              '$day : $hour : $minute : $sec',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            Text(
              'days\t\thours\t\tminutes\t\tseconds',
              style: TextStyle(
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
//  Widget countDown(){
//    int day = globals.days;
//    int hour = globals.hours;
//    int minute = globals.minutes;
//    int sec = globals.secs;
////    int day = 0;
////    int hour = 0;
////    int minute = 0;
////    int sec = 0;
//    return Container(
//      child: Row(
//        children: [
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              Text(
//                '$day :',
//                style: TextStyle(
//                  fontSize: 34,
//                ),
//              ),
//              Text(
//                'days',
//                style: TextStyle(
//                  fontSize: 9,
//                ),
//              ),
//            ],
//          ),
//          Divider(
//            thickness: 2.0,
//          ),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              Text(
//                ' $hour :',
//                style: TextStyle(
//                  fontSize: 34,
//                ),
//              ),
//              Text(
//                'hours',
//                style: TextStyle(
//                  fontSize: 9,
//                ),
//              ),
//            ],
//          ),
//          Divider(
//            thickness: 2.0,
//          ),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              Text(
//                ' $minute :',
//                style: TextStyle(
//                  fontSize: 34,
//                ),
//              ),
//              Text(
//                'minutes',
//                style: TextStyle(
//                  fontSize: 9,
//                ),
//              ),
//            ],
//          ),
//          Divider(
//            thickness: 2.0,
//          ),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              Text(
//                ' $sec',
//                style: TextStyle(
//                  fontSize: 34,
//                ),
//              ),
//              Text(
//                ' seconds',
//                style: TextStyle(
//                  fontSize: 9,
//                ),
//              ),
//            ],
//          ),
//          Divider(),
//        ],
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    //if (globals.currentPage == 3 )PageContent = forumLink();
//    switch(globals.currentPage){
//      case 1:
//        {
//          PageContent = homeLink();
//        }
//        break;
//      case 2:
//        {
//          PageContent = infoLink();
//        }
//        break;
//      case 3:
//        {
//          PageContent = forumLink();
//        }
//        break;
//      case 4:
//        {
//          PageContent = historyLink();
//        }
//        break;
//      case 5:
//        {
//          PageContent = sponsorsLink();
//        }
//        break;
//      case 6:
//        {
//          PageContent = galleryLink();
//        }
//        break;
//      default:
//        {
//          PageContent = galleryLink();
//        }
//        break;
//    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: SelectableText(
          "Youth and Law Forum",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Colors.black
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.list),
          color: Colors.black,
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child:
            globals.currentPage == 1 ? homeLink() :
            (globals.currentPage == 2 ? infoLink() :
            globals.currentPage == 3 ? forumLink() :
            globals.currentPage == 4 ? historyLink() :
            globals.currentPage == 5 ? sponsorsLink() : galleryLink()),
          ),
        ],
      ),
    );
  }

}

class leaderCard extends StatelessWidget{

  double size = 80.0;
  String link;
  String name;
  String message;
  leaderCard(String lnk, String nm, String msg){
    link = lnk;
    name = nm;
    message = msg;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: message.length <= 20 ? 200.0 : size + message.length/4.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
          child: ListView(
            children: <Widget>[
              Container(
                  width: size,
                  height: size,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        //fit: BoxFit.fill,
                        image: new NetworkImage(link),
                      )
                  ),
              ),
              Divider(),
              SizedBox(
                child: ListTile(
                  title:
                  Text(
                    name,//    cardName + "\n\$ " + price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                      "\n" + message,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomPageMobile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 18.0, left: 40.0, right: 40.0),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Divider(),
          Text(
            "Connect on Social Media",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child:
            Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              margin: const EdgeInsets.all(1.0),
              child: Image.network(
                  'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/faceIcon.png', fit: BoxFit.fill),
            ),
            onPressed: _launchFaceBookURL, /// provide facebook link
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
                  'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/twittweIcon.png', fit: BoxFit.fill),
            ),
            onPressed: _launchTweetURL, /// provide twitter link
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
                  'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/InstaIcon.png', fit: BoxFit.fill),
            ),
            onPressed: _launchInstaURL, /// provide intagram link
          ),
          SizedBox(),
          Text(
            "All rights reserved • 2020" ,
            textAlign: TextAlign.center,
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
    const url = 'https://www.instagram.com/youthlawforum/?igshid=1e7b3awcc459k';
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