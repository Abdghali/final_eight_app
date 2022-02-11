import 'dart:io';

class Users {
  List<Data>? data;
  Links? links;
  // // Meta? meta;

  Users({this.data, this.links});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  //  meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
   
    return data;
  }
}

class Data {
  String? status;
  User? user;

  Data({this.status, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['data'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? loginName;
  String? fullName;
  String? role;
  String? accountType;
  String? dateWork;
  String? address;
  String? phone;
  String? commission;
  String? password;
  File? image;
  String? purchaseCommission;
  String? card;
  String? accountNumber;
  String? imagePath;
  int? numberDeals;
  String? profitCompany;
  String? profitBroker;
  int? id;

  User(
      {this.loginName,
      this.fullName,
      this.role,
      this.accountType,
      this.dateWork,
      this.address,
      this.phone,
      this.commission,
      this.password,
      this.image,
      this.purchaseCommission,
      this.card,
      this.accountNumber,
      this.imagePath,
      this.numberDeals,
      this.profitCompany,
      this.profitBroker,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    loginName = json['login_name'];
    fullName = json['full_name'];
    role = json['Role'];
    accountType = json['account_type'];
    dateWork = json['date_work'];
    address = json['address'];
    phone = json['phone'];
    commission = json['Commission'];
    purchaseCommission = json['purchase_commission'];
    card = json['card'];
    accountNumber = json['account_number'];
    imagePath = json['image_path'];
    numberDeals = json['number_deals'];
    profitCompany = json['Profit_Company'];
    profitBroker = json['profit_broker'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login_name'] = this.loginName;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['Commission'] = this.commission;
    data['password'] = this.password;
    data['image'] = this.image;
    data['date_work'] = this.dateWork;
    data['address'] = this.address;
    data['card'] = this.card;
    data['account_number'] = this.accountNumber;
    data['purchase_commission'] = this.purchaseCommission;
    data['account_type'] = this.accountType;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}
