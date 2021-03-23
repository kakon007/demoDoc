import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/root.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepOrange,
  );
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Root()),
  );
}

