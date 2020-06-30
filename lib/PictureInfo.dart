class PicInfo{
  String group;
  String picLink;

  PicInfo(this.group, this.picLink);

  PicInfo.fromJson(Map<String, dynamic> json) {
    picLink = json['pic'];
    group = json['group'];
  }
}