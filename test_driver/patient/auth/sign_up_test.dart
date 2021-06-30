import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  signUpTest();
}
Future<void> signUpTest()async{

  group('Signup Test', ()
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
    test(
        'When__try_to_tap_sign_up__should__get_Create_an_Account_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 3), () {});
        await driver.tap(Keys.signUpKey);
        await Future.delayed(const Duration(seconds: 3), () {});
        await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    test(
        'When__try_to_tap_back_button__should__get_welcome_back_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 5), () {});
        await driver.tap(Keys.backButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.welcomeBackTextKey), 'Welcome Back');
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_sign_up__should__get_Create_an_Account_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 3), () {});
        await driver.tap(Keys.signUpKey);
        await Future.delayed(const Duration(seconds: 3), () {});
        await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    test(
        'When__try_to_tap_signin__should__get_welcome_back_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 5), () {});
        await driver.tap(Keys.signInKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.welcomeBackTextKey), 'Welcome Back');
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_tap_sign_up__should__get_Create_an_Account_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 3), () {});
        await driver.tap(Keys.signUpKey);
        await Future.delayed(const Duration(seconds: 3), () {});
        await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    test(
        'When__try_to_tap_sign_up_button_with_all_field_empty__should__get_Create_an_Account_text', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 3), () {});
        await driver.tap(Keys.signUpButtonKey);
        await Future.delayed(const Duration(seconds: 3), () {});
        await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    test('When__try_to_up_with_some_empty_field_field_is_empty__should__get_Create_an_Account_text', () async {
      await driver.tap(Keys.signUpNameKey);
      await driver.enterText('Shakil');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpMobileKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.enterText('01835184976');
      await driver.tap(Keys.signUpAddressKey);
      await driver.enterText('Dhaka');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpButtonKey);
      await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_up_with_empty_birthdate_gender__should__get_Create_an_Account_text', () async {
      await driver.tap(Keys.signUpEmailKey);
      await driver.enterText('shakil@ishraak.com');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpButtonKey);
      await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_up_with_wrong_email__should__get_Create_an_Account_text', () async {
      await driver.tap(Keys.signUpEmailKey);
      await driver.enterText('shakil@');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpGenderKey);
      await driver.tap(find.text("Female"));
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpBirthDateKey);
      await Future.delayed(const Duration(seconds: 1), () {});
      await driver.tap(find.text('15'));
      await Future.delayed(const Duration(seconds: 1), () {});
      await driver.tap(find.text('OK'));
      await Future.delayed(const Duration(seconds: 1), () {});
      await driver.tap(Keys.signUpButtonKey);
      await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_up_with_wrong_mobile_number__should__get_Create_an_Account_text', () async {
      await driver.tap(Keys.signUpEmailKey);
      await driver.enterText('shakil@ishraak.com');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpMobileKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.enterText('0183518497');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpButtonKey);
      await expect(await driver.getText(Keys.createAnAccountKey), "Create an Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_up_with_wrong_mobile_number__should__get_easy_doctor_text', () async {
      await driver.tap(Keys.signUpMobileKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.enterText('01835184976');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.signUpOKButtonKey);
      await expect(await driver.getText(Keys.easyDoctorTextKey), "Easy Doctor Appointment");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
  });

}
