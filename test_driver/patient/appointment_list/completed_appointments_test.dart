import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';
import '../auth/sign_in_common_test.dart';

main(){
  appointmentCompleted();
}
Future<void> appointmentCompleted()async{

  group('Appointment completed test', ()
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

    //test cases are started from here
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
    test(  'When__try_to_select_appointment_date__should__select_date', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.appointmentBottomNavbarKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.appointmentsAppbarKey), "Appointments");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
   /* test(  'When__try_to_tap_competed__should__get_no_appointments_yet', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.completedAppointmentsKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.noCompletedAppointments), "You have no completed \nappointment.");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });*/
    test(  'When__try_to_tap_competed__should__get_appointments_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.completedAppointmentsKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.appointmentsAppbarKey), "Appointments");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    // test(  'When__try_to_tap_rebook__should__get_Book_your_appointment_on_appbar', () async {
    //   await Future.delayed(const Duration(seconds: 5), () {});
    //   await driver.tap(Keys.rebookKey);
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //     await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");
    //     await Future.delayed(const Duration(seconds: 2), () {});
    // });
    // test(
    //     'When__try_to_tap_back_button__should__get_appointments_text', () async {
    //   await driver.runUnsynchronized(() async {
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //     await driver.tap(Keys.backButton);
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //     await expect(await driver.getText(Keys.appointmentsAppbarKey), "Appointments");
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //   });
    // });
    // test(  'When__try_to_tap_View_prescription__should__open_the_pdf', () async {
    //   await driver.runUnsynchronized(() async {
    //     await Future.delayed(const Duration(seconds: 5), () {});
    //     await driver.tap(Keys.viewPrescriptionKey);
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //   });
    // });
    // test(
    //     'When__try_to_tap_back_button__should__get_appointments_text', () async {
    //   await driver.runUnsynchronized(() async {
    //     await Future.delayed(const Duration(seconds: 5), () {});
    //     await driver.tap(Keys.backButton);
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //     await expect(await driver.getText(Keys.appointmentsAppbarKey), "Appointments");
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //   });
    // });
    test(  'When__try_to_tap_competed__should__get_appointments_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.completedSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
  });


}
