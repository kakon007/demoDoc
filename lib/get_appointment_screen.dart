import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/models/previous_appointment_model.dart';
import 'package:myhealthbd_app/features/appointments/models/upcoming_appointment_model.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';

class GetAppointment extends StatefulWidget {
  @override
  _GetAppointmentState createState() => _GetAppointmentState();
}

class _GetAppointmentState extends State<GetAppointment> {
  bool checkedValue=false;
  DateTime pickBirthDate;
  Future<Null> selectBirthDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.appbarPrimary,
            accentColor: AppTheme.appbarPrimary,
            colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 6)),
    );

    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
      });
    }
  }
  String color = "#EAEBED";
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
    var deviceWidth = MediaQuery.of(context).size.width;
    var contrainerWidth = deviceWidth >= 400 ? double.infinity : 400.00;
    var width = MediaQuery.of(context).size.width * 0.44;
    final Widget filtericon = SvgPicture.asset(
      "assets/icons/fliter.svg",
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget calenderIcon = SvgPicture.asset(
      "assets/icons/calen.svg",
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.notes),
        backgroundColor: HexColor('#354291'),
        title: Text('Appointments',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
            },
          )
        ],
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
                                                              padding: const EdgeInsets.only(bottom: 20,left: 1),
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
                                                          padding: const EdgeInsets.only(top:5.0,right: 2,bottom: 8,left: 20),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 3,),
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
                            Container(
                              height: 55,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:12.0,right: 0,top:5,bottom: 3),
                                    child: Container(
                                      width: 320,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                        border: Border.all(color: HexColor('#E1E1E1')),
                                      ),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "  Search here",
                                              style: GoogleFonts.poppins(
                                                color: Colors.grey.withOpacity(0.5),
                                                fontSize: deviceWidth >= 400 ? 20 : 13,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                Icons.search,
                                                color: Colors.grey,
                                                size: 28,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:18.0),
                                    child: GestureDetector(
                                        onTap: (){
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(25),
                                                      topRight: Radius.circular(25))),
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {

                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 20,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left:180.0),
                                                        child: Row(
                                                          children: [
                                                            Text("Filter",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: HexColor('#333132')),),
                                                            SizedBox(width: 100,),
                                                            GestureDetector(onTap: (){
                                                              Navigator.pop(context);
                                                            },child: Icon(Icons.close,size: 30,)),
                                                          ],
                                                        ),
                                                      ),
                                                    SingleChildScrollView(
                                                      child:
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top:15.0,right: 245),
                                                            child: Text(
                                                              'Select Date',style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600,color: HexColor('#333132')),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              selectBirthDate(context);
                                                            },
                                                            child: Container(
                                                              height: 50.0,
                                                              width: MediaQuery.of(context).size.width*0.88,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.transparent,
                                                                  border: Border.all(color: HexColor(color)),
                                                                  borderRadius: BorderRadius.circular(10)),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 15.0),
                                                                    child: Text(
                                                                      pickBirthDate == DateTime.now()
                                                                          ? "Select Date"
                                                                          : "From: 22/02/2021",
                                                                      style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: HexColor('#354291'),)
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(right: 8.0),
                                                                    child: Container(
                                                                        height: 18,
                                                                        child:
                                                                        calenderIcon,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              selectBirthDate(context);
                                                            },
                                                            child: Container(
                                                              height: 50.0,
                                                              width: MediaQuery.of(context).size.width*0.88,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.transparent,
                                                                  border: Border.all(color: HexColor(color)),
                                                                  borderRadius: BorderRadius.circular(10)),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 15.0),
                                                                    child: Text(
                                                                      pickBirthDate == DateTime.now()
                                                                          ? "Select Date"
                                                                          : "To:",
                                                                        style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: HexColor('#354291'),)
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(right: 8.0),
                                                                    child: Container(
                                                                        height: 18,
                                                                        child:
                                                                        calenderIcon,
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(top:15.0,right: 190),
                                                            child: Text(
                                                                'Consultation type',style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600,color: HexColor('#333132')),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex:2,
                                                                child: CheckboxListTile(
                                                                  title: Text("Fresh visit",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 11,color: HexColor('#333132'))),
                                                                  value: checkedValue,
                                                                  onChanged: (newValue) {
                                                                    setState(() {
                                                                      checkedValue = newValue;
                                                                    });
                                                                  },
                                                                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex:2,
                                                                child: CheckboxListTile(
                                                                  title: Text('Report check',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 11,color: HexColor('#333132'))),
                                                                  value: checkedValue,
                                                                  onChanged: (newValue) {
                                                                    setState(() {
                                                                      checkedValue = newValue;
                                                                    });
                                                                  },
                                                                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex:2,
                                                                child: CheckboxListTile(
                                                                  title: Text("Follow up",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 11,color: HexColor('#333132'))),
                                                                  value: checkedValue,
                                                                  onChanged: (newValue) {
                                                                    setState(() {
                                                                      checkedValue = newValue;
                                                                    });
                                                                  },
                                                                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          CheckboxListTile(
                                                            title: Text("2nd Follow up",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 11,color: HexColor('#333132'))),
                                                            value: checkedValue,
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                checkedValue = newValue;
                                                              });
                                                            },
                                                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 22),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: width * .9,
                                                                  height: width * .25,
                                                                  child: FlatButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    textColor:  AppTheme.appbarPrimary,
                                                                    color: HexColor("#FFFFFF"),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(8),
                                                                        side: BorderSide(
                                                                            color: AppTheme
                                                                                .appbarPrimary,
                                                                            width: 1)),
                                                                    child: Text(
                                                                      "Clear Filter",
                                                                      style: GoogleFonts.poppins(),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: width * .9,
                                                                  height: width * .25,
                                                                  child: FlatButton(
                                                                    textColor: Colors.white,
                                                                    onPressed: () {},
                                                                    color:  AppTheme.appbarPrimary,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(8),
                                                                    ),
                                                                    child: Text(
                                                                      "Apply Filter",
                                                                      style: GoogleFonts.poppins(),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                      ,
                                                    )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: filtericon),
                                  )
                                ],
                              ),
                            ),
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
                                                            padding: const EdgeInsets.only(bottom: 20,left: 1),
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
                                                        padding: const EdgeInsets.only(top:5.0,right: 2,bottom: 8,left: 20),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(height: 3,),
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
                                                                    Text("Completed",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,color: HexColor('#32C974'),fontSize: 12),),

                                                                  ],
                                                                ),
                                                              ],
                                                            ),

                                                          ],
                                                        ),

                                                      ),
                                                      SizedBox(height: 5,),
                                                      Row(
                                                        children: [
                                                          Material(
                                                            elevation: 0  ,
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                            color: HexColor("#354291"),
                                                            child: SizedBox(
                                                              width: 165,
                                                              height: 30,
                                                              child: Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text("REBOOK",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w600),),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 20,),
                                                          Material(
                                                            elevation: 0  ,
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                            color: HexColor("#354291"),
                                                            child: SizedBox(
                                                              width: 165,
                                                              height: 30,
                                                              child: Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text("VIEW PRESCRIPTION",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w600),),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
