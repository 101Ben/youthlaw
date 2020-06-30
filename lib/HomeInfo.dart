class MenuInfo{
  String message;
  String whatisit;
  String history;
  String objectives;

  MenuInfo(this.message,this.whatisit,this.history,this.objectives);

  MenuInfo.fromJson(Map<String, dynamic> json) {
    message = json['homeMessage'];
    whatisit = json['whatIsIt'];
    history = json['history'];
    objectives = json['objectives'];
  }
}