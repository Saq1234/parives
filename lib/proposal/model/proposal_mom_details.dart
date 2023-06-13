import 'package:intl/intl.dart';

class ProposalMomDetails {
  String? toTime;
  String? fromTime;
  String? documentPath;
  String? momNo;
  int? momId;
  String? strdateOfMeeting;

  ProposalMomDetails(
      {this.toTime,
        this.fromTime,
        this.documentPath,
        this.momNo,
        this.momId,
        this.strdateOfMeeting});

  ProposalMomDetails.fromJson(Map<String, dynamic> json) {
    toTime = json['to_time'];
    fromTime = json['from_time'];
    documentPath = json['document_path'];
    momNo = json['mom_no'];
    momId = json['mom_id'];
    strdateOfMeeting = json['strdate_of_meeting']!= null
        ? DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.parse(json['strdate_of_meeting'].toString()))
        : null;;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to_time'] = this.toTime;
    data['from_time'] = this.fromTime;
    data['document_path'] = this.documentPath;
    data['mom_no'] = this.momNo;
    data['mom_id'] = this.momId;
    data['strdate_of_meeting'] = this.strdateOfMeeting;
    return data;
  }
}