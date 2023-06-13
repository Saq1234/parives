import 'package:intl/intl.dart';

class ProposalAgendaDetails {
  String? toTime;
  String? fromTime;
  String? documentPath;
  String? agendaNo;
  String? strdateOfMeeting;
  int? agendaFcId;

  ProposalAgendaDetails(
      {this.toTime,
        this.fromTime,
        this.documentPath,
        this.agendaNo,
        this.strdateOfMeeting,
        this.agendaFcId});

  ProposalAgendaDetails.fromJson(Map<String, dynamic> json) {
    toTime = json['to_time'];
    fromTime = json['from_time'];
    documentPath = json['document_path'];
    agendaNo = json['agenda_no'];
    strdateOfMeeting = json['strdate_of_meeting']!= null
        ? DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.parse(json['strdate_of_meeting'].toString()))
        : null;;
    agendaFcId = json['agenda_fc_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to_time'] = this.toTime;
    data['from_time'] = this.fromTime;
    data['document_path'] = this.documentPath;
    data['agenda_no'] = this.agendaNo;
    data['strdate_of_meeting'] = this.strdateOfMeeting;
    data['agenda_fc_id'] = this.agendaFcId;
    return data;
  }
}