import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/user_setup/models/modules_models.dart';
import 'package:myhealthbd_app/admin/user_setup/view/widgets/prescription_module_widget.dart';
import 'package:myhealthbd_app/admin/user_setup/view/widgets/settings_security_widget.dart';
import 'package:myhealthbd_app/admin/user_setup/view/widgets/telemedicien_service_widget.dart';

import 'external_service_widget.dart';
import 'feedback.dart';

class Modules extends StatefulWidget {
  @override
  _ModulesState createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrescriptionModuleWidget(),
          ExternalServicesWidget(),
          SettingsSecurityWidget(),
          FeedbackWidget(),
          TelemedicineWidget(),
          // SizedBox(height: 2,),
          // PrescriptionModuleWidget(),
        ],
      ),
    );
  }
}
