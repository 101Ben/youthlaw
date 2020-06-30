class PeopleInfo{
  String group;
  String link;
  String name;
  String bio;

  PeopleInfo(this.group, this.link, this.name, this.bio);

  PeopleInfo.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    group = json['group'];
    name = json['name'];
    bio = json['bio'];
  }
}