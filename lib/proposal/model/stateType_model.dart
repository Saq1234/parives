class StateTypeModel {
  List<Data>? data;
  String? message;
  String? error;
  int? status;

  StateTypeModel({this.data, this.message, this.error, this.status});

  StateTypeModel.fromJson(Map<String, dynamic> json) {
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
  Null? vers;
  int? id;
  int? code;
  int? version;
  String? name;
  String? stateAbbr;
  String? censusCode2001;
  String? censusCode2011;
  String? stateUtFlag;
  Null? processEnable;
  bool? isActive;
  bool? isDeleted;

  Data(
      {this.createdOn,
        this.updatedOn,
        this.createdBy,
        this.updatedBy,
        this.vers,
        this.id,
        this.code,
        this.version,
        this.name,
        this.stateAbbr,
        this.censusCode2001,
        this.censusCode2011,
        this.stateUtFlag,
        this.processEnable,
        this.isActive,
        this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    vers = json['vers'];
    id = json['id'];
    code = json['code'];
    version = json['version'];
    name = json['name'];
    stateAbbr = json['state_abbr'];
    censusCode2001 = json['census_code_2001'];
    censusCode2011 = json['census_code_2011'];
    stateUtFlag = json['state_ut_flag'];
    processEnable = json['process_enable'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['vers'] = this.vers;
    data['id'] = this.id;
    data['code'] = this.code;
    data['version'] = this.version;
    data['name'] = this.name;
    data['state_abbr'] = this.stateAbbr;
    data['census_code_2001'] = this.censusCode2001;
    data['census_code_2011'] = this.censusCode2011;
    data['state_ut_flag'] = this.stateUtFlag;
    data['process_enable'] = this.processEnable;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}