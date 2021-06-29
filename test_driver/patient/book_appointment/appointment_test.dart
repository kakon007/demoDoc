import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  appointmentTest();
}
Future<void> appointmentTest()async{

  group('Appointment test', ()
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
        'When__try_to_tap_sign_in__should__go_to_sign_in_page', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 3), () {});
        await driver.tap(Keys.signInText);
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    test('When__try_to_login_correct_password_and_correct_username__should__login_and_get_easy_doctor_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.userNameKey);
        await driver.enterText('MH112105000309');
        await Future.delayed(const Duration(seconds: 3), () {});
        await driver.tap(Keys.passwordKey);
        await driver.enterText('123123');
        await driver.tap(Keys.signInButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.easyDoctorTextKey), "Easy Doctor Appointment");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    //test cases are started from here
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
    test(  'When__try_to_select_appointment_date__should__select_date', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.selectAppointmentDateKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text('30'));
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text('OK'));
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_scroll_left__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(Keys.availableSlot0, Keys.availableSlot10, dxScroll: 40);
        //await driver.tap(Keys.listViewBuilderKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        //await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test( 'When__try_to_tap_proceed_button_date__should__get_for_me_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.availableSlot10);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.proceedButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.forMeKey), "For Me");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test( 'When__try_to_tap_proceed_button_date__should__get_for_me_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.consultTypeForMeKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("1st Follow Up"));
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.consultFeeFroMe), "600");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test( 'When__try_to_tap_proceed_button_date__should__get_for_me_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.addPatientKey);
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });

  });


}
