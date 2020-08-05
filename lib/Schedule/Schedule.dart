class Schedule{
  String id;
  String link;
  String time;
  String duration;
  String location;
  String theme;
  String summary;


  Schedule(this.id, this.link, this.time, this.duration, this.location, this.theme, this.summary);

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    time = json['time'];
    duration = json['duration'];
    location = json['location'];
    theme = json['theme'];
    summary = json['summary'];
  }
}