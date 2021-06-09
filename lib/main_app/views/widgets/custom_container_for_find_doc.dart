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
  Image logo;
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
  CustomContainer(@required this.jobTitle,@required this.logo,@required this.titleText,@required this.subTitleText,@required this.undersubtitle,@required this.images, this.consultationFee,this.designation, this.doctorNo, this.companyNo, this.orgNo,this.hospitalName);
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
   print("height ${MediaQuery.of(context).size.width}");
    return Container(
      height: isTablet? 150 : width<350 ? 120 : 162,
      margin: EdgeInsets.only(top: 6,bottom: 6,right: 14,left: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: HexColor("#E9ECFE"),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: cardHeight *0.1,
              // ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  child: logo,

              ),
              SizedBox(
                width: isTablet? cardHeight *0.3 : MediaQuery.of(context).size.height > 650 ? cardHeight *0.2 : cardHeight *0.1,
              ),
              Container(
                width: isTablet? width*.65 : width<350 ?cardWidth*1.73:  cardWidth*1.62,
                height: width <350 ? 118 : 140,
                decoration: BoxDecoration(
                  color: HexColor("#FFFFFF"),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 10, top: 5),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: isTablet? 30 : 39,
                          width: width,
                          child: Text(titleText, style: GoogleFonts.poppins(fontSize: isTablet? 18 : width<350 ? 10 : 14, fontWeight: FontWeight.w700),)),
                      Container(height: 18,child: Text(subTitleText, style: GoogleFonts.poppins(color:  HexColor("#354291"), fontSize: isTablet? 15 : width <350 ? 8 : 10,fontWeight: FontWeight.bold ),)),
                      Container(height: 30,child: Text(designation, style: GoogleFonts.poppins(fontSize:  isTablet? 15 : width <350 ? 8 :10, color: HexColor('#757577')),)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TK. " + consultationFee ,style: GoogleFonts.poppins(color:  HexColor("#354291"), fontSize:isTablet ? 15 :  10,fontWeight: FontWeight.w600 ),),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  vm2.getInfo(doctorNo, companyNo, orgNo);
                                  Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return AppointmentScreen(companyNo: companyNo, doctorNo: doctorNo,orgNo: orgNo, hospitalName: hospitalName,);
                                  }));
                                },
                                child: Container(
                                  width:  isTablet? cardHeight*1.2 : width <350 ? 60 : cardWidth*0.7,
                                  height:  isTablet? 35 : width <350 ? 20 :30,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                  color: HexColor("#354291")
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Book Now",
                                      style: GoogleFonts.poppins(fontSize: isTablet? 15 : width <350 ? 8 : 10,color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              //SizedBox(width: 20,)
                            ],
                          )
                        ],
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