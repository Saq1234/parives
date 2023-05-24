import 'dart:convert';
import 'dart:developer';

import 'package:parivesh/common/app_url.dart';
import 'package:http/http.dart' as http;
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

}