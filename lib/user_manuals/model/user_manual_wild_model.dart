class UserManualsWildModel {
  List<Data>? data;
  String? message;
  String? error;
  int? status;

  UserManualsWildModel({this.data, this.message, this.error, this.status});

  UserManualsWildModel.fromJson(Map<String, dynamic> json) {
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
  String? createdOn;
  String? updatedOn;
  int? createdBy;
  int? updatedBy;
  int? vers;
  int? id;
  String? title;
  String? category;
  String? pdf;
  String? pdfSize;
  int? displaySequence;
  bool? isActive;
  bool? isDeleted;

  Data(
      {this.createdOn,
        this.updatedOn,
        this.createdBy,
        this.updatedBy,
        this.vers,
        this.id,
        this.title,
        this.category,
        this.pdf,
        this.pdfSize,
        this.displaySequence,
        this.isActive,
        this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    vers = json['vers'];
    id = json['id'];
    title = json['title'];
    category = json['category'];
    pdf = json['pdf'];
    pdfSize = json['pdfSize'];
    displaySequence = json['displaySequence'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['vers'] = this.vers;
    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['pdf'] = this.pdf;
    data['pdfSize'] = this.pdfSize;
    data['displaySequence'] = this.displaySequence;
    data['isActive'] = this.isActive;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}