import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthlaw/Donate.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonationPage extends StatefulWidget{

  DonationPageState createState() => DonationPageState();
}

class DonationPageState extends State<DonationPage>{

  List<Donate> _donate = List<Donate>();
  Future<List<Donate>> fetchDonation() async {
    var url = 'https://raw.githubusercontent.com/YouthandLaw/YLFContent/master/donation/Donate.json';
    var response = await http.get(url);
    var cards = List<Donate>();
    if (response.statusCode == 200){
      var cardsJson = json.decode(response.body);
      for (var cardJson in cardsJson) {
        cards.add(Donate.fromJson(cardJson));
      }
    }
    return cards;
  }

  @override
  void initState() {
    fetchDonation().then((donate) {
      setState(() {
        _donate.addAll(donate);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ways to Donate"),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              for (var i = 0; i < _donate.length; i++)
                Donatecard(_donate[i].link, _donate[i].message, _donate[i].subMessage)
            ],
          ),
        ) ,
      ),
    );
  }
}

class Donatecard extends StatelessWidget{
   String logoLink;
   String message;
   String subMessage;

   Donatecard(String link, String mes, String sub){
     this.logoLink = link;
     this.message = mes;
     this.subMessage = sub;
   }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build1
    return SizedBox(
      height: 200.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                margin: const EdgeInsets.all(1.0),
                child: Image.network(
                    this.logoLink, fit: BoxFit.cover),
              ),
//              Container(
//                  width: 80.0,
//                  height: 80.0,
//                  decoration: new BoxDecoration(
//                      shape: BoxShape.circle,
//                      image: new DecorationImage(
//                        //fit: BoxFit.fill,
//                          image: new NetworkImage(this.logoLink)  // "/Users/benajasandrain/FlavrFood/assets/userPic.png"
//                      )
//                  )
//              ),

              Expanded(
                child: SizedBox(
                  child: ListTile(
                    title: Text(
                      this.message ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),),
                    subtitle: Text(
                        this.subMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        )
                    ),
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