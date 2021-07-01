import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import '../auth/sign_in_common_test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  switchTest();
}
Future<void> switchTest()async{

  group('Switch Account Test', ()
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
    test('When__try_to_tap_profile_avatar___should__open_accounts_prompt_and_get_accounts_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.userAvatarKey);
        await expect(await driver.getText(Keys.accountsTextKey), "Accounts");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    //test cases are started from here
    test('When__try_to_tap_add_new_account___should__open_add_account_prompt_and_switch_account_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.switchToAnotherAccountKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.switchAccountAppbarKey), "Switch Account");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_add_new_account___should__open_add_account_prompt_and_switch_account_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.addNewAccountKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_cancel_button___should__open_add_account_prompt_and_switch_account_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.switchCancelButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.switchAccountAppbarKey), "Switch Account");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_add_null_username_password___should__open_add_account_prompt_and_switch_account_text', () async {
      await driver.tap(Keys.addNewAccountKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_empty_username_password___should__open_add_account_prompt_and_switch_account_text', () async {
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_empty_password___should__open_add_account_prompt_and_switch_account_text', () async {
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('MH112105000308');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_empty_password___should__open_add_account_prompt_and_switch_account_text', () async {
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('1234545');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_incorrect_username_password___should__open_add_account_prompt_and_switch_account_text', () async {
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('MHHDDfds');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('123123');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_incorrect_password__should__open_add_account_prompt_and_switch_account_text', () async {
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('MH22012014368');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('1234545');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountTextKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_correct_password__should__save_and_switch_account_text_on_appbar', () async {
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('MH22012014368');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('123123');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountAppbarKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_correct_password__should__save_and_switch_account_text_on_appbar', () async {
      await driver.tap(Keys.addNewAccountKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('MH112105000308');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('123123');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountAppbarKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_add_correct_password__should__save_and_switch_account_text_on_appbar', () async {
      await driver.tap(Keys.addNewAccountKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountUserNameKey);
      await driver.enterText('MH112105000305');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.switchAccountPasswordKey);
      await driver.enterText('123123');
      await driver.tap(Keys.switchConfirmButtonKey);
      await Future.delayed(const Duration(seconds: 2), () {});
      await expect(await driver.getText(Keys.switchAccountAppbarKey), "Switch Account");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_tap_switch_account_button_and_then_no_button__should__save_and_switch_account_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.switchButtonKey1);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.switchAccountNoButtonKey);
        await expect(await driver.getText(Keys.switchAccountAppbarKey), "Switch Account");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_tap_switch_account_button_and_then_yes_button__should__save_and_switch_account_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.switchButtonKey3);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.switchAccountYesButtonKey);
        await expect(await driver.getText(Keys.switchAccountAppbarKey), "Switch Account");
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.easyDoctorTextKey), "Easy Doctor Appointment");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });

  });


}
