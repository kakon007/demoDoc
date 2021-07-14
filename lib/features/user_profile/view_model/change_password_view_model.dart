import 'dart:convert';
import 'dart:io';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/change_password_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PasswordChangeViewModel with ChangeNotifier {
  //String _confirmPassword='';
  String _oldPassword = "";
  String _newPassword = "";

  String userId;
  AppError _appError;
  String _message;
  PasswordChangeViewModel({this.userId});
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;
  //String _confirmNewPassword = "";

  String _errorTextOldPassword;
  String _errorTextNewPassword;
  // String _errorTextConfirmPassword;
//  String _errorTextConfirmPassword;
  bool _isBusy = false;
  bool _isObscurePasswordOld = true;
  bool _isObscurePasswordNew = true;
  //bool _isObscurePasswordConfirm = true;

  bool get isObscurePasswordOld => _isObscurePasswordOld;

  set isObscurePasswordOld(bool value) {
    _isObscurePasswordOld = value;
    notifyListeners();
  }

  bool get isObscurePasswordNew => _isObscurePasswordNew;

  set isObscurePasswordNew(bool value) {
    _isObscurePasswordNew = value;
    notifyListeners();
  }

  Future<void> getPassword(String accessToken, String newPassword, String confirmPassword,
      String currentPassword) async {
    print(accessToken);
    print(currentPassword);
    print(newPassword);
    print(confirmPassword);

    var res = await ChangePasswordRepository()
        .fetchPassword(accessToken, newPassword, confirmPassword, currentPassword);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _message = r.message;
      _isLoading = false;
      notifyListeners();
    });
  }

  String get message => _message;
  // bool get isObscurePasswordConfirm => _isObscurePasswordConfirm;
  //
  // set isObscurePasswordConfirm(bool value) {
  //   _isObscurePasswordConfirm = value;
  //   notifyListeners();
  // }

  bool get isBusy => _isBusy;

  set isBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  String get errorTextOldPassword => _errorTextOldPassword;

  set errorTextOldPassword(String value) {
    _errorTextOldPassword = value;
  }

  String get errorTextNewPassword => _errorTextNewPassword;

  set errorTextNewPassword(String value) {
    _errorTextNewPassword = value;
  }

  // String get errorTextConfirmPassword => _errorTextConfirmPassword;
  //
  // set errorTextConfirmPassword(String value) {
  //   _errorTextConfirmPassword = value;
  // }

//  String get errorTextConfirmPassword => _errorTextConfirmPassword;
//
//  set errorTextConfirmPassword(String value) {
//    _errorTextConfirmPassword = value;
//  }

  bool get allowSubmitButton {
    bool isNoErrors = _errorTextNewPassword == null && _errorTextOldPassword == null;

    // &&_errorTextConfirmPassword==null;

    bool isNoEmptyFields = _newPassword.isNotEmpty && _oldPassword.isNotEmpty;
//        &&
//        _confirmNewPassword.isNotEmptyOrNotNull;

    return isNoEmptyFields & isNoErrors;
  }

  bool validate() {
    //onChangeNewPassword(_confirmPassword);
    onChangeOldPassword(_oldPassword);
    onChangeNewPassword(_newPassword);

//    onChangeConfirmPassword(_confirmNewPassword);

    return _errorTextNewPassword == null &&
//        _errorTextConfirmPassword == null &&
        _errorTextOldPassword == null;

    // && _errorTextConfirmPassword==null;
  }

  // onConfirmPassword(String pass,String confirmPass) {
  //   _newPassword=pass;
  //   _confirmPassword = confirmPass;
  //   _errorTextConfirmPassword = Validator().validateConfirmPassword(pass,confirmPass);
  //   notifyListeners();
  // }

  onChangeOldPassword(String val) {
    _oldPassword = val;
    _errorTextOldPassword = Validator().validateEmptyPassword(val);
    notifyListeners();
  }

  onChangeNewPassword(String val) {
    _newPassword = val;
    _errorTextNewPassword = Validator().validatePassword(val);

//    if (_confirmNewPassword.isNotEmptyOrNotNull) {
//      onChangeConfirmPassword(_confirmNewPassword);
//    }
    notifyListeners();
  }

//  onChangeConfirmPassword(String val) {
//    _confirmNewPassword = val;
//    _errorTextConfirmPassword =
//        Validator().validateConfirmPassword(_newPassword, val);
//
//    notifyListeners();
//  }

  resetState() {
    _isObscurePasswordOld = true;
    _isObscurePasswordNew = true;
    // _isObscurePasswordConfirm = true;
    // _confirmPassword="";
    _oldPassword = "";
    _newPassword = "";
//     _confirmNewPassword = "";
    _errorTextOldPassword;
    _errorTextNewPassword;
    //_errorTextConfirmPassword;
//     _errorTextConfirmPassword;
    _isBusy = false;
  }

  Future<bool> changePassword() async {
    bool isValid = validate();
    print(isValid);

    if (isValid) {
      isBusy = true;

      var body = {
        "userName": userId,
        "newPassword": _newPassword,
        "confirmPassword": '123456',
        "currentPassword": _oldPassword,
      };

      try {
        var url = "${Urls.baseUrl}auth-api/api/changePassword";
        var client = http.Client();
        var accessToken =
            Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
        var res = await client.post(Uri.parse(url),
            headers: {
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        print(res.statusCode);
        print(res.body);
        isBusy = false;
        var data = json.decode(res.body);
        print(data['message']);
        if (data['message'] == "Change password save succesfully") {
          BotToast.showText(text: StringResources.passwordChangeSuccessful);
          resetState();
          return true;
        } else {
          //var data = json.decode(res.body);
          var message = "Incorrect Password";
          _errorTextOldPassword = message;
          notifyListeners();
          print("Unable to change password");
          return false;
        }
//        if (res.statusCode == 200) {
//          return true;
//        } else {
//          var data = json.decode(res.body);
//          var message = data['message'];
//          _errorTextOldPassword = message;
//          notifyListeners();
//          return false;
//        }
      } on SocketException catch (e) {
        isBusy = false;
        print(e);
        BotToast.showText(text: StringResources.unableToReachServerMessage);
        return false;
      } catch (e) {
        isBusy = false;
        print(e);
        BotToast.showText(text: StringResources.somethingIsWrong);
        return false;
      }
    } else {
      print('invalid');
      return false;
    }
  }
}
