import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

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
        'When__try_to_search_mahmud__should__not_get_desired_name', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.findYourDoctorSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('mahmud');
        await Future.delayed(const Duration(seconds: 2), () {});
         });
    });
    test(
        'When__try_to_search_debnath__should__not_get_desired_name', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.findYourDoctorSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('DEBNATH');
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_search_e,pty__should__not_get_all_doctor', () async {
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
        'When__try_to_tap_clearr_button__should__get_showing_filtered_result_text', () async {
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


  //test cases are started from here

}
