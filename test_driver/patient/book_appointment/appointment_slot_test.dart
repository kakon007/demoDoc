import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import '../hospital/hospital_doctor_page_navigate_test.dart';

//flutter drive --flavor dev --target=test_driver/company/auth/signin.dart

main(){
  selectSlotTest();
}
Future<void> selectSlotTest()async{

  group('Slot test', ()
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
    hospitalDoctorCommonTest();
    test(  'When__try_to_select_appointment_date__should__select_date', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.selectAppointmentDateKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text('30'));
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(find.text('OK'));
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
    test(
        'When__try_to_scroll_left__should__scroll', () async {
      await driver.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.scrollUntilVisible(Keys.availableSlot0, Keys.availableSlot10, dxScroll: 40);
        //await driver.tap(Keys.listViewBuilderKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        //await expect(await driver.getText(Keys.hospitalAppbarKey), "Hospitals & Diagnostics");
      });
    });
    test( 'When__try_to_tap_proceed_button_date__should__get_for_me_text', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(Keys.availableSlot10);
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver.tap(Keys.proceedButtonKey);
        await Future.delayed(const Duration(seconds: 2), () {});
        await expect(await driver.getText(Keys.forMeKey), "For Me");
        await Future.delayed(const Duration(seconds: 2), () {});

      });
    });

  });


}
