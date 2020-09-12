import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youthlaw/Schedule/Schedule.dart';

class ScheduleCard extends StatefulWidget {
  ScheduleCard(
      {this.id,
      this.link,
      this.time,
      this.duration,
      this.location,
      this.theme,
      this.summary,
      this.context});

  final String id;
  final String link;
  final String time;
  final String duration;
  final String location;
  final String theme;
  final String summary;
  final BuildContext context;

  ScheduleCardState createState() => ScheduleCardState();
}

class ScheduleCardState extends State<ScheduleCard> {
  bool front = true;

  //child: FlatButton(
  //        onPressed: (){
  //          Scaffold.of(widget.context).openEndDrawer();
  //        },

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24)),
      height: 400.0,
      width: 300.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                margin: const EdgeInsets.all(4.0),
                child: Image.network(widget.link, fit: BoxFit.cover),
              ),
              front ?
              Expanded(
                child: Container(
                  height: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SelectableText(
                        widget.time,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SelectableText(
                        widget.location,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SelectableText(
                        widget.duration,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SelectableText(
                        widget.theme,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.arrow_upward),
                        onPressed:  () {
                          setState(() {
                            front = !front;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ) : Expanded(
                child: Container(
                  height: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.arrow_downward ),
                        onPressed:  () {
                          setState(() {
                            front = !front;
                          });
                        },
                      ),
                      Expanded(
                        child: SizedBox(
                          child: ListTile(
//                            title: SelectableText(
//                              widget.theme,
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                fontSize: 20,
//                                fontWeight: FontWeight.w700,
//                              ),
//                            ),
                            subtitle: SelectableText(widget.summary,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ),
                        ),
                      ),
                    ],
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
