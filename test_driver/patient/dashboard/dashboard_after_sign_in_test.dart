import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import '../auth/sign_in_common_test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main() {
  dashBoardUnsignedTest();
}

Future<void> dashBoardUnsignedTest() async {
  group('Dashboard Test', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    signInCommonTest();
    //test cases are started from here
    test('When__try_to_tap_view_all_appointments__should__get_easy_doctor_text',
        () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 7), () {});
        await driver.tap(Keys.viewAllAppointmentKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(
            await driver.getText(Keys.appointmentsAppbarKey), "Appointments");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_dashboard_from_bottom_navbar__should__get_appointments_text',
        () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.dashboardBottomNavbarKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.easyDoctorTextKey),
            "Easy Doctor Appointment");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_hospital_view_all__should__get_hospital_diagnostics_text',
            () async {
          await driver.runUnsynchronized(() async {
            await driver.tap(Keys.hospitalViewAllKey);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.hospitalAppbarKey),
                "Hospitals & Diagnostics");
            await Future.delayed(const Duration(seconds: 2), () {});
          });
        });
    test('When__try_to_tap_back_button__should__get_easy_doctor_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.backButton);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.easyDoctorTextKey),
                "Easy Doctor Appointment");
          });
        });
    test('When__try_to_scroll_hospital__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 15), () {});
        await driver.scrollUntilVisible(Keys.dashboardGetAppointmentButtonKey0,
            Keys.dashboardGetAppointmentButtonKey3,
            dxScroll: 20);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_search__should__get_hospital_Diagnostics_text_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.dashboardSearchKey);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.hospitalAppbarKey),
                "Hospitals & Diagnostics");
          });
        });
    test(
        'When__try_to_tap_dashboard_from_bottom_navbar__should__get_appointments_text',
            () async {
          await driver.runUnsynchronized(() async {
            await driver.tap(Keys.dashboardBottomNavbarKey);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.easyDoctorTextKey),
                "Easy Doctor Appointment");
            await Future.delayed(const Duration(seconds: 2), () {});
          });
        });
    // test('When__try_to_tap_get_an_appointment__should__get_doctors_text_text',
    //         () async {
    //       await driver.runUnsynchronized(() async {
    //         await Future.delayed(const Duration(seconds: 2), () {});
    //         await driver.tap(Keys.dashboardGetAppointmentButtonKey3);
    //         await Future.delayed(const Duration(seconds: 2), () {});
    //         await expect(await driver.getText(Keys.doctorsKey),
    //             "Doctors");
    //       });
    //     });
    test(
        'When__try_to_tap_news_view_all__should__get_news_text',
            () async {
          await driver.runUnsynchronized(() async {
            await driver.tap(Keys.newsViewAllKey);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.blogVlogNewsAppbarKey),
                "News");
            await Future.delayed(const Duration(seconds: 2), () {});
          });
        });
    test('When__try_to_tap_back_button__should__get_easy_doctor_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.backButton);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.easyDoctorTextKey),
                "Easy Doctor Appointment");
          });
        });
    test('When__try_to_scroll_news__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(
            Keys.readNewsButtonKey0, Keys.readNewsButtonKey3,
            dxScroll: 20);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_blog_view_all__should__get_blog_text',
            () async {
          await driver.runUnsynchronized(() async {
            await driver.tap(Keys.blogViewAllKey);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.blogVlogNewsAppbarKey),
                "Blog");
            await Future.delayed(const Duration(seconds: 2), () {});
          });
        });
    test('When__try_to_tap_back_button__should__get_MyHealthBD_blog_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.backButton);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.myHealthBlogKey),
                "MyHealthBD Blog");
          });
        });
    test('When__try_to_scroll_blog__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(
            Keys.readBlogButtonKey0, Keys.readBlogButtonKey3,
            dxScroll: 20);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_read_blog_button__should_go_to_details_page_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.readBlogButtonKey0);
            await Future.delayed(const Duration(seconds: 2), () {});
          });
        });
    test('When__try_to_tap_back_button__should__get_MyHealthBD_VBlog_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.backButton);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.myHealthBlogKey),
                "MyHealthBD Blog");
          });
        });
    test(
        'When__try_to_tap_video_view_all__should__get_video_text',
            () async {
          await driver.runUnsynchronized(() async {
            await driver.tap(Keys.videoViewAllKey);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.blogVlogNewsAppbarKey),
                "Video");
            await Future.delayed(const Duration(seconds: 2), () {});
          });
        });
    test('When__try_to_tap_back_button__should__get_MyHealthBD_Videos_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.backButton);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.myHealthVideoKey),
                "MyHealthBD Videos");
          });
        });
    test('When__try_to_scroll_video__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(
            Keys.watchVideoButtonKey0, Keys.watchVideoButtonKey3,
            dxScroll: 20);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_watch_button__should__get_description_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.watchVideoButtonKey0);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.descriptionTextKey),
                "Description*");
          });
        });
    test('When__try_to_tap_back_button__should__get_MyHealthBD_Videos_text',
            () async {
          await driver.runUnsynchronized(() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            await driver.tap(Keys.backButton);
            await Future.delayed(const Duration(seconds: 2), () {});
            await expect(await driver.getText(Keys.myHealthVideoKey),
                "MyHealthBD Videos");
          });
        });
  });
}
