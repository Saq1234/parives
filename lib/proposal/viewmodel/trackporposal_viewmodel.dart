import 'package:flutter/cupertino.dart';
import 'package:parivesh/proposal/api/proposal_api.dart';
import 'package:parivesh/proposal/model/authority_model.dart';
import 'package:parivesh/proposal/model/proposol_history_model.dart';
import 'package:parivesh/proposal/model/proposol_status_model.dart';
import 'package:parivesh/proposal/model/sector_type_model.dart';
import 'package:parivesh/proposal/model/shedule_no_model.dart';
import 'package:parivesh/proposal/model/track_proposal_model.dart';
import 'package:parivesh/proposal/model/track_proposol_details_model.dart';

import '../model/advance_search_detail_model.dart';
import '../model/clearanceType_model.dart';
import '../model/proposol_type_model.dart';
import '../model/stateType_model.dart';

class ProposalViewModel extends ChangeNotifier {
  late final PorposalApi _porposalApi = PorposalApi();
  TrackPorposalModel? trackPorposalModel;
  AdvanceSearchDetailModel? advanceSearchDetailModel;
  ClearanceTypeModel? clearanceTypeModel;
  StateTypeModel? stateTypeModel;
  SectorTypeModel? sectorTypeModel;
  ProposolTypeModel? proposolTypeModel;
  ProposolStatusModel? proposolStatusModel;
  AuthorityModel? authorityModel;
  CategoryModel? categoryModel;
  TrackProposolDetailsModel? trackProposolDetailsModel;
  ProposolHistoryModel? proposolHistoryModel;

  Future getPorposalDetails({required String porposalNo}) async {
    final data = await _porposalApi.fetchData(porposalNo: porposalNo);
    trackPorposalModel = data;
    notifyListeners();
    return trackPorposalModel;
  }

  Future getAdvanceSearchDetails({
    required String majorClearanceType,
    required String state,
    // required String sector,
    // required String proposalStatus,
    // required String proposalType,
    // required String issuingAuthority,
    // required String activityId,
    // required String category,
    // required String startDate,
    // required String endDate,
    // required String area,
    // required String text,
  }) async {
    final data = await _porposalApi.fetchAdvanceSearchData(
      majorClearanceType: majorClearanceType, state: state,
      // sector: sector, proposalStatus: proposalStatus,
      // proposalType: proposalType, issuingAuthority: issuingAuthority,
      // activityId: activityId, category: category,
      // startDate: startDate, endDate: endDate, area: area,
      // text: text
    );
    advanceSearchDetailModel = data;
    notifyListeners();
    return advanceSearchDetailModel;
  }

//ClearanceTypeViewModel
  Future<void> getDataClearanceType() async {
    final data = await _porposalApi.fetchDataClearanceType();
    clearanceTypeModel = data;
    notifyListeners();
    //return clearanceTypeModel;
  }

// StateTypeViewModel
  Future getDataStateType() async {
    final data = await _porposalApi.fetchDataStateType();
    stateTypeModel = data;
    notifyListeners();
    return stateTypeModel;
  }

// SectorTypeViewModel

  Future getDataSectorType() async {
    final data = await _porposalApi.fetchDataSectorType();
    sectorTypeModel = data;
    notifyListeners();
    return sectorTypeModel;
  }

// ProposolTypeViewModel

  Future getPorposalType({required int id}) async {
    final data = await _porposalApi.fetchDataProposolType(id: id);
    proposolTypeModel = data;
    notifyListeners();
    return proposolTypeModel;
  }

// ProposolStatusViemodel

  Future getPorposalStatus({required int workgroupId}) async {
    final data = await _porposalApi.fetchDataProposolStatus(workgroupId: workgroupId);
    proposolStatusModel = data;
    notifyListeners();
    return proposolStatusModel;
  }

// AuthorityViewmodel

  Future getDataAuthority() async {
    final data = await _porposalApi.fetchDataAuthority();
    authorityModel = data;
    notifyListeners();
    return authorityModel;
  }

// SheduleNo Api

  Future getDataSheduleNo() async {
    final data = await _porposalApi.fetchDataSheduleNo();
    categoryModel = data;
    notifyListeners();
    return categoryModel;
  }


// TrackProposolDetailsViewmodel

  Future getTrackPorposalDetails({required String porposalNo}) async {
    final data = await _porposalApi.fetchDataProposolDetail(proposalNo: porposalNo);
    trackProposolDetailsModel = data;
    notifyListeners();
    return trackProposolDetailsModel;
  }

// ProposolHistory

  Future getProposolHistory({required int application_id}) async {
    final data = await _porposalApi.fetchDataProposolHistory(application_id: application_id);
    proposolHistoryModel = data;
    notifyListeners();
   // return proposolHistoryModel;
  }






}
