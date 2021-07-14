import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import 'auth/forgot_password_test.dart';
import 'auth/sign_up_test.dart';
import 'auth/signin_test.dart';
import 'dashboard/dashboard_after_sign_in_test.dart';
import 'dashboard/dashboard_without_sign_in_test.dart';
import 'doctor/doctor_test.dart';
import 'hospital/hospital_doctor_page_navigate_test.dart';
import 'hospital/hospital_test.dart';
import 'profile/family/add_family_member_test.dart';
import 'profile/family/family_test.dart';
import 'profile/profile_test.dart';
import 'profile/switch_account_test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  patientAll();
}
Future<void> patientAll()async{

  group('Patient Test Automation', ()
  {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    signInTest();

    signUpTest();

    forgotPassword();

    dashBoardUnsignedTest();

    dashBoardSignedTest();

    doctorTest();

    hospitalDoctorCommonTest();

    hospitalTest();

    profileTest();

    switchAccountTest();

    familyTest();

    addFamilyMemberTest();
  });


}
