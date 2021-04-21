import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/prescription_view_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/filter_view_model.dart';
import 'package:myhealthbd_app/features/videos/view_models/video_view_model.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/root.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/appointments/view_model/appoinment_fee_view_model.dart';
import 'features/find_doctor/view_model/doctor_list_view_model.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs= await SharedPreferences.getInstance();
  var accessToken = prefs.getString('accessToken');
  print(accessToken);
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
    ChangeNotifierProvider< AppointFeeViewModel>(create: (context) =>  AppointFeeViewModel()),
  ];
  FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepOrange,
  );
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Root(accessToken: accessToken)),
    ),
  );
}

