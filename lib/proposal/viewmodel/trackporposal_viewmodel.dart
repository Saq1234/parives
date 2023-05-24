import 'package:flutter/cupertino.dart';
import 'package:parivesh/proposal/api/proposal_api.dart';
import 'package:parivesh/proposal/model/track_proposal_model.dart';

import '../model/advance_search_detail_model.dart';
import '../model/clearanceType_model.dart';
import '../model/stateType_model.dart';

class ProposalViewModel extends ChangeNotifier{
  late final PorposalApi _porposalApi=PorposalApi();
  TrackPorposalModel? trackPorposalModel;
  AdvanceSearchDetailModel? advanceSearchDetailModel;
  ClearanceTypeModel? clearanceTypeModel;
  StateTypeModel? stateTypeModel;

  Future getPorposalDetails({required String porposalNo})async{
    final data=await _porposalApi.fetchData(porposalNo: porposalNo);
    trackPorposalModel=data;
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
  }
      )async{
    final data=await _porposalApi.fetchAdvanceSearchData(
        majorClearanceType: majorClearanceType, state: state,
        // sector: sector, proposalStatus: proposalStatus,
        // proposalType: proposalType, issuingAuthority: issuingAuthority,
        // activityId: activityId, category: category,
        // startDate: startDate, endDate: endDate, area: area,
        // text: text
    );
    advanceSearchDetailModel=data;
    notifyListeners();
    return advanceSearchDetailModel;
  }

//ClearanceTypeViewModel
  Future getDataClearanceType()async{
    final data=await _porposalApi.fetchDataClearanceType();
    clearanceTypeModel=data;
    notifyListeners();
    return clearanceTypeModel;
  }

// StateTypeViewModel
  Future getDataStateType()async{
    final data=await _porposalApi.fetchDataStateType();
    stateTypeModel=data;
    notifyListeners();
    return stateTypeModel;
  }

}