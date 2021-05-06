
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/auth/model/sign_up_model.dart';
import 'package:myhealthbd_app/features/auth/repositories/auth_repository.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/filter_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class SignUpViewModel extends ChangeNotifier {
  String _username;
  String _password;
  String _message;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;
  AppError _appError;

  Future<void> getSignUpInfo(String name, String email,String mobile, String address, String selectedGender,String formatDate2) async {
    _isLoading = true;
    var res = await AuthRepository().fetchSignUpInfo( name,  email, mobile,  address,  selectedGender, formatDate2);
    print(res);
    notifyListeners();
    _isLoading = false;
    SignUpModel data= signUpModelFromJson(res);
    _username= data.obj.userId;
    _password= data.obj.password;
    _message= data.message;
    notifyListeners();
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;


  bool get isLoading => _isLoading;

  String get username => _username;
  String get password => _password;
  String get message => _message;
}