import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/features/appointment_history/view_model/previous_vew_model.dart';
import 'package:myhealthbd_app/features/appointment_history/view_model/upcoming_view_model.dart';
import 'package:myhealthbd_app/features/appointment_history/view_model/zoom_view_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/blog_logo_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/blog_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/nearest_appointment_card_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/hospital_image_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/hospital_logo_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/nearest_hospital_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/document_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/file_type_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/prescription_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/report_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/search_doctor_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/shared_file_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/upload_documents_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/view_document_view_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_logo_view_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/filter_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/change_password_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/registered_member_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/videos/view_models/video_view_model.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/root.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/appointments/view_model/book_appointment_view_model.dart';
import 'features/auth/view_model/auth_view_model.dart';
import 'features/auth/view_model/reset_password_view_model.dart';
import 'features/auth/view_model/sign_out_view_model.dart';
import 'features/auth/view_model/sign_up_view_model.dart';
import 'features/find_doctor/view_model/doctor_list_view_model.dart';
import 'features/user_profile/view_model/family_members_view_model.dart';
import 'features/user_profile/view_model/relationship_view_model.dart';
import 'features/user_profile/view_model/user_image_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


    FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepOrange,
    );
    runApp(
      ChangeNotifierProvider(create: (context)=>AccessTokenProvider(),child: MyHealthBdApp()),
    );


}

class MyHealthBdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var providers=[

      ChangeNotifierProvider<FilterViewModel>(
          create: (context)=>FilterViewModel()),
      ChangeNotifierProvider<HospitalListViewModel>(create: (context) => HospitalListViewModel()),
      ChangeNotifierProvider<NewsViewModel>(create: (context) => NewsViewModel()),
      ChangeNotifierProvider<DoctorListViewModel>(
          create: (context)=>DoctorListViewModel()),
      ChangeNotifierProvider<AvailableSlotsViewModel>(
          create: (context)=>AvailableSlotsViewModel()),
      ChangeNotifierProvider<PrescriptionListViewModel>(create: (context) => PrescriptionListViewModel()),
      ChangeNotifierProvider<VideoViewModel>(create: (context) => VideoViewModel()),
      ChangeNotifierProvider< UserDetailsViewModel>(create: (context) =>  UserDetailsViewModel()),
      ChangeNotifierProvider< BLogViewModel>(create: (context) =>  BLogViewModel()),
      ChangeNotifierProvider<HospitalLogoViewModel>(create: (context) =>  HospitalLogoViewModel()),
      ChangeNotifierProvider<HospitalImageViewModel>(create: (context) =>  HospitalImageViewModel()),
      ChangeNotifierProvider<NewsLogoViewModel>(create: (context) =>  NewsLogoViewModel()),
      ChangeNotifierProvider<BLogLogoViewModel>(create: (context) =>  BLogLogoViewModel()),
      ChangeNotifierProvider<PasswordChangeViewModel>(create: (context) =>  PasswordChangeViewModel()),
      ChangeNotifierProvider< AuthViewModel>(create: (context) =>  AuthViewModel()),
      ChangeNotifierProvider< BookAppointmentViewModel>(create: (context) =>  BookAppointmentViewModel()),
      ChangeNotifierProvider< SignOutViewModel>(create: (context) =>  SignOutViewModel()),
      ChangeNotifierProvider< SignUpViewModel>(create: (context) =>  SignUpViewModel()),
      ChangeNotifierProvider<AppointmentUpcomingViewModel>(create: (context) =>  AppointmentUpcomingViewModel()),
      ChangeNotifierProvider<AppointmentPreviousViewModel>(create: (context) =>  AppointmentPreviousViewModel()),
      ChangeNotifierProvider<ZoomViewModel>(create: (context) =>  ZoomViewModel()),
      ChangeNotifierProvider<UserImageViewModel>(create: (context) =>  UserImageViewModel()),
      ChangeNotifierProvider<RelationShipViewModel>(create: (context) =>  RelationShipViewModel()),
      ChangeNotifierProvider<RegisteredMemberViewModel>(create: (context) =>  RegisteredMemberViewModel()),
       ChangeNotifierProvider<FamilyMembersListViewModel>(create: (context) =>  FamilyMembersListViewModel()),

      ChangeNotifierProvider<ReportViewModel>(create: (context) =>  ReportViewModel()),
      ChangeNotifierProvider<DocumentViewModel>(create: (context) =>  DocumentViewModel()),
      ChangeNotifierProvider<FileTypeViewModel>(create: (context) =>  FileTypeViewModel()),
      ChangeNotifierProvider<UploadDocumentsViewModel>(create: (context) =>  UploadDocumentsViewModel()),
      ChangeNotifierProvider<ViewDocumentViewModel>(create: (context) =>  ViewDocumentViewModel()),
      ChangeNotifierProvider<NearestAppointmentViewModel>(create: (context) =>  NearestAppointmentViewModel()),
      ChangeNotifierProvider<SharedFileViewModel>(create: (context) =>  SharedFileViewModel()),
      ChangeNotifierProvider<SearchDoctorViewModel>(create: (context) =>  SearchDoctorViewModel()),
      ChangeNotifierProvider<ResetPasswordViewModel>(create: (context) =>  ResetPasswordViewModel()),
      ChangeNotifierProvider<NearestHospitalViewModel>(create: (context) =>  NearestHospitalViewModel()),
    ];
    return  AuthViewWrapper(
      child: MultiProvider(
        providers: providers,
        child: MaterialApp(
          builder: BotToastInit(),
             navigatorObservers: [BotToastNavigatorObserver()],
             navigatorKey: appNavigator.navigatorKey,
            debugShowCheckedModeBanner: false,
            home: Root()),
      ),
    );
  }
}
