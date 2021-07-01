import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  signInTest();
}
Future<void> signInTest()async{

  group('Signin Test', ()
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
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver.tap(Keys.signInText);
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    test('When__try_to_login_while_both_field_is_empty__should__get_welcome_back_text', () async {
      await driver.tap(Keys.signInButton);
      await expect(await driver.getText(Keys.welcomeBackTextKey), 'Welcome Back');
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_login_while_password_field_is_empty__should__get_welcome_back_text', () async {
      await driver.tap(Keys.userNameKey);
      await driver.enterText('MH11210500030');
      await driver.tap(Keys.signInButton);
      await expect(await driver.getText(Keys.welcomeBackTextKey), 'Welcome Back');
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_login_while_username_field_is_empty__should__get_welcome_back_text', () async {
      await driver.tap(Keys.userNameKey);
      await driver.enterText('');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.passwordKey);
      await driver.enterText('1234');
      await driver.tap(Keys.signInButton);
      await expect(await driver.getText(Keys.welcomeBackTextKey), 'Welcome Back');
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_login_wrong_username__should__get_invalid_credential_text', () async {
      await driver.tap(Keys.userNameKey);
      await driver.enterText('MH11210500030');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.passwordKey);
      await driver.enterText('123123');
      await driver.tap(Keys.signInButton);
      await expect(await driver.getText(Keys.invalidCredentialKey), 'Invalid username or password');
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_login_wrong_password__should__get_invalid_credential_text', () async {
      await driver.tap(Keys.userNameKey);
      await driver.enterText('MH112105000309');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.passwordKey);
      await driver.enterText('1231234');
      await driver.tap(Keys.signInButton);
      await expect(await driver.getText(Keys.invalidCredentialKey), 'Invalid username or password');
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_login_wrong_password_and_wrong_username__should__get_invalid_credential_text', () async {
      await driver.tap(Keys.userNameKey);
      await driver.enterText('MH11210500030');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.passwordKey);
      await driver.enterText('1231234');
      await driver.tap(Keys.signInButton);
      await expect(await driver.getText(Keys.invalidCredentialKey), 'Invalid username or password');
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_click_visibility_on_button__should__show_password', () async {
      await driver.tap(Keys.visibleButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_click_visibility_off_button__should__hide_password', () async {
      await driver.tap(Keys.visibleButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_login_correct_password_and_correct_username__should__login_and_get_easy_doctor_text', () async {

      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.userNameKey);
        await driver.enterText('MH112105000309');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.passwordKey);
        await driver.enterText('123123');
        await driver.tap(Keys.signInButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.easyDoctorTextKey), "Easy Doctor Appointment");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
  });

}
