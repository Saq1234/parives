import 'package:intl/intl.dart';

class AdvanceSearcHistoryModel {
  List<Data>? data;
  String? message;
  String? error;
  int? status;

  AdvanceSearcHistoryModel({this.data, this.message, this.error, this.status});

  AdvanceSearcHistoryModel.fromJson(Map<String, dynamic> json) {
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
  int? applicationId;
  String? proposalNo;
  int? workgroupId;
  int? processId;
  int? processStepMappingId;
  int? version;
  int? currentStepId;
  String? startDate;
  String? endDate;
  bool? isCurrentStep;
  String? status;
  dynamic? remarks;
  int? entityid;
  String? name;
  String? abbriviation;
  List<HistoryWiseWithApplications>? historyWiseWithApplications;

  Data(
      {this.id,
        this.applicationId,
        this.proposalNo,
        this.workgroupId,
        this.processId,
        this.processStepMappingId,
        this.version,
        this.currentStepId,
        this.startDate,
        this.endDate,
        this.isCurrentStep,
        this.status,
        this.remarks,
        this.entityid,
        this.name,
        this.abbriviation,
        this.historyWiseWithApplications});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    applicationId = json['application_id'];
    proposalNo = json['proposal_no'];
    workgroupId = json['workgroup_id'];
    processId = json['process_id'];
    processStepMappingId = json['process_step_mapping_id'];
    version = json['version'];
    currentStepId = json['current_step_id'];
    startDate = json['start_date']!= null
        ? DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.parse(json['start_date'].toString()))
        : null;;
    endDate = json['end_date']!= null
        ? DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.parse(json['end_date'].toString()))
        : null;
    isCurrentStep = json['is_current_step'];
    status = json['status'];
    remarks = json['remarks'];
    entityid = json['entityid'];
    name = json['name'];
    abbriviation = json['abbriviation'];
    if (json['historyWiseWithApplications'] != null) {
      historyWiseWithApplications = <HistoryWiseWithApplications>[];
      json['historyWiseWithApplications'].forEach((v) {
        historyWiseWithApplications!
            .add(new HistoryWiseWithApplications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['application_id'] = this.applicationId;
    data['proposal_no'] = this.proposalNo;
    data['workgroup_id'] = this.workgroupId;
    data['process_id'] = this.processId;
    data['process_step_mapping_id'] = this.processStepMappingId;
    data['version'] = this.version;
    data['current_step_id'] = this.currentStepId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['is_current_step'] = this.isCurrentStep;
    data['status'] = this.status;
    data['remarks'] = this.remarks;
    data['entityid'] = this.entityid;
    data['name'] = this.name;
    data['abbriviation'] = this.abbriviation;
    if (this.historyWiseWithApplications != null) {
      data['historyWiseWithApplications'] =
          this.historyWiseWithApplications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryWiseWithApplications {
  int? id;
  int? appHistoryId;
  int? formId;
  String? applicationNo;
  String? dateOfFilling;
  int? officeId;
  String? officeName;
  String? roleName;
  int? userId;
  String? userName;
  int? version;
  int? displayOrder;
  String? name;
  String? ddName;
  String? processHistoryName;
  String? formPageUrl;
  String? viewPageUrl;
  String? abbr;
  String? description;
  int? workGroupId;
  String? formFor;
  bool? forDepartment;

  HistoryWiseWithApplications(
      {this.id,
        this.appHistoryId,
        this.formId,
        this.applicationNo,
        this.dateOfFilling,
        this.officeId,
        this.officeName,
        this.roleName,
        this.userId,
        this.userName,
        this.version,
        this.displayOrder,
        this.name,
        this.ddName,
        this.processHistoryName,
        this.formPageUrl,
        this.viewPageUrl,
        this.abbr,
        this.description,
        this.workGroupId,
        this.formFor,
        this.forDepartment});

  HistoryWiseWithApplications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appHistoryId = json['app_history_id'];
    formId = json['form_id'];
    applicationNo = json['application_no'];
    dateOfFilling = json['date_of_filling'];
    officeId = json['office_id'];
    officeName = json['office_name'];
    roleName = json['role_name'];
    userId = json['user_id'];
    userName = json['user_name'];
    version = json['version'];
    displayOrder = json['display_order'];
    name = json['name'];
    ddName = json['dd_name'];
    processHistoryName = json['process_history_name'];
    formPageUrl = json['form_page_url'];
    viewPageUrl = json['view_page_url'];
    abbr = json['abbr'];
    description = json['description'];
    workGroupId = json['work_group_id'];
    formFor = json['form_for'];
    forDepartment = json['for_department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app_history_id'] = this.appHistoryId;
    data['form_id'] = this.formId;
    data['application_no'] = this.applicationNo;
    data['date_of_filling'] = this.dateOfFilling;
    data['office_id'] = this.officeId;
    data['office_name'] = this.officeName;
    data['role_name'] = this.roleName;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['version'] = this.version;
    data['display_order'] = this.displayOrder;
    data['name'] = this.name;
    data['dd_name'] = this.ddName;
    data['process_history_name'] = this.processHistoryName;
    data['form_page_url'] = this.formPageUrl;
    data['view_page_url'] = this.viewPageUrl;
    data['abbr'] = this.abbr;
    data['description'] = this.description;
    data['work_group_id'] = this.workGroupId;
    data['form_for'] = this.formFor;
    data['for_department'] = this.forDepartment;
    return data;
  }
}