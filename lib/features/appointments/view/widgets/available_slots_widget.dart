import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

import '../../models/availableslots_model.dart';
class AvailableSlots extends StatefulWidget {
  @override
  _AvailableSlotsState createState() => _AvailableSlotsState();
}

class _AvailableSlotsState extends State<AvailableSlots> {
  double _crossAxisSpacing = 8, _mainAxisSpacing = 10, _aspectRatio = .5;
  int _crossAxisCount = 4;
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
    return Expanded(
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height <= 800
                              ? height / 110
                              : height / 65.09),
                      child: Center(
                          child: Text(
                            "Serial - " +
                                slots[index].serialNumber,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme
                                    .appbarPrimary),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height <= 800
                              ? height / 100
                              : height / 56),
                      child: Center(
                          child: Text(
                            "Time : " + slots[index].time,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
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
        ));
  }
}
