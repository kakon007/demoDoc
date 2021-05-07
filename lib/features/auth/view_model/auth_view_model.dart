//
//   import 'package:flutter/cupertino.dart';
// import 'package:myhealthbd_app/features/auth/repositories/auth_repository.dart';
//   import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
//   import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
//   import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
//   import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
//   import 'package:myhealthbd_app/features/hospitals/repositories/filter_repository.dart';
//   import 'package:myhealthbd_app/main_app/failure/app_error.dart';
//
//   class AuthViewModel extends ChangeNotifier {
//     String _accessToken;
//     AppError _appError;
//     DateTime _lastFetchTime;
//     bool _isFetchingMoreData = false;
//     bool _isFetchingData = false;
//     bool _isLoading = false;
//
//
//     Future<void> getAuthData(String user, String pass) async {
//       _isLoading = true;
//       var res = await AuthRepository().fetchFee(user, pass);
//       notifyListeners();
//       res.fold((l) {
//         _appError = l;
//         _isFetchingMoreData = false;
//         _isLoading = false;
//         notifyListeners();
//       }, (r) {
//         _isFetchingMoreData = false;
//         _accessToken= r.accessToken;
//         _isLoading = false;
//         notifyListeners();
//       });
//     }
//
//     AppError get appError => _appError;
//
//     bool get isFetchingData => _isFetchingData;
//
//     bool get isFetchingMoreData => _isFetchingMoreData;
//
//
//     bool get isLoading => _isLoading;
//
//     String get accessToken => _accessToken;
//   }