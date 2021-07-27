import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  documentationTest();
}

Future<void> documentationTest()async{

  group('Documentation list Test', ()
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
        await driver.enterText('MH112105000275');
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
        'When__try_to_tap_myHealth_from_bottom_navbar__should__go_to_myHealth_screen_and_get_Patient_Portal_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.myHealthBottomNavbarKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.patientPortalAppbarKey), "Patient Portal");
      });
    });
    test(  'When__try_to_tap_appointments_from_bottom_navbar__should__get_patient_portal_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.documentationTabKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.patientPortalAppbarKey), "Patient Portal");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(  'When__try_to_tap_fourth_index_of_documentation__should__go_to_pdf_view_page', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.showDocumentationKey4);
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    //
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
    //
    test(
        'When__try_to_tap_search_icon_and_search_for_a_value__should__get_the_result', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.documentationSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.documentationSearchFieldKey);
        await driver.enterText('C52103001518');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.documentationSearchIconKey);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    //
    test(
        'When__try_to_tap_search__should__close_the_search_bar', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.documentationSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    //
    test(
        'When__try_to_tap_download_icon__should__download_the_file', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.documentationDownloadKey4);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    //
    test(
        'When__try_to_tap_share_icon__should__get_share_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.documentationShareKey4);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.shareTextKey), "Share");
      });
    });
    //
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
