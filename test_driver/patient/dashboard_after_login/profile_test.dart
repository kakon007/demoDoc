import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  loginTest();
}
Future<void> loginTest()async{

  group('Profile Test', ()
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

    //sign in
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
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.passwordKey);
        await driver.enterText('123123');
        await driver.tap(Keys.signInButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.easyDoctorTextKey), "Easy Doctor Appointment");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_profile_avatar___should__open_accounts_prompt_and_get_accounts_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.userAvatarKey);
        await expect(await driver.getText(Keys.accountsTextKey), "Accounts");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_manage_profile__should__go_to_user_profile_and_get_user_profile_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.manageProfileTextKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.userProfileKey), "User Profile");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_family_member_view_all_button__should__got_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.profileFamilyViewAllKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.backButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.userProfileKey), "User Profile");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_family_member_view_all_button__should__got_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.addFamilyMemberKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.backButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.userProfileKey), "User Profile");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_edit_profile__should__open_edit_prompt_get_edit_personal_info_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.editInfoKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.editPersonalInfo), "Edit Personal Info");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_cancel_button__should__get_user_profile_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.cancelButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.userProfileKey), "User Profile");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_edit_profile__should__open_edit_prompt_get_edit_personal_info_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.editInfoKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.editPersonalInfo), "Edit Personal Info");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_edit_user_information_should__save_and_get_user_profile_text_on_appbar', () async {
      await driver.tap(Keys.profileNameKey);
      await driver.enterText('');
      await driver.enterText('Shakil');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.profileEmailKey);
      await driver.enterText('');
      await driver.enterText('shakilhossain38@gmail.com');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.profileMobileNumberKey);
      await driver.enterText('');
      await driver.enterText('01521494640');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.profileAddressKey);
      await driver.enterText('');
      await driver.enterText('Dhaka');
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.profileGenderKey);
      await driver.runUnsynchronized(() async {
        await driver.tap(find.text("Female"));
      });
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.profileBloodGroupKey);
      await driver.runUnsynchronized(() async {
        await driver.tap(find.text("A+"));
      });
      await Future.delayed(const Duration(seconds: 2), () {});
      await driver.tap(Keys.profileSubmitButtonKey);
      await expect(await driver.getText(Keys.userProfileKey), "User Profile");
      await Future.delayed(const Duration(seconds: 2), () {});
    });
    test('When__try_to_tap_change_password__should__change_password_prompt_get_change_password_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.changePasswordKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.changePasswordPromptKey), "Change Password");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_cancel_button__should__get_user_profile_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.changePasswordCancelButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.userProfileKey), "User Profile");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_save_empty__should__change_password_prompt_get_change_password_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.changePasswordKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.changePasswordPromptKey), "Change Password");
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.changePasswordSaveButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.changePasswordPromptKey), "Change Password");
      });
    });
    test('When__try_to_save_wrong_current_password__should__change_password_prompt_get_change_password_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.currentPasswordKey);
        await driver.enterText('1231234');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.newPasswordKey);
        await driver.enterText('123123');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.confirmPasswordKey);
        await driver.enterText('123123');
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver.tap(Keys.changePasswordSaveButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.changePasswordPromptOkButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.changePasswordPromptKey), "Change Password");
      });
    });
    test('When__try_to_save_unmatched_new_password__should__change_password_prompt_get_change_password_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.currentPasswordKey);
        await driver.enterText('123123');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.newPasswordKey);
        await driver.enterText('123123');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.confirmPasswordKey);
        await driver.enterText('1231234');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.changePasswordSaveButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.changePasswordPromptKey), "Change Password");
      });
    });
    test('When__try_to_save_with_correct_info__should__change_password_prompt_get_user_profile_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.currentPasswordKey);
        await driver.enterText('123123');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.newPasswordKey);
        await driver.enterText('1231234');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.confirmPasswordKey);
        await driver.enterText('1231234');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.changePasswordSaveButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.changePasswordPromptOkButton);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.userProfileKey), "User Profile");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });

  });


  //test cases are started from here

}
