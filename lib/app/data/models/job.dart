import 'package:app_adove/app/data/models/store.dart';

class Job {
  int? id;
  String? job;
  String? price;
  String? description;
  Store? store;

  Job({this.id, this.job, this.price, this.description, this.store});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    job = json['job'];
    price = json['price'];
    description = json['description'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job'] = this.job;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.store != null) {
      data['store'] = this.store?.toJson();
    }
    return data;
  }
}