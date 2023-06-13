import 'dart:convert';
import 'dart:developer';

import 'package:parivesh/common/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:parivesh/proposal/model/advance_search_history_model.dart';
import 'package:parivesh/proposal/model/authority_model.dart';
import 'package:parivesh/proposal/model/proposal_mom_details.dart';
import 'package:parivesh/proposal/model/proposal_view_agenda_model.dart';
import 'package:parivesh/proposal/model/proposol_history_model.dart';
import 'package:parivesh/proposal/model/proposol_status_model.dart';
import 'package:parivesh/proposal/model/proposol_type_model.dart';
import 'package:parivesh/proposal/model/sector_type_model.dart';
import 'package:parivesh/proposal/model/shedule_no_model.dart';
import 'package:parivesh/proposal/model/track_proposol_details_model.dart';
import 'package:parivesh/proposal/view/advance_search_porposal.dart';

import '../model/advance_search_detail_model.dart';
import '../model/clearanceType_model.dart';
import '../model/stateType_model.dart';
import '../model/track_proposal_model.dart';


class PorposalApi{

  Future<TrackPorposalModel?> fetchData({required String porposalNo}) async {

    final Uri uri = Uri.parse(AppUrls.trackporpsal); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'proposalNo': porposalNo,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return TrackPorposalModel.fromJson(responseData);
      }

    }
    log("msg$response");

  }
  Future <AdvanceSearchDetailModel?>
  fetchAdvanceSearchData({
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
    final Uri uri = Uri.parse(AppUrls.advanceSearchDetails); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'majorClearanceType': majorClearanceType,
      'state': state,
      // 'sector': sector,
      // 'proposalStatus': proposalStatus,
      // 'proposalType': proposalType,
      // 'issuingAuthority': issuingAuthority,
      // 'activityId': activityId,
      // 'category': category,
      // 'startDate': startDate,
      // 'endDate': endDate,
      // 'area': area,
      // 'text': text,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.get(finalUri);
    print("myurl${finalUri}");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return AdvanceSearchDetailModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

//ClearanceTypApi
  Future<ClearanceTypeModel?> fetchDataClearanceType() async {

    final Uri uri = Uri.parse(AppUrls.getAllClearanceType); // Replace with your API endpoint

    final response = await http.get(uri);

    if (response.statusCode == 200) {

      final responseData = json.decode(response.body);
      print("response--clearence$responseData");
      if(responseData !=null){
        return ClearanceTypeModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }
// StateType Api

  Future<StateTypeModel?> fetchDataStateType() async {
    final Uri uri = Uri.parse(AppUrls.getListOfAllState); // Replace with your API endpoint

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--state$responseData");
      if(responseData !=null){
        return StateTypeModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// SectorType Api
  Future<SectorTypeModel?> fetchDataSectorType() async {
    final Uri uri = Uri.parse(AppUrls.getListOfSector); // Replace with your API endpoint

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--state$responseData");
      if(responseData !=null){
        return SectorTypeModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// ProposolType Api

  Future<ProposolTypeModel?> fetchDataProposolType({required int id}) async {
    final Uri uri = Uri.parse(AppUrls.getListOProposolType); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'id': id.toString(),
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return ProposolTypeModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// ProposolStatus Api

  Future<ProposolStatusModel?> fetchDataProposolStatus({required int workgroupId}) async {
    final Uri uri = Uri.parse(AppUrls.getListOProposolStatus); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'workgroupId': workgroupId.toString(),
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return ProposolStatusModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// Authority Api

  Future<AuthorityModel?> fetchDataAuthority() async {
    final Uri uri = Uri.parse(AppUrls.getListOProposolAuthority); // Replace with your API endpoint

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--state$responseData");
      if(responseData !=null){
        return AuthorityModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// SheduleNo Api

  Future<CategoryModel?> fetchDataSheduleNo() async {
    final Uri uri = Uri.parse(AppUrls.getListOProposolCategory); // Replace with your API endpoint

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--state$responseData");
      if(responseData !=null){
        return CategoryModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// TrackProposolDetail Api

  Future<TrackProposolDetailsModel?> fetchDataProposolDetail({required String proposalNo}) async {
    final Uri uri = Uri.parse(AppUrls.trackPorpsalDetails); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'proposalNo': proposalNo.toString(),
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return TrackProposolDetailsModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// ProposolHistory Api

  Future<ProposolHistoryModel?>fetchDataProposolHistory({required int application_id}) async {
    final Uri uri = Uri.parse(AppUrls.ProposolHistory); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'application_id': application_id.toString(),
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);


    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return ProposolHistoryModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }

// AdvanceSearchHistory Api

  Future<AdvanceSearcHistoryModel?>fetchDataAdvanceSearchProposolHistory({required int application_id}) async {
    final Uri uri = Uri.parse(AppUrls.advanceSearchProposolHistory); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'application_id': application_id.toString(),
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);


    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return AdvanceSearcHistoryModel.fromJson(responseData);
      }
    }
    log("msg$response");

  }


// ProposalViewAgendaDetails Api

  Future <List<ProposalAgendaDetails>?>fetchProposalViewAgenda({required String proposalNo}) async {
    final Uri uri = Uri.parse(AppUrls.proposalDetailsAgenda); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'proposalNo': proposalNo,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);


    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        Iterable  iterable = responseData;
        return iterable.map((e) => ProposalAgendaDetails.fromJson(e)).toList();
      }
    }
    log("msg$response");

  }

// ProposalMomDetaols Api

  Future <List<ProposalMomDetails>?>fetchProposalMom({required String proposalNo}) async {
    final Uri uri = Uri.parse(AppUrls.proposalMomDetails); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'proposalNo': proposalNo,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);


    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        Iterable  iterable = responseData;
        return iterable.map((e) => ProposalMomDetails.fromJson(e)).toList();
      }
    }
    log("msg$response");

  }














}