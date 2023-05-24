import 'package:intl/intl.dart';

class AdvanceSearchDetailModel {
  List<Data>? data;
  String? message;
  String? error;
  int? status;

  AdvanceSearchDetailModel({this.data, this.message, this.error, this.status});

  AdvanceSearchDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? projectId;
  dynamic? sector;
  dynamic? category;
  String? proposalId;
  String? proposalNo;
  int? applicationId;
  String? moefccFileNumber;
  String? otherProperty;
  String? clearanceType;
  dynamic? lastSubmissionDate;
  String? projectName;
  dynamic? forestArea;
  String? proposalStatus;
  String? singleWindowNumber;
  String? cafnumber;
  String? nameOfUserAgency;
  dynamic? issuingAuthority;
  dynamic? certificateUrl;
  String? proposalType;
  int? formId;
  String? dateOfSubmission;

  Data(
      {this.id,
        this.state,
        this.projectId,
        this.sector,
        this.category,
        this.proposalId,
        this.proposalNo,
        this.applicationId,
        this.moefccFileNumber,
        this.otherProperty,
        this.clearanceType,
        this.lastSubmissionDate,
        this.projectName,
        this.forestArea,
        this.proposalStatus,
        this.singleWindowNumber,
        this.cafnumber,
        this.nameOfUserAgency,
        this.issuingAuthority,
        this.certificateUrl,
        this.proposalType,
        this.formId,
        this.dateOfSubmission});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    projectId = json['project_id'];
    sector = json['sector'];
    category = json['category'];
    proposalId = json['proposal_id'];
    proposalNo = json['proposalNo'];
    applicationId = json['application_id'];
    moefccFileNumber = json['moefccFileNumber'];
    otherProperty = json['other_property'];
    clearanceType = json['clearanceType'];
    lastSubmissionDate = json['last_submission_date'];
    projectName = json['projectName'];
    forestArea = json['forest_area'];
    proposalStatus = json['proposalStatus'];
    singleWindowNumber = json['singleWindowNumber'];
    cafnumber = json['cafnumber'];
    nameOfUserAgency = json['nameOfUserAgency'];
    issuingAuthority = json['issuing_authority'];
    certificateUrl = json['certificateUrl'];
    proposalType = json['proposalType'];
    formId = json['form_id'];
    dateOfSubmission = json['dateOfSubmission'] != null
        ? DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.parse(json['dateOfSubmission'].toString()))
    : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['project_id'] = this.projectId;
    data['sector'] = this.sector;
    data['category'] = this.category;
    data['proposal_id'] = this.proposalId;
    data['proposalNo'] = this.proposalNo;
    data['application_id'] = this.applicationId;
    data['moefccFileNumber'] = this.moefccFileNumber;
    data['other_property'] = this.otherProperty;
    data['clearanceType'] = this.clearanceType;
    data['last_submission_date'] = this.lastSubmissionDate;
    data['projectName'] = this.projectName;
    data['forest_area'] = this.forestArea;
    data['proposalStatus'] = this.proposalStatus;
    data['singleWindowNumber'] = this.singleWindowNumber;
    data['cafnumber'] = this.cafnumber;
    data['nameOfUserAgency'] = this.nameOfUserAgency;
    data['issuing_authority'] = this.issuingAuthority;
    data['certificateUrl'] = this.certificateUrl;
    data['proposalType'] = this.proposalType;
    data['form_id'] = this.formId;
    data['dateOfSubmission'] = this.dateOfSubmission;
    return data;
  }
}