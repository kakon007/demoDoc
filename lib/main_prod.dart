import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_banner.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/main_app/home.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  //await FlutterDownloader.initialize(debug: true);
  // user trust SSL certificate for jobxprss.com

 // if (!Platform.isWindows)   _loadCertificate();

  //setupLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlavorConfig(
    flavor: Flavor.PRODUCTION,
    color: Colors.deepPurpleAccent,
    //values: FlavorValues(baseUrl: kBaseUrlProd),
  );
  runApp(
    HomeScreen(),
  );
}