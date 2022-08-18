class Hour{
  int? id;
  String? hour;

  Hour({this.id, this.hour});

  Hour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hour = json['hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hour'] = this.hour;
    return data;
  }
}