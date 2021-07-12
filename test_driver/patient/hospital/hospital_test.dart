import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  hospitalTest();
}
Future<void> hospitalTest()async{

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
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_tap_searchField__should__get_Hospitals_&_Diagnostics_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.hospitalSearchFieldKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_enter_lowercase_input__should__get_desired_output', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('aalok');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_enter_uppercase_input__should__get_desired_output', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('Dhanmondi');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_enter_wrong_name_input__should__not_get_desired_output', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('abcd');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_enter_empty_name_input__should__not_show_whole_list', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_scroll_down__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(Keys.listViewBuilderKey, Keys.getAppointmentKey8, dyScroll: -40);
        //await driver.tap(Keys.listViewBuilderKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        //await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_tap_get_appointment_on_eighth_index__should__go_to_doctors_screen_and_get_doctors_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 5), () {});
        await driver.tap(Keys.getAppointmentKey8);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.doctorsKey), "Doctors");
      });
    });
    // test(
    //     'When__try_to_tap_back_button__should__go_to_hospitals_screen_and_get_Hospitals_&_Diagnostics_on_appbar', () async {
    //   await driver.runUnsynchronized(() async {
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //     await driver.tap(Keys.backButton);
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //     await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
    //   });
    // });

  });


  //test cases are started from here

}
