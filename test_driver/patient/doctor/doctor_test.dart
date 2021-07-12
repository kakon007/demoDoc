import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import '../auth/sign_in_common_test.dart';
import '../hospital/hospital_doctor_page_navigate_test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  doctorTest();
}
Future<void> doctorTest()async{

  group('Doctors list test', ()
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
    signInCommonTest(); //sign in
    //test cases are started from here
    hospitalDoctorCommonTest(); //navigate till book appointment page
    test(
        'When__try_to_tap_back_button__should__go_to_doctors_screen_and_get_doctors_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 5), () {});
        await driver.tap(Keys.backButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.doctorsKey), "Doctors");
      });
    });
    test(
        'When__try_to_scroll_down__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(Keys.doctorListViewBuilderKey, Keys.bookNowKey8, dyScroll: -40);
        //await driver.tap(Keys.listViewBuilderKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        //await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test(
        'When__try_to_search_mahmud__should__get_desired_name', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.findYourDoctorSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('mahmud');
        await Future.delayed(const Duration(seconds: 2), () {});
         });
    });
    test(
        'When__try_to_search_debnath__should__get_desired_name', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.findYourDoctorSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('DEBNATH');
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_search_empty__should__not_get_all_doctor', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.findYourDoctorSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('');
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_filter_icon__should__open_filters_sheet_and_get_filters_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.filterIconKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.filtersKey), "Filters");
      });
    });
    test(
        'When__try_to_select_dept_items__open_filters_sheet_and_get_filters_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.deptList2);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.deptList5);
        await expect(await driver.getText(Keys.filtersKey), "Filters");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_filter__should__get_showing_filtered_result_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.applyFilterButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.filteredResultKey), "Showing Filtered Result");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_filter_icon__should__open_filters_sheet_and_get_filters_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.filterIconKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.filtersKey), "Filters");
      });
    });
    test(
        'When__try_to_select_specialization_items__open_filters_sheet_and_get_filters_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.speciality2);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.speciality3);
        await expect(await driver.getText(Keys.filtersKey), "Filters");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_filter_button__should__get_showing_filtered_result_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.applyFilterButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.filteredResultKey), "Showing Filtered Result");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_filter_icon__should__open_filters_sheet_and_get_filters_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.filterIconKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.filtersKey), "Filters");
      });
    });
    test(
        'When__try_to_tap_clear_button__should__get_Doctors_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.clearFilterButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.doctorsKey), "Doctors");
        await Future.delayed(const Duration(seconds: 2), () {});
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


}
