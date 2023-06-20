import 'package:flutter/cupertino.dart';
import 'package:parivesh/user_manuals/api/user_manuals_api.dart';
import 'package:parivesh/user_manuals/model/user_manuals_model.dart';

class UserManualViewModel extends ChangeNotifier{
  late final UserManualApi _userManualApi=UserManualApi();
  UserManualsOtherModel? userManualsOtherModel;
  Future getUserManualOtherDetails({required String category}) async {
    final data = await _userManualApi.fetchManualDataOther(category: category);
    userManualsOtherModel = data;
    notifyListeners();
    return userManualsOtherModel;
  }
}