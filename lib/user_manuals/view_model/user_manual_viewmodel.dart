import 'package:flutter/cupertino.dart';
import 'package:parivesh/user_manuals/api/user_manuals_api.dart';
import 'package:parivesh/user_manuals/model/user_manual_crz_model.dart';
import 'package:parivesh/user_manuals/model/user_manual_wild_model.dart';
import 'package:parivesh/user_manuals/model/user_manuals_forest_model.dart';
import 'package:parivesh/user_manuals/model/user_manuals_model.dart';

import '../model/user_manual_enviorment_model.dart';

class UserManualViewModel extends ChangeNotifier{
  late final UserManualApi _userManualApi=UserManualApi();
  UserManualsOtherModel? userManualsOtherModel;
  UserManualsForestModel?userManualsForestModel;
  UserManualsWildModel?userManualsWildModel;
  UserManualsCrzModel?userManualsCrzModel;
  UserManualsEnviormentModel?userManualsEnviormentModel;
  Future getUserManualOtherDetails({required String category}) async {
    final data = await _userManualApi.fetchManualDataOther(category: category);
    userManualsOtherModel = data;
    notifyListeners();
    return userManualsOtherModel;
  }
  //forest viewmodel
  Future getUserManualForestDetails({required String category}) async {
    final data = await _userManualApi.fetchManualDataForest(category: category);
    userManualsForestModel = data;
    notifyListeners();
    return userManualsForestModel;
  }
  Future getUserManualWildDetails({required String category}) async {
    final data = await _userManualApi.fetchManualDataWild(category: category);
    userManualsWildModel = data;
    notifyListeners();
    return userManualsWildModel;
  }
  Future getUserManualCrzDetails({required String category}) async {
    final data = await _userManualApi.fetchManualDataCrz(category: category);
    userManualsCrzModel = data;
    notifyListeners();
    return userManualsCrzModel;
  }
  Future getUserManualEnviormentDetails({required String category}) async {
    final data = await _userManualApi.fetchManualDataEnviorment(category: category);
    userManualsEnviormentModel = data;
    notifyListeners();
    return userManualsEnviormentModel;
  }
}