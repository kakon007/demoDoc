import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/doctor_setup/view/widgets/adress_widget.dart';
import 'package:myhealthbd_app/admin/doctor_setup/view/widgets/other_information.dart';
import 'package:myhealthbd_app/admin/doctor_setup/view/widgets/personal_information_widget.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class AddDoctorSetupScreen extends StatefulWidget {
  const AddDoctorSetupScreen({Key key}) : super(key: key);

  @override
  _AddDoctorSetupScreenState createState() => _AddDoctorSetupScreenState();
}

class _AddDoctorSetupScreenState extends State<AddDoctorSetupScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Setup"),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                //color: Color(0xffE9ECFE),
                elevation: 5,
                child: TabBar(
                  indicatorColor: Color(0xff8592E5),
                  indicatorWeight: 4,
                  tabs: [
                    ...[
                      "Personal Information",
                      "Other Information",
                      'Address',
                    ].map(
                      (e) => FittedBox(
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Text(
                            e,
                            style: GoogleFonts.roboto(
                                color: Color(
                                  0xff354291,
                                ),
                                fontSize: isMobile ? 12 : 20,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PersonalInformation(),
                  OtherInformation(),
                  AdressWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
