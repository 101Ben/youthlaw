class Logo{
  String link;
  String text;

  Logo(this.link, this.text);

  Logo.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    text = json['text'];
  }
}