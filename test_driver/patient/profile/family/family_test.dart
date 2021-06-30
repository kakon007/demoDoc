import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import '../../auth/sign_in_common_test.dart';
import 'add_family_member_test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  familyTest();
}
Future<void> familyTest()async{

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


    signInCommonTest(); //sign in
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
    test('When__try_to_tap_family_member_view_all_button__should__go_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.profileFamilyViewAllKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_edit_button_of_third_member__should__get_Edit_Family_Member_Info_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.familyMemberEditButtonKey2);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.editMemberInfoKey), "Edit Family Member Info");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_cancel_button__should__go_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.familyMemberEditCancelKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_update_button_of_fifth_member__should__go_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.familyMemberEditButtonKey3);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver.tap(Keys.familyRelationUpdateKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver.runUnsynchronized(() async {
          await driver.tap(find.text("Brother"));
          await Future.delayed(const Duration(seconds: 1), () {});
          await driver.tap(Keys.familyMemberEditUpdateKey);
        });
        await Future.delayed(const Duration(seconds: 1), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 3), () {});
      });
    });
    test('When__try_to_tap_delete_and_cancel_button__should__go_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.familyMemberDeleteKey2);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.familyMemberCancelButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_tap_delete_and_remove_button__should__go_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.familyMemberDeleteKey2);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.familyMemberRemoveButtonKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    addFamilyMemberTest();

  });


}
