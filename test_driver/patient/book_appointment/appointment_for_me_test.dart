import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  appointForMeTest();
}
Future<void> appointForMeTest()async{

  group('Appointment for me test', ()
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
    test( 'When__try_to_select_consult_type_1st_follow_up_for_me__should__get_600_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.consultTypeForMeKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("1st Follow Up"));
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.consultFeeFroMe), "600");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test( 'When__try_to_select_confirm_button__should__get_Easy_Doctor_Appointment_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.confirmBookingKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.appointmentSuccessOkButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.easyDoctorTextKey), "Easy Doctor Appointment");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
  });


}
