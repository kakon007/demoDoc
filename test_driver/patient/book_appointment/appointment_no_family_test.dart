import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  appointmentNoFamilyMemberTest();
}
Future<void> appointmentNoFamilyMemberTest()async{

  group('Appointment Family Test', ()
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
    test( 'When__try_to_tap_select_family_member_dropdown__should__get_family_member_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.selectAddPatientType);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("Family Member"));
         });
    });
    test( 'When__try_to_tap_family_member__should__get_You_have_added_no_family_members_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.familyMemberSelectKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.noFamilyMemberKey), "You have added no family members.");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test( 'When__try_to_tap_family_member__should__get_Family_Members_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.addNowButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.familyMemberSearchAppbarKey), "Search");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_to_search_rahat__should__go_to_search_screen_and_get_Search_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.familyMemberSearchKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.enterText('rahat');
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.familyMemberSearchButtonKey);
        await expect(await driver.getText(Keys.familyMemberSearchAppbarKey), "Search");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test('When__try_add_member_at_index_1__should__go_to_add_family_member_screen_and_get_Select_Relationship_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.addMemberKey1);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.selectRelationShipAppbarKey), "Select Relationship");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    // test('When__try_tap_add_as_family_member_button_without_selecting_relation__should__get_Select_Relationship_text_on_appbar', () async {
    //   await driver.runUnsynchronized(() async {
    //     await driver.tap(Keys.addAsFamilyMemberButtonKey);
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //     await expect(await driver.getText(Keys.selectRelationShipAppbarKey), "Select Relationship");
    //     await Future.delayed(const Duration(seconds: 2), () {});
    //   });
    // });
    test('When__try_select_relation_and_tap_add_as_family_member_button_without_selecting_relation__should__go_to_family_members_screen_and_get_family_members_text_on_appbar', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.selectRelationKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("Brother"));
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.addAsFamilyMemberButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.familyMembersAppbarKey), "Family Members");
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });

    test( 'When__try_to_tap_member_index_0__should__get_Select_Consultation_Type_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.selectFamilyMemberKey0);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.consultTypeHintTextKey), "Select Consultation Type");
      });
    });
    test( 'When__try_to_select_consult_type_report_check__should__get_300_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.consultTypeAddPatientKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text("Report Check"));
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.consultFeeAddPatient), "300");
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
