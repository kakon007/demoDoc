import 'package:flutter_driver/flutter_driver.dart';
import 'package:myhealthbd_app/main_app/util/keys.dart';
import 'package:test/test.dart';

import '../auth/sign_in_common_test.dart';
import 'appointment_family_member_test.dart';
import 'appointment_for_me_test.dart';
import 'appointment_no_family_test.dart';
import 'appointment_others_test.dart';
import 'appointment_slot_test.dart';

//flutter drive --flavor dev --target=test_driver/patient/book_appointment/appointment.dart

main(){
  appointmentTest();
}
Future<void> appointmentTest()async{

  group('Appointment test', ()
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
    signInCommonTest();
    //test cases are started from here
    selectSlotTest();
    appointForMeTest();
    selectSlotTest();
    appointmentNoFamilyMemberTest(); /* run this when no family member is available*/
    //appointmentFamilyTest(); /* run this when family member is available*/
    selectSlotTest();
    appointOthersTest();
  });


}
