import 'dart:convert';
import 'dart:developer';

import 'package:parivesh/user_manuals/model/user_manual_crz_model.dart';
import 'package:parivesh/user_manuals/model/user_manual_enviorment_model.dart';
import 'package:parivesh/user_manuals/model/user_manual_wild_model.dart';
import 'package:parivesh/user_manuals/model/user_manuals_forest_model.dart';
import 'package:parivesh/user_manuals/model/user_manuals_model.dart';

import '../../common/app_url.dart';
import 'package:http/http.dart' as http;


class UserManualApi{
  Future<UserManualsOtherModel?> fetchManualDataOther({required String category}) async {

    final Uri uri = Uri.parse(AppUrls.userManuals); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'category': category,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return UserManualsOtherModel.fromJson(responseData);
      }

    }
    log("msg$response");

  }
  Future<UserManualsForestModel?> fetchManualDataForest({required String category}) async {

    final Uri uri = Uri.parse(AppUrls.userManuals); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'category': category,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return UserManualsForestModel.fromJson(responseData);
      }

    }
    log("msg$response");

  }
  Future<UserManualsWildModel?> fetchManualDataWild({required String category}) async {

    final Uri uri = Uri.parse(AppUrls.userManuals); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'category': category,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return UserManualsWildModel.fromJson(responseData);
      }

    }
    log("msg$response");

  }
  Future<UserManualsCrzModel?> fetchManualDataCrz({required String category}) async {

    final Uri uri = Uri.parse(AppUrls.userManuals); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'category': category,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return UserManualsCrzModel.fromJson(responseData);
      }

    }
    log("msg$response");

  }
  Future<UserManualsEnviormentModel?> fetchManualDataEnviorment({required String category}) async {

    final Uri uri = Uri.parse(AppUrls.userManuals); // Replace with your API endpoint
    final Map<String, String> queryParams = {
      'category': category,
    };
    final Uri finalUri = uri.replace(queryParameters: queryParams);
    final response = await http.post(finalUri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("response--$responseData");
      if(responseData !=null){
        return UserManualsEnviormentModel.fromJson(responseData);
      }

    }
    log("msg$response");

  }
}