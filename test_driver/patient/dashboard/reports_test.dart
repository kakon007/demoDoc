import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';
import '../auth/sign_in_common_test.dart';

main(){
  reportsTest();
}
Future<void> reportsTest()async{

  group('MyHealth reports test', ()
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
        await driver.enterText('MH22012014368');
        await Future.delayed(const Duration(seconds: 3), () {});
        await driver.tap(Keys.passwordKey);
        await driver.enterText('123456');
        await driver.tap(Keys.signInButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.easyDoctorTextKey), "Easy Doctor Appointment");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    //test cases are started from here
    test(  'When__try_to_tap_appointments_from_bottom_navbar__should__get_patient_portal_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.myHealthBottomNavbarKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.patientPortalAppbarKey), "Patient Portal");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(  'When__try_to_tap_appointments_from_bottom_navbar__should__get_patient_portal_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.reportsTabKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.patientPortalAppbarKey), "Patient Portal");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    /*
    //run this if no report is available
    test(  'When__no_report_available__should__get_You_have_no_report_available_now', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.noAvailableReportKey), "You have no report available now");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    */

    test(  'When__try_to_tap_first_index_of_reports__should__go_to_pdf_view_page', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.showReportKey0);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_back_button__should__get_patient_portal_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.backButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.patientPortalAppbarKey), "Patient Portal");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_search_icon_and_search_for_a_value__should__get_the_result', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.reportsSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.reportsSearchFieldKey);
        await driver.enterText('others');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.reportsSearchIconKey);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_search__should__close_the_search_bar', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.reportsSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_download_icon__should__download_the_file', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.reportsDownloadKey0);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_share_icon__should__get_share_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.reportsShareKey0);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.shareTextKey), "Share");
      });
    });
    test(
        'When__try_to_tap_close_icon__should__patient_portal_screen', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.shareCloseKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.patientPortalAppbarKey), "Patient Portal");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
  });


}
