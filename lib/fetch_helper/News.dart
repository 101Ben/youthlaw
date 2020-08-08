class News {
  String link;
  String message;
  String picture;

  News(this.link, this.message, this.picture);

  News.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    message = json['message'];
    picture = json['picture'];
  }
}
