import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/features/dashboard/repositories/hospital_list_repository.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_view_model.dart';
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
  var providers=[
    ChangeNotifierProvider<HospitalListViewModel>(create: (context) => HospitalListViewModel()),
    ChangeNotifierProvider<NewsViewModel>(create: (context) => NewsViewModel()),
  ];
  runApp(
     MultiProvider(
       providers: providers,
       child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Root()
            ),
     )

        );

}

