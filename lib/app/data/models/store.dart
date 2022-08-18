class Store {
  int? id;
  String? name;
  String? email;
  String? password;
  String? payment;
  String? open;
  bool? active;
  bool? homecare;
  String? firebaseToken;
  String? category;
  String? location;
  String? street;
  String? neighborhood;
  String? number;

  Store(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.payment,
      this.open,
      this.active,
      this.homecare,
      this.firebaseToken,
      this.category,
      this.location,
      this.street,
      this.neighborhood,
      this.number});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    payment = json['payment'];
    open = json['open'];
    active = json['active'];
    homecare = json['homecare'];
    firebaseToken = json['firebaseToken'];
    category = json['category'];
    location = json['location'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['payment'] = this.payment;
    data['open'] = this.open;
    data['active'] = this.active;
    data['homecare'] = this.homecare;
    data['firebaseToken'] = this.firebaseToken;
    data['category'] = this.category;
    data['location'] = this.location;
    data['street'] = this.street;
    data['neighborhood'] = this.neighborhood;
    data['number'] = this.number;
    return data;
  }
}
