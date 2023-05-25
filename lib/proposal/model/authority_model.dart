class AuthorityModel {
  List<Data>? data;
  String? message;
  String? error;
  int? status;

  AuthorityModel({this.data, this.message, this.error, this.status});

  AuthorityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    error = json['error'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['error'] = this.error;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? name;
  dynamic? id;
  String? type;
  dynamic? id1;

  Data({this.name, this.id, this.type, this.id1});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    id1 = json['id1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['id1'] = this.id1;
    return data;
  }
}