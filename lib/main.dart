import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_banner.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/new_view.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_circular_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_textformfield.dart';
import 'main_app/test_screen2.dart';
import 'main_app/views/widgets/common_prompt_dialog.dart';
import './main_app/resource/strings_resource.dart';
import './main_app/views/widgets/please_sign_in_widget.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterDownloader.initialize(debug: true);
  // user trust SSL certificate for iss.ishraak.com socket server
  //if (Platform.isAndroid)  _loadCertificate();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //setupLocator();
  FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepOrange,
      //values: FlavorValues(baseUrl: kBaseUrDev)
  );
  runApp(
    HomeScreen(),
  );
}

