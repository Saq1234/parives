class TrackProposolDetailsModel {
  List<Data>? data;
  String? message;
  String? error;
  int? status;

  TrackProposolDetailsModel({this.data, this.message, this.error, this.status});

  TrackProposolDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? state;
  int? projectId;
  dynamic? category;
  int? proposalId;
  String? proposalNo;
  int? applicationId;
  dynamic? moefccFileNumber;
  String? otherProperty;
  String? clearanceType;
  String? projectName;
  String? proposalStatus;
  String? singleWindowNumber;
  String? cafnumber;
  String? nameOfUserAgency;
  dynamic? issuingAuthority;
  dynamic? certificateUrl;
  String? proposalType;
  dynamic? formId;
  String? dateOfSubmission;
  dynamic? certificateUrl1;

  Data(
      {this.id,
        this.state,
        this.projectId,
        this.category,
        this.proposalId,
        this.proposalNo,
        this.applicationId,
        this.moefccFileNumber,
        this.otherProperty,
        this.clearanceType,
        this.projectName,
        this.proposalStatus,
        this.singleWindowNumber,
        this.cafnumber,
        this.nameOfUserAgency,
        this.issuingAuthority,
        this.certificateUrl,
        this.proposalType,
        this.formId,
        this.dateOfSubmission,
        this.certificateUrl1});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    projectId = json['project_id'];
    category = json['category'];
    proposalId = json['proposal_id'];
    proposalNo = json['proposalNo'];
    applicationId = json['application_id'];
    moefccFileNumber = json['moefccFileNumber'];
    otherProperty = json['other_property'];
    clearanceType = json['clearanceType'];
    projectName = json['projectName'];
    proposalStatus = json['proposalStatus'];
    singleWindowNumber = json['singleWindowNumber'];
    cafnumber = json['cafnumber'];
    nameOfUserAgency = json['nameOfUserAgency'];
    issuingAuthority = json['issuing_authority'];
    certificateUrl = json['certificateUrl'];
    proposalType = json['proposalType'];
    formId = json['form_id'];
    dateOfSubmission = json['dateOfSubmission'];
    certificateUrl1 = json['certificateUrl1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['project_id'] = this.projectId;
    data['category'] = this.category;
    data['proposal_id'] = this.proposalId;
    data['proposalNo'] = this.proposalNo;
    data['application_id'] = this.applicationId;
    data['moefccFileNumber'] = this.moefccFileNumber;
    data['other_property'] = this.otherProperty;
    data['clearanceType'] = this.clearanceType;
    data['projectName'] = this.projectName;
    data['proposalStatus'] = this.proposalStatus;
    data['singleWindowNumber'] = this.singleWindowNumber;
    data['cafnumber'] = this.cafnumber;
    data['nameOfUserAgency'] = this.nameOfUserAgency;
    data['issuing_authority'] = this.issuingAuthority;
    data['certificateUrl'] = this.certificateUrl;
    data['proposalType'] = this.proposalType;
    data['form_id'] = this.formId;
    data['dateOfSubmission'] = this.dateOfSubmission;
    data['certificateUrl1'] = this.certificateUrl1;
    return data;
  }
}