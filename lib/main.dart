import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/features/dashboard/repositories/hospital_list_repository.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/root.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepOrange,
  );
  runApp(
    ChangeNotifierProvider<HospitalListViewModel>(
        create: (context) => HospitalListViewModel(),
        child: Builder(builder: (context) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Root()
          );

        })));

}

