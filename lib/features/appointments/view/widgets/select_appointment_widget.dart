import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'available_slots_widget.dart';
class SelectAppointTime extends StatefulWidget {
  @override
  _SelectAppointTimeState createState() => _SelectAppointTimeState();
}

class _SelectAppointTimeState extends State<SelectAppointTime> {
  DateTime pickedAppointDate;
  Future<Null> selectAppointDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime(2003),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null && date != pickedAppointDate) {
      setState(() {
        pickedAppointDate = date;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    pickedAppointDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var spaceBetween= SizedBox(height: 10,);
    var height = MediaQuery.of(context).size.height;
    String _formatDate = DateFormat("dd/MM/yyyy").format(pickedAppointDate);
    var appointmentDate = Row(
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
              spaceBetween,
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
            selectAppointDate(context);
          },
        ),
      ],
    );
    var proceedButton=         Container(
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
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appointmentDate,
        spaceBetween,
        Text("Available Slots",
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        spaceBetween,
        AvailableSlots(),
        spaceBetween,
        proceedButton,
        spaceBetween,
      ],
    );
  }
}
