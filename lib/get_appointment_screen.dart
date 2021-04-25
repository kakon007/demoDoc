import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/models/previous_appointment_model.dart';
import 'package:myhealthbd_app/features/appointments/models/upcoming_appointment_model.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';

class GetAppointment extends StatefulWidget {
  @override
  _GetAppointmentState createState() => _GetAppointmentState();
}

class _GetAppointmentState extends State<GetAppointment> {

  List<Upcoming> upComingList = [
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'
    ),
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'),
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'),
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'),
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'),
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'),
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'),
    Upcoming(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'),
  ];

  List<Previousappointment> previousList=[
    Previousappointment(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'
    ),
    Previousappointment(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'
    ),
    Previousappointment(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'
    ),
    Previousappointment(
        reportName: 'Dr. Md. Nazmul Hoque',
        day: 'Gastroenterologist',
        hosName: 'Apollo Hospital Bangladesh(Mirpur Branch)'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var cardWidth = MediaQuery.of(context).size.width * 0.3435;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text('Appointments'),
      ),
      body:
      DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: HexColor('#E9ECFE'),
                child: TabBar(
                  indicatorColor: HexColor('#8592E5'),
                  indicatorWeight:4,
                  tabs: [
                    Container(
                      height: 40,
                      //width: 10.0,
                      child:Center(child: Text('Upcoming',style: GoogleFonts.roboto(color: HexColor('#354291',),fontWeight: FontWeight.w500),)),
                    ),
                    Container(
                      height: 40,
                      child: Center(child: Text('Previous',style: GoogleFonts.roboto(color: HexColor('#354291'),fontWeight: FontWeight.w500),)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  WillPopScope(
                    child: Scaffold(
                        body:
                        Column(
                          children: [
                            Expanded(
                              child:
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child:
                                ListView.builder( physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:upComingList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      //print("LIIIISSSYYSY:::" + list[index].consultationId);
                                      return  Stack(
                                            children:[
                                              InkWell(
                                                child: Container(
                                                  height: cardHeight*1.7,
                                                  margin: EdgeInsets.only(top: 8,bottom: 5,right: 10,left: 10),
                                                  decoration: BoxDecoration(
                                                    color:HexColor('#F0F2FF'),
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left:10.0,right:10),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 60,
                                                              //width: 20,
                                                              child: Image.asset('assets/images/aapoin.png'),
                                                            ),
                                                            SizedBox(width: 5,),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top:5.0,bottom: 8,left: 1),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(height: 8,),
                                                                  Text(upComingList[index].reportName,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#393939'),fontSize: 12),),
                                                                  Text(upComingList[index].day,style: GoogleFonts.poppins(color: HexColor('#354291'),fontSize: 12,fontWeight: FontWeight.w500),),
                                                                  Container(width:260,child: Text(upComingList[index].hosName,maxLines: 1,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(color: HexColor('#354291'),fontSize: 12))),
                                                                ],
                                                              ),

                                                            ),
                                                            // Container(width:45,child: rx),
                                                            // (controller.isSelecting)?
                                                            // Padding(
                                                            //   padding: const EdgeInsets.only(bottom:40.0,right: 10),
                                                            //   child: righticon,
                                                            // ):


                                                          ],
                                                        ),
                                                        Divider(thickness: 1,),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:8.0,right: 2,bottom: 8,left: 20),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 5,),
                                                              Row(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text("Serial No: ",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#333132'),fontSize: 12),),
                                                                      Text("01",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#8592E5'),fontSize: 12),),

                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 10,),
                                                                  Row(
                                                                    children: [
                                                                      Text("Date: ",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#333132'),fontSize: 12),),
                                                                      Text("Monday 25-01-2021",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#8592E5'),fontSize: 12),),

                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 10,),
                                                                  Row(
                                                                    children: [
                                                                      Text("Time: ",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#333132'),fontSize: 12),),
                                                                      Text("05:47 PM",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#8592E5'),fontSize: 12),),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Row(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text("Consultation Type: ",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#333132'),fontSize: 12),),
                                                                      Text("Fresh visit",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#8592E5'),fontSize: 12),),

                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 10,),
                                                                  Row(
                                                                    children: [
                                                                      Text("Status: ",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#333132'),fontSize: 12),),
                                                                      Text("Waiting",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#EEB329'),fontSize: 12),),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),

                                                            ],
                                                          ),

                                                        ),
                                                        SizedBox(height: 5,),
                                                        Material(
                                                          elevation: 2  ,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                          color: HexColor("#354291"),
                                                          child: SizedBox(
                                                            width: double.infinity,
                                                            height: 35,
                                                            child: Center(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text("START CONSULTING",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        );
                                    }),
                              ),
                            ),
                          ],
                        )

                    ),
                  ),


                  //Previous Appointment

                  WillPopScope(
                    child: Scaffold(
                        body:

                        Column(
                          children: [
                            Expanded(
                              child:
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child:

                                ListView.builder( physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:previousList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      //print("LIIIISSSYYSY:::" + list[index].consultationId);
                                      return  Stack(
                                          children:[
                                            InkWell(
                                              child: Container(

                                                height: cardHeight*0.8,
                                                margin: EdgeInsets.only(top: 8,bottom: 5,right: 10,left: 10),
                                                decoration: BoxDecoration(
                                                  // gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                                                  //   1.0,
                                                  //   1.0
                                                  // ], colors: [
                                                  //   HexColor('#C5CAE8'),
                                                  //   HexColor('#E9ECFE'),
                                                  //
                                                  // ]),
                                                  // //color: Colors.white,
                                                  // // border: Border.all(
                                                  // //   color: HexColor("#E9ECFE"),
                                                  // //   width: 1,
                                                  // // ),
                                                  color:HexColor('#F0F2FF'),
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 31,
                                                      backgroundColor: HexColor('#354291').withOpacity(0.2),
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor: Colors.white,
                                                        child: CircleAvatar(
                                                          backgroundImage: AssetImage('assets/images/proimg.png'),
                                                          radius: 28,
                                                        ),
                                                      ),
                                                    ),
                                                    //SizedBox(width: 5,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:8.0,right: 8,bottom: 8,left: 1),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(height: 8,),
                                                          Text(previousList[index].hosName,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),),
                                                          Text(previousList[index].day,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
                                                          SizedBox(height: 8,),
                                                          Container(width:200,child: Text(upComingList[index].day,maxLines: 1,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 12,fontWeight: FontWeight.w600))),
                                                          Text(previousList[index].day,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w600))
                                                        ],
                                                      ),

                                                    ),
                                                    // Container(width:45,child: rx),
                                                    // (controller.isSelecting)?
                                                    // Padding(
                                                    //   padding: const EdgeInsets.only(bottom:40.0,right: 10),
                                                    //   child: righticon,
                                                    // ):


                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]
                                      );
                                    }),
                              ),
                            ),
                          ],
                        )

                    ),
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
