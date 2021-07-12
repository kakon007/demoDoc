import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import 'auth/forgot_password_test.dart';
import 'auth/sign_up_test.dart';
import 'auth/signin_test.dart';
import 'dashboard/dashboard_after_sign_in_test.dart';

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

  });


}
