import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/view/availableslots_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  DateTime pickedDate;
  Future<Null> selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 6)),
    );
    if (date != null && date != pickedDate) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
  }

  List<AvailableSlotsModel> slots = [
    AvailableSlotsModel(
      serialNumber: "1",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "2",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "3",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "4",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "5",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "6",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "7",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    double _crossAxisSpacing = 8, _mainAxisSpacing = 10, _aspectRatio = .5;
    int _crossAxisCount = 4;
    String _formatDate = DateFormat("dd/MM/yyyy").format(pickedDate);
    print(_formatDate);
    var date = Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20.0,
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Text("Select Date",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  )),
              SizedBox(height: 10,),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#D6DCFF")),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$_formatDate",
                        style: GoogleFonts.poppins(
                            color: AppTheme.signInSignUpColor, fontSize: 13.0),
                      ),
                      Container(
                          height: 18,
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: AppTheme.appbarPrimary,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            selectDate(context);
          },
        ),
      ],
    );
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
            title: new Text(
              "Book your appointment",
              style: GoogleFonts.poppins(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {},
              )
            ],
            leading: new IconButton(
                icon: new Icon(Icons.notes),
                onPressed: () => _scaffoldKey.currentState.openDrawer())),
        drawer: new Drawer(),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: HexColor("#FFFFFF"),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("#0D1231").withOpacity(0.08),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        date,
                        SizedBox(
                          height: 20,
                        ),
                        Text("Available Slots",
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10,),
                        Expanded(
                            child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: slots.length,
                          itemBuilder: (context, index) => Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      stops: [
                                        1.0,
                                        1.0
                                      ],
                                      colors: [
                                        HexColor('#8592E5'),
                                        HexColor('#F6F8FB'),
                                      ]),
                                  border: Border.all(
                                    color: HexColor("#8592E5"),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: height<=800 ? height/100 :height / 65.09),
                                      child: Center(
                                          child: Text(
                                        "Serial - " + slots[index].serialNumber,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppTheme.signInSignUpColor),
                                      )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: height<= 800 ? height/70: height / 56),
                                      child: Center(
                                          child: Text(
                                        "Time : " + slots[index].time,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _crossAxisCount,
                            crossAxisSpacing: _crossAxisSpacing,
                            mainAxisSpacing: _mainAxisSpacing,
                            childAspectRatio: _aspectRatio,
                          ),
                        )),
                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppTheme.appbarPrimary,
                            onPressed: () {},
                            textColor: Colors.white,
                            child: Text(
                              "Proceed",
                              style: GoogleFonts.poppins(
                                  fontSize: height <= 600 ? 8 : 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#FFFFFF"),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("#0D1231").withOpacity(0.08),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              child: Image.asset(
                                "assets/images/doctor.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CARDIOLOGIST",
                                style: GoogleFonts.poppins(
                                    color: AppTheme.appbarPrimary,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Md. Sohel Rana",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text("Assistant Professor",
                                  style: GoogleFonts.poppins()),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Fee: 200 - 700 BDT",
                                style: GoogleFonts.poppins(
                                  color: AppTheme.appbarPrimary,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
