import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  hospitalDoctorCommonTest();
}
Future<void> hospitalDoctorCommonTest()async{

  group('Family list Test', ()
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
    test(
        'When__try_to_tap_hospitals_from_bottom_navbar__should__go_to_hospitals_screen_and_get_Hospitals_&_Diagnostics_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.hospitalBottomNavbarKey);
        await Future.delayed(const Duration(seconds: 5), () {});
        await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });

    test(
        'When__try_to_tap_get_appointment_on_first_index__should__go_to_doctors_screen_and_get_doctors_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 5), () {});
        await driver.tap(Keys.getAppointmentKey0);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.doctorsKey), "Doctors");
      });
    });
    test(
        'When__try_to_tap_book_now_button_first_index__should__go_to_book_your_appointment_screen_screen_and_get_book_your_appointment_screen', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 5), () {});
        await driver.tap(Keys.bookNowKey0);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");
      });
    });

  });


  //test cases are started from here

}
