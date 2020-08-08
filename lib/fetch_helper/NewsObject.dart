class NewsObject {
  var data;
  String url;

  NewsObject(var d, String s){
    this.data = d;
    this.url = s;
  }

  getData() => this.data;
  getUrl() => this.url;
}