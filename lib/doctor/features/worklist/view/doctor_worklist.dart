import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view/widgets/completed_worklist.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view/widgets/wating_worklist.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
class Worklist extends StatefulWidget {
  @override
  _WorklistState createState() => _WorklistState();
}

class _WorklistState extends State<Worklist> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    //var vm2 = Provider.of<UserImageViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var dateSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(
              minHeight: 120,
              minWidth: width<=330 ? width*.9 : width*.92,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor("#FFFFFF"),
              boxShadow: [
                BoxShadow(
                  color: HexColor("#0D1231").withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: GoogleFonts.poppins(
                          fontSize: isTablet
                              ? 20
                              : width <= 330
                                  ? 13
                                  : 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 45,
                      width: width<= 330? 110 : 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: HexColor("#6374DF"), // set border color
                          //width: 3.0
                        ), // set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)), // set rounded corner radius
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '22/12/18',
                            style: GoogleFonts.poppins(
                                fontSize: isTablet
                                    ? 20
                                    : width <= 330
                                        ? 12
                                        : 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/calendoc.svg",
                            //key: Key('filterIconKey'),
                            width: 10,
                            height: 18,
                            fit: BoxFit.fitWidth,
                            allowDrawingOutsideViewBox: true,
                            matchTextDirection: true,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To',
                      style: GoogleFonts.poppins(
                          fontSize: isTablet
                              ? 20
                              : width <= 330
                                  ? 13
                                  : 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 45,
                      width: width<= 330? 110 : 140,
                      decoration: BoxDecoration(
                        color: HexColor("#EFF5FF"),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)), // set rounded corner radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/calendoc.svg",
                              //key: Key('filterIconKey'),
                              width: 10,
                              height: 18,
                              fit: BoxFit.fitWidth,
                              allowDrawingOutsideViewBox: true,
                              matchTextDirection: true,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    var watingTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 1;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .28,
        decoration: BoxDecoration(
            color: index == 1 ? AppTheme.buttonActiveColor : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: Center(
            child: Text(
          'Waiting',
          style: GoogleFonts.poppins(
              fontSize: isTablet? 14 :12,
              color: index == 1 ? Colors.white : Colors.black,
              fontWeight: index == 1 ? FontWeight.w600 : FontWeight.normal),
        )),
      ),
    );
    var completedTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 2;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .28,
        decoration: BoxDecoration(
            color: index == 2 ? AppTheme.buttonActiveColor : Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Center(
            child: Text(
          'Completed',
          style: GoogleFonts.poppins(
              fontSize: isTablet? 14 : 12,
              color: index == 2 ? Colors.white : Colors.black,
              fontWeight: index == 2 ? FontWeight.w600 : FontWeight.normal),
        )),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.notes,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          "Worklist",
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Date',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize:isTablet? 17 : 15),
                  ),
                  spaceBetween,
                  dateSection,
                  spaceBetween,
                  spaceBetween,
                  Text(
                    'Worklist',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize:isTablet? 17 : 15),
                  ),
                  spaceBetween,
                  spaceBetween,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: HexColor("#FFFFFF"),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#0D1231").withOpacity(0.08),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(3, 1), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: index == 1
                            ? WaitingWorkList()
                            : CompletedWorkList()),
                  ),
                  spaceBetween,
                ],
              ),
            ),
            Positioned(
              top: 210,
              right: MediaQuery.of(context).size.width * .22,
              left: MediaQuery.of(context).size.width * .22,
              child: Container(
                //alignment:Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#0D1231").withOpacity(0.08),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                height: 40, width: MediaQuery.of(context).size.width * .5,
                child: Row(
                  children: [
                    watingTab,
                    completedTab,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
