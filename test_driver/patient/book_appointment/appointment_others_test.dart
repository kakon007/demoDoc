import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  appointOthersTest();
}
Future<void> appointOthersTest()async{

  group('Appointment others test', ()
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
    test( 'When__try_to_tap_add_button__should__get_Select_Type_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.addPatientKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.selectTypeHintKey), "Select Type");
      });
    });
    test( 'When__try_to_tap_others_from_dropdown__should__get_Select_Consultation_Type_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.selectAddPatientType);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("Others"));
        await expect(await driver.getText(Keys.consultTypeHintTextKey), "Select Consultation Type");
      });
    });
    test( 'When__try_to_select_confirm_button__should__get_Select_Consultation_Type_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.confirmBookingKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.consultTypeHintTextKey), "Select Consultation Type");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test( 'When__try_to_select_consult_type_new_patient__should__get_800_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.consultTypeAddPatientKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("New Patient"));
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.consultFeeAddPatient), "800");

      });
    });
    test( 'When__try_to_enter_name__should__get_book_your_appointment_screen_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.appointNameKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('Shakil');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test( 'When__try_to_enter_email__should__get_book_your_appointment_screen_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.appointEmailKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('Shakil@ishraak.com');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test(
        'When__try_to_scroll_down__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(Keys.appointEmailKey, Keys.appointGenderKey, dyScroll: -40);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test( 'When__try_to_enter_mobile_number__should__get_book_your_appointment_screen_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.appointMobileKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('01835184976');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test( 'When__try_to_enter_address__should__get_book_your_appointment_screen_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.appointAddressKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('Niketan, Gulshan-1, Dhaka');
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });
    test( 'When__try_to_select_gender__should__get_book_your_appointment_screen_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.appointGenderKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("Male"));
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");

      });
    });
    test(  'When__try_to_select_birthdate_date__should__get_book_your_appointment_screen_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.appointBirthDateKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text('30'));
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text('OK'));
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.bookYourAppointmentAppbarKey), "Book your appointment");
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
