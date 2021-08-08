import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/view/appointments_screen.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatelessWidget {
  String jobTitle;
  Image image;
  String titleText;
  String subTitleText;
  String undersubtitle;
  String images;
  String consultationFee;
  String designation;
  String doctorNo;
  String companyNo;
  String orgNo;
  String hospitalName;
  String phoneText;
  int index;

  CustomContainer(
      this.jobTitle,
      this.image,
      this.titleText,
      this.subTitleText,
      this.undersubtitle,
      this.images,
      this.consultationFee,
      this.designation,
      this.doctorNo,
      this.companyNo,
      this.orgNo,
      this.hospitalName,
      this.phoneText,
      this.index);

  @override
  Widget build(BuildContext context) {
    var vm2 = Provider.of<AvailableSlotsViewModel>(context, listen: true);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var height = MediaQuery.of(context).size.height;
    var cardWidth = MediaQuery.of(context).size.width * 0.3435;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 6, right: 13, left: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: HexColor("#E9ECFE"),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: image,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#FFFFFF"),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: width,
                          child: Text(
                            titleText,
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700),
                          )),
                      Container(
                          child: Text(
                        subTitleText,
                        style: GoogleFonts.poppins(
                            color: HexColor("#354291"),
                            fontSize: isTablet
                                ? 15
                                : width < 350
                                    ? 8
                                    : 10,
                            fontWeight: FontWeight.bold),
                      )),
                      designation == ''
                          ? SizedBox()
                          : Container(
                              // constraints: BoxConstraints(minHeight: 30,),
                              //height: 30,
                              child: Text(
                              designation,
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet
                                      ? 15
                                      : width < 350
                                          ? 8
                                          : 10,
                                  color: HexColor('#757577')),
                            )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TK. " + consultationFee,
                            style: GoogleFonts.poppins(
                                color: HexColor("#354291"),
                                fontSize: isTablet ? 15 : 10,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  minHeight: isTablet
                                      ? 35
                                      : width < 350
                                          ? 20
                                          : 30,
                                ),
                                child: Material(
                                  color: HexColor("#354291"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      vm2.getInfo(doctorNo, companyNo, orgNo);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return AppointmentScreen(
                                          companyNo: companyNo,
                                          doctorNo: doctorNo,
                                          orgNo: orgNo,
                                          hospitalName: hospitalName,
                                          phoneNumber: phoneText,
                                        );
                                      }));
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                                        child: Text(
                                          "Book Now",
                                          key: Key('bookNowKey$index'),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
