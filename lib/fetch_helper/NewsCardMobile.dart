
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class NewsCardMobile extends StatefulWidget{
  NewsCardMobile({this.url, this.message, this.picture});

  final String url;
  final String message;
  final String picture;
  @override
  NewsCardMobileState  createState()  => NewsCardMobileState();
}

class NewsCardMobileState extends State<NewsCardMobile> {
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
      height: 220.0,
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
            child: Column(
              children: <Widget>[
                Container(
                    height: 80.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                          //fit: BoxFit.fill,
                            image: new NetworkImage(widget.picture),
                            fit: BoxFit.cover
                        ))),
                Divider(),
                Expanded(
                  child: SizedBox(
                    child: ListTile(
                      title: Text(
                        widget.message,
                        style: TextStyle(
                          fontSize: 12,
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

//_launchThisUrl(String link) async {
//  const url = $link ;
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
//}