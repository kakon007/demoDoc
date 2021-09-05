import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class PatientDermographyWidget extends StatefulWidget {
  const PatientDermographyWidget({Key key}) : super(key: key);
  @override
  _PatientDermographyWidgetState createState() =>
      _PatientDermographyWidgetState();
}

class _PatientDermographyWidgetState extends State<PatientDermographyWidget> {
  bool showReport = false;
  TextEditingController controller = TextEditingController();
  List<String> chiefComplaintSelectedItems = [];

  @override
  Widget build(BuildContext context) {
    //var vm = context.watch<ChiefComplaintViewModel>();
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    return PrescriptionCommonWidget(
      controller: expandableControllers.patientDemographyController,
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      isFixed: true,
      showReport: showReport,
      title: "Patient Demography",
      expandedWidget: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 5, right: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        //color:HexColor('#F0F2FF'),
                        borderRadius: BorderRadius.circular(25),
                      ),

                      // height: 60,
                      //width: 20,
                      child: SvgPicture.asset(
                        "assets/icons/userna.svg",
                        fit: BoxFit.fill,
                        width: deviceWidth > 650
                            ? 100
                            : deviceWidth <= 360
                                ? 50
                                : 60,
                        height: deviceWidth > 650
                            ? 100
                            : deviceWidth <= 360
                                ? 50
                                : 60,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Md. Arman',
                    style: GoogleFonts.poppins(
                        // color: HexColor(
                        //   '#354291',
                        // ),
                        fontSize: isTablet
                            ? 20
                            : width <= 330
                                ? 16
                                : 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'Age: ',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333333),
                            fontSize: isTablet
                                ? 20
                                : width <= 330
                                    ? 13
                                    : 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '28Y 10D',
                        style: GoogleFonts.poppins(
                          color: Color(0xff333333),
                          fontSize: isTablet
                              ? 20
                              : width <= 330
                                  ? 13
                                  : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Gender: ',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333333),
                            fontSize: isTablet
                                ? 20
                                : width <= 330
                                    ? 13
                                    : 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Male',
                        style: GoogleFonts.poppins(
                          color: Color(0xff333333),
                          fontSize: isTablet
                              ? 20
                              : width <= 330
                                  ? 13
                                  : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Blood Group: ',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333333),
                            fontSize: isTablet
                                ? 20
                                : width <= 330
                                    ? 13
                                    : 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'A+',
                        style: GoogleFonts.poppins(
                          color: Color(0xff333333),
                          fontSize: isTablet
                              ? 20
                              : width <= 330
                                  ? 13
                                  : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Phone No: ',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333333),
                            fontSize: isTablet
                                ? 20
                                : width <= 330
                                    ? 13
                                    : 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '01962823006',
                        style: GoogleFonts.poppins(
                          color: Color(0xff333333),
                          fontSize: isTablet
                              ? 20
                              : width <= 330
                                  ? 13
                                  : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
