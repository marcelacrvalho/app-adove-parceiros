class Publication {
  int? id;
  String? title;
  String? text;
  String? date;
  String? image;

  Publication({this.id, this.title, this.text, this.date, this.image});

  Publication.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['text'] = this.text;
    data['date'] = this.date;
    data['image'] = this.image;
    return data;
  }
}
