import 'package:ffcache/ffcache.dart';
import 'package:myhealthbd_app/features/appointment_history/models/previous_model.dart';
import 'package:myhealthbd_app/features/appointment_history/models/upcoming_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/my_health/models/documents_list_model.dart';
import 'package:myhealthbd_app/features/my_health/models/prescription_list_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/relationship_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';

class CacheKeys {
  static  String prescriptionList (int pageNumber)=> "prescriptionList";
  static final String documentationList='documentationList';
  static final String familyMemberList='familyMemberList';
  static final String familyMemberRelationList='familyMemberRelationList';
  static final String appointmentHistoryUpcomingList='appointmentHistoryUpcomingList';
  static final String appointmentHistoryPreviousList='appointmentHistoryPreviousList';
  static final String hospitalList='hospitalList';
  static final String userDetails='userDetails';
}

class CacheRepositories {
  static final defaultCacheValidateDuration = Duration(days: 7);

  static void setCacheAsDecodeJson(String data, String cacheKey) {
    try {
      FFCache().setStringWithTimeout(
        cacheKey,
        data,
        defaultCacheValidateDuration,
      );
    } catch (e) {
     // logger.e(e);
      print(e);
    }
  }

  //PrescriptionList//

  static Future<PrescriptionListModel> loadCachedPrescriptionList(int startIndex) async {
    try {
      var  stringData= await FFCache().getString(CacheKeys.prescriptionList(startIndex));
      if (stringData != null) {
        var data = prescriptionListModelFromJson(stringData);
        return data;
      }
    } catch (e) {
     // logger.e(e);
      print(e);
    }
    return null;
  }
  
  //Documentation//
  
static Future<DocumentListModel> loadCachedDocumentationList() async{
    try{
      var stringData=await FFCache().getString(CacheKeys.documentationList);
      if(stringData!=null){
        var data=documentListModelFromJson(stringData);
        return data;
      }
    }catch(e){
      print(e);
    }
    return null;
}
//Patient Info//
  static Future<UserDetailsModel> loadCachedUserDetails()async{
    try{
      var stringData=await FFCache().getString(CacheKeys.userDetails);
      if (stringData!=null) {
        var data=userDetailsModelFromJson(stringData);
        return data;
      }
    }catch(e){
      print(e);
    }
    return null;
  }
//Hospital List//
  static Future<HospitalListModel> loadCachedHospital()async{
    try{
      var stringData=await FFCache().getString(CacheKeys.hospitalList);
      if (stringData!=null) {
        var data=hospitalListModelFromJson(stringData);
        return data;
      }
    }catch(e){
      print(e);
    }
    return null;
  }
//Appointment History Upcoming//
  static Future<AppointmentUpcomingModel> loadCachedAppointmentHistoryUpcoming()async{
    try{
      var stringData=await FFCache().getString(CacheKeys.appointmentHistoryUpcomingList);
      if (stringData!=null) {
        var data=appointmentUpcomingModelFromJson(stringData);
        return data;
      }
    }catch(e){
      print(e);
    }
    return null;
  }

  //Appointment History Previous//
  static Future<AppointmentPreviousModel> loadCachedAppointmentHistoryPrevious()async{
    try{
      var stringData=await FFCache().getString(CacheKeys.appointmentHistoryPreviousList);
      if (stringData!=null) {
        var data=appointmentPreviousModelFromJson(stringData);
        return data;
      }
    }catch(e){
      print(e);
    }
    return null;
  }
//FamilyMemberList//
  static Future<GetFamilyMember> loadCachedFamilyMembers()async{
    try{
      var stringData=await FFCache().getString(CacheKeys.familyMemberList);
      if (stringData!=null) {
        var data=getFamilyMemberFromJson(stringData);
        return data;
      }
    }catch(e){
      print(e);
    }
    return null;
  }
//Family memberRelationList//
  static Future<RelationshipModel> loadCachedFamilyMemberRelationList() async{
    try{
      var stringData=await FFCache().getString(CacheKeys.familyMemberRelationList);
      if(stringData!=null){
        var data=relationshipModelFromJson(stringData);
        return data;
      }
    }catch(e){
      print(e);
    }
    return null;
  }
}
