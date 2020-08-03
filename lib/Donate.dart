class Donate {
  String link;
  String message;
  String subMessage;

  Donate(this.link, this.message, this.subMessage);

  Donate.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    message = json['message'];
    subMessage = json['subMessage'];
  }
}
