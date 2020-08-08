
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class NewsCard extends StatefulWidget{
  NewsCard({this.url, this.message, this.picture});

  final String url;
  final String message;
  final String picture;
  @override
 NewsCardState  createState()  => NewsCardState();
}

class NewsCardState extends State<NewsCard> {
//  var data;
//
//  @override
//  void initState() {
//    FetchPreview().fetch(widget.url).then((res){
//      setState(() {
//        data = res;
//      });
//    });
//    // TODO: implement initState
//    super.initState();
//  }

String url;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FlatButton(
        onPressed: (){
          setState(() {
            url = widget.url ;
          });
           canLaunch(url).then((val ) =>{
             launch(url)
           }).catchError(() => {
           throw 'Could not launch $url'
           });
        },
        child: Card (
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
            child: Row(
              children: <Widget>[
                Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                          //fit: BoxFit.fill,
                          image: new NetworkImage(widget.picture),
                          fit: BoxFit.cover
                        ))),
                Expanded(
                  child: SizedBox(
                    child: ListTile(
                      title: Text(
                        widget.message,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
//                    subtitle: Text("\n" + message,
//                        style: TextStyle(
//                          fontSize: 14,
//                        )),
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