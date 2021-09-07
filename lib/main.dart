import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/my_health_bd_app.dart';
import 'package:provider/provider.dart';

import 'features/book_test/view/order_confirmation_screen_after_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FlavorConfig(
    flavor: Flavor.DEV,
    color: Colors.deepPurpleAccent,
  );
  runApp(
    // ChangeNotifierProvider(
    //     create: (context) => AccessTokenProvider(), child: MyHealthBdApp()),
    MaterialApp(home: OrderConfirmationAfterSignIn()),
  );
}
