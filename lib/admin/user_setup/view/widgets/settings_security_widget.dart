import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/user_setup/models/modules_models.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

class SettingsSecurityWidget extends StatefulWidget {
  @override
  _SettingsSecurityWidgetState createState() =>
      _SettingsSecurityWidgetState();
}

class _SettingsSecurityWidgetState extends State<SettingsSecurityWidget> {
  List<FeatureDtosList> data = [
    FeatureDtosList(featureName: 'Prescription Work List',isGranted: true,isChecked: false),
    FeatureDtosList(featureName: 'Prescription Global',isGranted: true,isChecked: false),
    FeatureDtosList(featureName: 'Prescription',isGranted: false,isChecked: false),
    FeatureDtosList(featureName: 'Prescription List',isGranted: false,isChecked: false),
    FeatureDtosList(featureName: 'Nurse Station',isGranted: false,isChecked: false),
  ];
  bool isTapped = false;
  bool prescriptionWorkList = false;
  bool prescriptionGlobal = false;
  bool video = false;
  bool doctorSetup = false;
  bool dosageSetup = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Container(
              width: width,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xffEFF5FF),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.2),
                //     spreadRadius: 5,
                //     blurRadius: 5,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(color: Color(0XFFAFBBFF)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Settings & Security',
                                style: GoogleFonts.poppins(fontSize: 15),
                              )),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(isTapped
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined)),
                ],
              ),
            ),
          ),
        ),
        isTapped
            ? Column(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(color: Color(0xffEFF5FF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: Text(
                      'Prescription',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      activeColor: Color(0xff141D53),
                                      value: data[index].isChecked,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.data[index].isChecked = value;
                                        });
                                      }),
                                  Text(
                                    data[index].featureName,
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 2,),
                          ],
                        );
                      })
                ],
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(color: Color(0xffEFF5FF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: Text(
                      'Setup',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      activeColor: Color(0xff141D53),
                                      value: data[index].isChecked,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.data[index].isChecked = value;
                                        });
                                      }),
                                  Text(
                                    data[index].featureName,
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 2,),
                          ],
                        );
                      })
                ],
              ),
            ),
          ],
        )
            : SizedBox(),
      ],
    );
  }
}
