import 'package:app_adove/app/data/models/hour.dart';
import 'package:app_adove/app/data/models/job.dart';
import 'package:app_adove/app/data/models/store.dart';
import 'package:app_adove/app/data/models/user.dart';

class Event {
  int? id;
  String? date;
  Hour? hour;
  User? user;
  Job? job;
  Store? store;

  Event({this.id, this.date, this.hour, this.user, this.job, this.store});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    hour = json['hour'] != null ? new Hour.fromJson(json['hour']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    if (this.hour != null) {
      data['hour'] = this.hour?.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    if (this.job != null) {
      data['job'] = this.job?.toJson();
    }
     if (this.store != null) {
      data['store'] = this.job?.toJson();
    }
    return data;
  }
}
