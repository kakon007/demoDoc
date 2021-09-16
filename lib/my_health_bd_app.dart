import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/view_model/appointment_report_view_model.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/view_model/shift_view_model.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/view_model/doctor_document_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/chief_complaint_view_model.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/view_model/prescription_list_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/clinical_history_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/past_illness_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/prescription_template_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/provisional_diagnosis_view_model.dart';
import 'package:myhealthbd_app/features/appointment_history/view_model/previous_vew_model.dart';
import 'package:myhealthbd_app/features/appointment_history/view_model/upcoming_view_model.dart';
import 'package:myhealthbd_app/features/appointment_history/view_model/zoom_view_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/book_appointment_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/auth/view_model/auth_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/policy_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/reset_password_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/sign_out_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/sign_up_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/term_view_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/company_list_view_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/test_item_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/blog_logo_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/blog_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/nearest_appointment_card_view_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/filter_view_model.dart';
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
import 'package:myhealthbd_app/features/notification/view_model/notification_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/change_password_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/registered_member_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/relationship_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/features/videos/view_models/video_view_model.dart';
import 'package:myhealthbd_app/root.dart';
import 'package:provider/provider.dart';

import 'admin/profile/view_model/personal_info_view_model.dart';
import 'doctor/features/dashboard/view_model/consultation_view_model.dart';
import 'doctor/features/patient_details/view_models/consultation_history_view_model.dart';
import 'doctor/features/prescription_module/view_models/advice_view_model.dart';
import 'doctor/features/prescription_module/view_models/orthosis_view_model.dart';
import 'doctor/features/prescription_module/view_models/procedure_view_model.dart';
import 'doctor/features/prescription_module/view_models/disease_view_model.dart';
import 'doctor/features/prescription_module/view_models/investigation_findings_view_model.dart';
import 'doctor/features/prescription_module/view_models/investigation_view_model.dart';
import 'doctor/features/prescription_module/view_models/medication_view_model.dart';
import 'doctor/features/profile/view_model/digital_signature_view_model.dart';
import 'doctor/features/profile/view_model/personal_info_view_model.dart';
import 'doctor/features/worklist/view_model/worklist_view_model.dart';
import 'features/book_test/view_model/order_confirm_view_model.dart';

class MyHealthBdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providers = [
      ChangeNotifierProvider<FilterViewModel>(
          create: (context) => FilterViewModel()),
      ChangeNotifierProvider<HospitalListViewModel>(
          create: (context) => HospitalListViewModel()),
      ChangeNotifierProvider<NewsViewModel>(
          create: (context) => NewsViewModel()),
      ChangeNotifierProvider<DoctorListViewModel>(
          create: (context) => DoctorListViewModel()),
      ChangeNotifierProvider<AvailableSlotsViewModel>(
          create: (context) => AvailableSlotsViewModel()),
      ChangeNotifierProvider<PrescriptionListViewModel>(
          create: (context) => PrescriptionListViewModel()),
      ChangeNotifierProvider<VideoViewModel>(
          create: (context) => VideoViewModel()),
      ChangeNotifierProvider<UserDetailsViewModel>(
          create: (context) => UserDetailsViewModel()),
      ChangeNotifierProvider<BLogViewModel>(
          create: (context) => BLogViewModel()),
      ChangeNotifierProvider<HospitalLogoViewModel>(
          create: (context) => HospitalLogoViewModel()),
      ChangeNotifierProvider<HospitalImageViewModel>(
          create: (context) => HospitalImageViewModel()),
      ChangeNotifierProvider<NewsLogoViewModel>(
          create: (context) => NewsLogoViewModel()),
      ChangeNotifierProvider<BLogLogoViewModel>(
          create: (context) => BLogLogoViewModel()),
      ChangeNotifierProvider<PasswordChangeViewModel>(
          create: (context) => PasswordChangeViewModel()),
      ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel()),
      ChangeNotifierProvider<BookAppointmentViewModel>(
          create: (context) => BookAppointmentViewModel()),
      ChangeNotifierProvider<SignOutViewModel>(
          create: (context) => SignOutViewModel()),
      ChangeNotifierProvider<SignUpViewModel>(
          create: (context) => SignUpViewModel()),
      ChangeNotifierProvider<AppointmentUpcomingViewModel>(
          create: (context) => AppointmentUpcomingViewModel()),
      ChangeNotifierProvider<AppointmentPreviousViewModel>(
          create: (context) => AppointmentPreviousViewModel()),
      ChangeNotifierProvider<ZoomViewModel>(
          create: (context) => ZoomViewModel()),
      ChangeNotifierProvider<UserImageViewModel>(
          create: (context) => UserImageViewModel()),
      ChangeNotifierProvider<RelationShipViewModel>(
          create: (context) => RelationShipViewModel()),
      ChangeNotifierProvider<RegisteredMemberViewModel>(
          create: (context) => RegisteredMemberViewModel()),
      ChangeNotifierProvider<FamilyMembersListViewModel>(
          create: (context) => FamilyMembersListViewModel()),
      ChangeNotifierProvider<ReportViewModel>(
          create: (context) => ReportViewModel()),
      ChangeNotifierProvider<DocumentViewModel>(
          create: (context) => DocumentViewModel()),
      ChangeNotifierProvider<FileTypeViewModel>(
          create: (context) => FileTypeViewModel()),
      ChangeNotifierProvider<UploadDocumentsViewModel>(
          create: (context) => UploadDocumentsViewModel()),
      ChangeNotifierProvider<ViewDocumentViewModel>(
          create: (context) => ViewDocumentViewModel()),
      ChangeNotifierProvider<NearestAppointmentViewModel>(
          create: (context) => NearestAppointmentViewModel()),
      ChangeNotifierProvider<SharedFileViewModel>(
          create: (context) => SharedFileViewModel()),
      ChangeNotifierProvider<SearchDoctorViewModel>(
          create: (context) => SearchDoctorViewModel()),
      ChangeNotifierProvider<ResetPasswordViewModel>(
          create: (context) => ResetPasswordViewModel()),
      ChangeNotifierProvider<NearestHospitalViewModel>(
          create: (context) => NearestHospitalViewModel()),
      ChangeNotifierProvider<NotificationViewModel>(
          create: (context) => NotificationViewModel()),
      ChangeNotifierProvider<TermsViewModel>(
          create: (context) => TermsViewModel()),
      ChangeNotifierProvider<PolicyViewModel>(
          create: (context) => PolicyViewModel()),
      ChangeNotifierProvider<PersonalInfoViewModel>(
          create: (context) => PersonalInfoViewModel()),
      ChangeNotifierProvider<PrescriptionTamplateViewModel>(
          create: (context) => PrescriptionTamplateViewModel()),
      ChangeNotifierProvider<WorkListViewModel>(
          create: (context) => WorkListViewModel()),
      ChangeNotifierProvider<ChiefComplaintViewModel>(
          create: (context) => ChiefComplaintViewModel()),
      ChangeNotifierProvider<PrescriptionListDocViewModel>(
          create: (context) => PrescriptionListDocViewModel()),
      ChangeNotifierProvider<PastIllnessViewModel>(
          create: (context) => PastIllnessViewModel()),
      ChangeNotifierProvider<ClinicalHistoryViewModel>(
          create: (context) => ClinicalHistoryViewModel()),
      ChangeNotifierProvider<ProvisionalDiagnosisViewModel>(
          create: (context) => ProvisionalDiagnosisViewModel()),
      ChangeNotifierProvider<AdviceViewModel>(
          create: (context) => AdviceViewModel()),
      ChangeNotifierProvider<DigitalSignatureViewModel>(
          create: (context) => DigitalSignatureViewModel()),
      ChangeNotifierProvider<DiseaseViewModel>(
          create: (context) => DiseaseViewModel()),
      ChangeNotifierProvider<MedicationViewModel>(
          create: (context) => MedicationViewModel()),
      ChangeNotifierProvider<InvestigationViewModel>(
          create: (context) => InvestigationViewModel()),
      ChangeNotifierProvider<InvestigationFindingsViewModel>(
          create: (context) => InvestigationFindingsViewModel()),
      ChangeNotifierProvider<OrthosisViewModel>(
          create: (context) => OrthosisViewModel()),
      ChangeNotifierProvider<ProcedureViewModel>(
          create: (context) => ProcedureViewModel()),
      ChangeNotifierProvider<GetTamplateDataViewModel>(
          create: (context) => GetTamplateDataViewModel()),
      ChangeNotifierProvider<ConsultationHistoryListDocViewModel>(
          create: (context) => ConsultationHistoryListDocViewModel()),
      ChangeNotifierProvider<DoctorDocumentationListDocViewModel>(
          create: (context) => DoctorDocumentationListDocViewModel()),
      ChangeNotifierProvider<AppointmentReportListDocViewModel>(
          create: (context) => AppointmentReportListDocViewModel()),
      ChangeNotifierProvider<ShiftListDocViewModel>(
          create: (context) => ShiftListDocViewModel()),
      ChangeNotifierProvider<OrderConfirmViewModel>(
          create: (context) => OrderConfirmViewModel()),
      ChangeNotifierProvider<ConsultationViewModel>(
          create: (context) => ConsultationViewModel()),

      ChangeNotifierProvider<TestItemViewModel>(
          create: (context) => TestItemViewModel()),
      ChangeNotifierProvider<CompanyListViewModel>(
          create: (context) => CompanyListViewModel()),
      ChangeNotifierProvider<AdminPersonalInfoViewModel>(
          create: (context) => AdminPersonalInfoViewModel()),
    ];
    return AuthViewWrapper(
      child: MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: "MyHealthBD",
          themeMode: ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xff354291),
            unselectedWidgetColor: Color(0xff8592E5),
          ),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          navigatorKey: appNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          home: Root(),
        ),
      ),
    );
  }
}
