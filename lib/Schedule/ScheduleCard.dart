import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youthlaw/Schedule/Schedule.dart';

class ScheduleCard extends StatefulWidget{
  ScheduleCard({this.id, this.link, this.time, this.duration, this.location, this.theme, this.summary, this.context});

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

class ScheduleCardState extends State<ScheduleCard>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8)
      ),
      height: 400.0,
      width: 350.0,
      child: FlatButton(
        onPressed: (){
          Scaffold.of(widget.context).openEndDrawer();
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.network(
                      widget.link, fit: BoxFit.cover),
                ),
                SelectableText(
                  widget.time,
                ),
                SelectableText(
                  widget.location,
                ),
                SelectableText(
                  widget.duration,
                ),
                Expanded(
                  child: SizedBox(
                    child: ListTile(
                      title: Text(
                        widget.theme,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),),
                      subtitle: Text(
                          widget.summary,
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
      ),
    );
  }
}
