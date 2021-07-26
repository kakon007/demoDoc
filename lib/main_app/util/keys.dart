import 'package:flutter_driver/flutter_driver.dart';

class Keys{
  //common keys
  static final backButton = find.byTooltip('Back');


  // dashboard keys
  static final viewAllAppointmentKey = find.byValueKey('viewAllAppointmentKey');
  static final dashboardBottomNavbarKey = find.byValueKey('dashboardBottomNavbarKey');
  static final readNewsButtonKey0 = find.byValueKey('readNewsButtonKey0');
  static final readNewsButtonKey3 = find.byValueKey('readNewsButtonKey3');
  static final dashboardGetAppointmentButtonKey0 = find.byValueKey('dashboardGetAppointmentButtonKey0');
  static final dashboardGetAppointmentButtonKey3 = find.byValueKey('dashboardGetAppointmentButtonKey3');
  static final hospitalViewAllKey = find.byValueKey('hospitalViewAllKey');
  static final blogViewAllKey = find.byValueKey('blogViewAllKey');
  static final newsViewAllKey = find.byValueKey('newsViewAllKey');
  static final videoViewAllKey = find.byValueKey('videoViewAllKey');
  static final blogVlogNewsAppbarKey = find.byValueKey('blogVlogNewsAppbarKey');
  static final myHealthBlogKey = find.byValueKey('myHealthBolgKey');
  static final myHealthVideoKey = find.byValueKey('myHealthVideoKey');
  static final readBlogButtonKey0 = find.byValueKey('readBlogButtonKey0');
  static final readBlogButtonKey3 = find.byValueKey('readBlogButtonKey3');
  static final watchVideoButtonKey0 = find.byValueKey('watchVideoButtonKey0');
  static final watchVideoButtonKey3 = find.byValueKey('watchVideoButtonKey3');
  static final descriptionTextKey = find.byValueKey('descriptionTextKey');
  static final dashboardSearchKey = find.byValueKey('dashboardSearchKey');
  static final wantToAccessPresKey = find.byValueKey('wantToAccessPresKey');
  static final wantToAccessAppointKey = find.byValueKey('wantToAccessAppointKey');
  static final menuItemBeforeSignIn0 = find.byValueKey('menuItemBeforeSignIn0');
  static final menuItemBeforeSignIn1 = find.byValueKey('menuItemBeforeSignIn1');
  static final menuItemBeforeSignIn2 = find.byValueKey('menuItemBeforeSignIn2');
  static final menuItemBeforeSignIn3 = find.byValueKey('menuItemBeforeSignIn3');
  static final menuIconKey = find.byValueKey('menuIconKey');
  static final moreAppbarKey = find.byValueKey('moreAppbarKey');
  static final menuBackIconKey = find.byValueKey('menuBackIconKey');

  // sign up keys
  static final signUpKey = find.byValueKey('signUpKey');
  static final createAnAccountKey = find.byValueKey('createAnAccountKey');
  static final signInKey = find.byValueKey('signInKey');
  static final signUpButtonKey = find.byValueKey('signUpButtonKey');
  static final signUpNameKey = find.byValueKey('signUpNameKey');
  static final signUpBirthDateKey = find.byValueKey('signUpBirthDateKey');
  static final signUpGenderKey = find.byValueKey('signUpGenderKey');
  static final signUpAddressKey = find.byValueKey('signUpAddressKey');
  static final signUpMobileKey = find.byValueKey('signUpMobileKey');
  static final signUpEmailKey = find.byValueKey('signUpEmailKey');
  static final signUpOKButtonKey = find.byValueKey('signUpOKButtonKey');

  //sign in keys
  static final signInText = find.byValueKey('signInTextKey');
  static final signInButton = find.byValueKey('signInButtonKey');
  static final invalidCredentialKey = find.byValueKey('invalidCredentialKey');
  static final requiredFieldKey = find.byValueKey('requiredFieldKey');
  static final userNameKey = find.byValueKey('userNameKey');
  static final passwordKey = find.byValueKey('passwordKey');
  static final welcomeBackTextKey = find.byValueKey('welcomeBackTextKey');
  static final visibleButtonKey = find.byValueKey('visibleButtonKey');
  static final userAvatarKey = find.byValueKey('userAvatarKey');
  static final dashboardWelcomeText = find.byValueKey('dashboardWelcomeText');
  static final easyDoctorTextKey = find.byValueKey('easyDoctorTextKey');
  static final thisFieldisRequired = find.text('This Field Is Required');


  // profile keys
  static final accountsTextKey = find.byValueKey('accountsTextKey');
  static final manageProfileTextKey = find.byValueKey('manageProfileTextKey');
  static final userProfileKey = find.byValueKey('userProfileKey');
  static final editInfoKey = find.byValueKey('editInfoKey');
  static final editPersonalInfo = find.byValueKey('editPersonalInfo');
  static final profileMobileNumberKey = find.byValueKey('profileMobileNumberKey');
  static final profileNameKey = find.byValueKey('profileNameKey');
  static final profileEmailKey = find.byValueKey('profileEmailKey');
  static final profileAddressKey = find.byValueKey('profileAddressKey');
  static final profileSubmitButtonKey = find.byValueKey('profileSubmitButtonKey');
  static final profileGenderKey = find.byValueKey('profileGenderKey');
  static final profileBloodGroupKey = find.byValueKey('profileBloodGroupKey');
  static final profileFamilyViewAllKey = find.byValueKey('profileFamilyViewAllKey');
  static final addFamilyMemberKey = find.byValueKey('addFamilyMemberKey');
  static final changePasswordKey = find.byValueKey('changePasswordKey');
  static final changePasswordPromptKey = find.byValueKey('changePasswordPromptKey');
  static final currentPasswordKey = find.byValueKey('currentPasswordKey');
  static final newPasswordKey = find.byValueKey('newPasswordKey');
  static final confirmPasswordKey = find.byValueKey('confirmPasswordKey');
  static final cancelButtonKey = find.byValueKey('cancelButtonKey');
  static final changePasswordSaveButtonKey = find.byValueKey('changePasswordSaveButtonKey');
  static final changePasswordCancelButtonKey = find.byValueKey('changePasswordCancelButtonKey');
  static final changePasswordPromptOkButton = find.byValueKey('changePasswordPromptOkButton');


  //switch account keys
  static final switchAccountAppbarKey = find.byValueKey('switchAccountAppbarKey');
  static final switchToAnotherAccountKey = find.byValueKey('switchToAnotherAccountKey');
  static final addNewAccountKey = find.byValueKey('addNewAccountKey');
  static final switchAccountTextKey = find.byValueKey('switchAccountTextKey');
  static final switchAccountUserNameKey = find.byValueKey('switchAccountUserNameKey');
  static final switchAccountPasswordKey = find.byValueKey('switchAccountPasswordKey');
  static final switchCancelButtonKey = find.byValueKey('switchCancelButtonKey');
  static final switchConfirmButtonKey = find.byValueKey('switchConfirmButtonKey');
  static final switchButtonKey1 = find.byValueKey('switchButtonKey1');
  static final switchButtonKey3 = find.byValueKey('switchButtonKey3');
  static final switchAccountYesButtonKey = find.byValueKey('switchAccountYesButtonKey');
  static final switchAccountNoButtonKey = find.byValueKey('switchAccountNoButtonKey');


  // family members key
  static final familyMembersAppbarKey = find.byValueKey('familyMembersAppbarKey');
  static final familyMemberEditButtonKey2 = find.byValueKey('familyMemberEditButtonKey2');
  static final familyMemberEditButtonKey3 = find.byValueKey('familyMemberEditButtonKey3');
  static final familyMemberEditCancelKey = find.byValueKey('familyMemberEditCancelKey');
  static final editMemberInfoKey = find.byValueKey('editMemberInfoKey');
  static final familyMemberEditUpdateKey = find.byValueKey('familyMemberEditUpdateKey');
  static final familyRelationUpdateKey = find.byValueKey('familyRelationUpdateKey');
  static final familyMemberRemoveButtonKey = find.byValueKey('familyMemberRemoveButtonKey');
  static final familyMemberCancelButtonKey = find.byValueKey('familyMemberCancelButtonKey');
  static final familyMemberDeleteKey2 = find.byValueKey('familyMemberDeleteKey2');
  static final familyMemberSearchAppbarKey = find.byValueKey('familyMemberSearchAppbarKey');
  static final familyMemberSearchKey = find.byValueKey('familyMemberSearchKey');
  static final familyMemberSearchButtonKey = find.byValueKey('familyMemberSearchButtonKey');
  static final addMemberKey1 = find.byValueKey('addMemberKey1');
  static final selectRelationShipAppbarKey = find.byValueKey('selectRelationShipAppbarKey');
  static final selectRelationKey = find.byValueKey('selectRelationKey');
  static final addAsFamilyMemberButtonKey = find.byValueKey('addAsFamilyMemberButtonKey');

  //patient portal reports
  static final reportsTabKey = find.byValueKey('reportsTabKey');
  static final patientPortalAppbarKey = find.byValueKey('patientPortalAppbarKey');
  static final reportsSearchFieldKey = find.byValueKey('reportsSearchFieldKey');
  static final reportsSearchIconKey = find.byValueKey('reportsSearchIconKey');
  static final reportsSearchKey = find.byValueKey('reportsSearchKey');
  static final noAvailableReportKey = find.byValueKey('noAvailableReportKey');
  static final showReportKey0 = find.byValueKey('showReportKey0');
  static final reportsDownloadKey0 = find.byValueKey('reportsDownloadKey0');
  static final reportsShareKey0 = find.byValueKey('reportsShareKey0');
  static final shareCloseKey = find.byValueKey('shareCloseKey');
  static final shareTextKey = find.byValueKey('shareTextKey');

  // hospitals keys
  static final hospitalBottomNavbarKey = find.byValueKey('hospitalBottomNavbarKey');
  static final hospitalAppbarKey = find.byValueKey('hospitalAppbarKey');
  static final getAppointmentKey1 = find.byValueKey('getAppointmentKey1');
  static final getAppointmentKey0 = find.byValueKey('getAppointmentKey0');
  static final getAppointmentKey8 = find.byValueKey('getAppointmentKey8');
  static final listViewBuilderKey = find.byValueKey('listViewBuilderKey');
  static final hospitalSearchFieldKey = find.byValueKey('hospitalSearchFieldKey');

  // doctors key
  static final doctorsKey = find.byValueKey('doctorsKey');
  static final doctorListViewBuilderKey = find.byValueKey('doctorListViewBuilderKey');
  static final findYourDoctorSearchKey = find.byValueKey('findYourDoctorSearchKey');
  static final filterIconKey = find.byValueKey('filterIconKey');
  static final filtersKey = find.byValueKey('filtersKey');
  static final deptList2 = find.byValueKey('deptList2');
  static final deptList5 = find.byValueKey('deptList5');
  static final speciality2 = find.byValueKey('speciality2');
  static final speciality3 = find.byValueKey('speciality3');
  static final applyFilterButtonKey = find.byValueKey('applyFilterButtonKey');
  static final filteredResultKey = find.byValueKey('filteredResultKey');
  static final clearFilterButton = find.byValueKey('clearFilterButton');


  //appointment history
  static final appointmentBottomNavbarKey = find.byValueKey('appointmentBottomNavbarKey');
  static final appointmentsAppbarKey = find.byValueKey('appointmentsAppbarKey');
  static final completedAppointmentsKey = find.byValueKey('completedAppointmentsKey');
  static final noCompletedAppointments = find.byValueKey('noCompletedAppointments');
  static final rebookKey0 = find.byValueKey('rebookKey0');
  static final rebookKey8 = find.byValueKey('rebookKey8');
  static final viewPrescriptionKey0 = find.byValueKey('viewPrescriptionKey0');
  static final completedSearchKey = find.byValueKey('completedSearchKey');
  static final completedSearchIconKey = find.byValueKey('completedSearchIconKey');
  static final completedSearchFieldKey = find.byValueKey('completedSearchFieldKey');
  static final noPendingAppointmentKey = find.byValueKey('noPendingAppointmentKey');
  static final joinVideoConsultationKey0 = find.byValueKey('joinVideoConsultationKey4');
  static final joinVideoConsultationKey4 = find.byValueKey('joinVideoConsultationKey0');
  static final notCompletedSearchIconKey = find.byValueKey('notCompletedSearchIconKey');
  static final notCompletedSearchKey = find.byValueKey('notCompletedSearchKey');
  static final notCompletedSearchFieldKey = find.byValueKey('notCompletedSearchFieldKey');

  //book your appointment key
  static final bookNowKey0 = find.byValueKey('bookNowKey0');
  static final bookNowKey8 = find.byValueKey('bookNowKey8');
  static final bookYourAppointmentAppbarKey = find.byValueKey('bookYourAppointmentAppbarKey');
  static final selectAppointmentDateKey = find.byValueKey('selectAppointmentDateKey');
  static final availableSlot0 = find.byValueKey('availableSlot0');
  static final availableSlot10 = find.byValueKey('availableSlot10');
  static final proceedButtonKey = find.byValueKey('proceedButtonKey');
  static final forMeKey = find.byValueKey('forMeKey');
  static final addPatientKey = find.byValueKey('addPatientKey');
  static final consultTypeForMeKey = find.byValueKey('consultTypeForMeKey');
  static final consultFeeFroMe = find.byValueKey('consultFeeFroMe');
  static final confirmBookingKey = find.byValueKey('confirmBookingKey');
  static final selectAddPatientType = find.byValueKey('selectAddPatientType');
  static final selectTypeHintKey = find.byValueKey('selectTypeHintKey');
  static final familyMemberSelectKey = find.byValueKey('familyMemberSelectKey');
  static final familyMemberHintKey = find.byValueKey('familyMemberHintKey');
  static final familyMemberAppbarKey = find.byValueKey('familyMemberAppbarKey');
  static final selectFamilyMemberKey0 = find.byValueKey('selectFamilyMemberKey0');
  static final consultTypeAddPatientKey = find.byValueKey('consultTypeAddPatientKey');
  static final consultTypeHintTextKey = find.byValueKey('consultTypeHintTextKey');
  static final consultFeeAddPatient = find.byValueKey('consultFeeAddPatient');
  static final appointNameKey = find.byValueKey('appointNameKey');
  static final appointEmailKey = find.byValueKey('appointEmailKey');
  static final appointMobileKey = find.byValueKey('appointMobileKey');
  static final appointAddressKey = find.byValueKey('appointAddressKey');
  static final appointGenderKey = find.byValueKey('appointGenderKey');
  static final genderHintTextKey = find.byValueKey('genderHintTextKey');
  static final appointBirthDateKey = find.byValueKey('appointBirthDateKey');
  static final appointmentSuccessOkButtonKey = find.byValueKey('appointmentSuccessOkButtonKey');
  static final noFamilyMemberKey = find.byValueKey('noFamilyMemberKey');
  static final addNowButtonKey = find.byValueKey('addNowButtonKey');

  //myHealth key
  static final myHealthBottomNavbarKey = find.byValueKey('myHealthBottomNavbarKey');
  static final showPrescriptionKey4 = find.byValueKey('showPrescriptionKey4');
  static final prescriptionsSearchKey = find.byValueKey('prescriptionsSearchKey');
  static final prescriptionSearchFieldKey = find.byValueKey('prescriptionSearchFieldKey');
  static final prescriptionSearchIconKey = find.byValueKey('prescriptionSearchIconKey');
  static final prescriptionDownloadKey4 = find.byValueKey('prescriptionDownloadKey4');
  static final prescriptionShareKey4 = find.byValueKey('prescriptionShareKey4');



}