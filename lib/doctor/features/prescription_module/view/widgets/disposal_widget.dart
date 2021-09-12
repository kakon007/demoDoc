import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

enum SingingCharacter { lafayette, jefferson }

class DisposalWidget extends StatefulWidget {
  const DisposalWidget({Key key}) : super(key: key);

  @override
  _DisposalWidgetState createState() => _DisposalWidgetState();
}

class _DisposalWidgetState extends State<DisposalWidget> {
  bool showReport = false;
  TextEditingController _date = new TextEditingController();

  SingingCharacter _character = SingingCharacter.lafayette;

  Future<Null> _selectDate(BuildContext context) async {
    var templateVm =
        Provider.of<GetTamplateDataViewModel>(context, listen: false);
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: templateVm.disposalSelectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050, 1));
    if (picked != null && picked != templateVm.disposalSelectedDate)
      setState(() {
        templateVm.disposalSelectedDate = picked;
        var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
        _date.value = TextEditingValue(text: "${formattedDate.toString()}");
      });
  }

  @override
  Widget build(BuildContext context) {
    var templateVm = Provider.of<GetTamplateDataViewModel>(context);
    // var vm = context.watch<ProcedureViewModel>();
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var selectDisposal = DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      icon: Icon(Icons.keyboard_arrow_down_sharp),
      value: templateVm.chosenDisposalValue,
      //elevation: 5,
      style: TextStyle(color: Colors.black),
      items: <String>[
        'N/A',
        'Follow Up',
        'Hospitalized',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: isMobile ? 14 : 18),
          ),
        );
      }).toList(),
      hint: Text(
        "N/A",
        style: TextStyle(color: Colors.black, fontSize: isMobile ? 14 : 18),
      ),
      onChanged: (String value) {
        setState(() {
          templateVm.chosenDisposalValue = value;
        });
      },
    ));
    String _formatDate =
        DateFormat("dd/MM/yyyy").format(templateVm.disposalSelectedDate);
    var width = MediaQuery.of(context).size.width;
    var date = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                margin: EdgeInsets.only(bottom: 15),
                width: isTablet
                    ? width * .3
                    : width <= 330
                        ? MediaQuery.of(context).size.width * .3
                        : MediaQuery.of(context).size.width * .3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#808080")),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$_formatDate",
                        style: GoogleFonts.poppins(
                            color: AppTheme.signInSignUpColor,
                            fontSize: isTablet ? 18 : 13.0),
                      ),
                      Container(
                          height: 25,
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: HexColor("#808080"),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            _selectDate(context);
          },
        ),
      ],
    );
    var selectDuration = DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
        },
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        value: templateVm.disposalDurationType,
        //elevation: 5,
        style: TextStyle(color: Colors.black),
        items: <String>[
          'Days',
          'Weeks',
          'Months',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: isMobile ? 14 : 18),
            ),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            "Duration Type",
            style: TextStyle(color: Color(0xffD2D2D2), fontSize: 12),
          ),
        ),
        onChanged: (String value) {
          setState(() {
            templateVm.disposalDurationType = value;
            if (templateVm.disposalDurationType.toString().toLowerCase() ==
                'days') {
              templateVm.disposalSelectedDate = DateTime.now().add(Duration(
                  days: int.parse(templateVm.disposalDurationController.text)));
            } else if (templateVm.disposalDurationType
                    .toString()
                    .toLowerCase() ==
                'months') {
              templateVm.disposalSelectedDate = DateTime.now().add(Duration(
                  days: int.parse(templateVm.disposalDurationController.text) *
                      30));
            } else {
              templateVm.disposalSelectedDate = DateTime.now().add(Duration(
                  days: int.parse(templateVm.disposalDurationController.text) *
                      7));
            }
            // setState(() {
            //   // if(v.toString()==null || v.toString()==''){
            //   //   templateVm.disposalSelectedDate = DateTime.now();
            //   // }
            //   // else{
            //   //
            //   // }
            // });
          });
        },
      ),
    );

    return PrescriptionCommonWidget(
      controller: expandableControllers.disposalController,
      onChangeShowReport: (bool val) {
        templateVm.disposalShowReport = val;
        setState(() {});
      },
      showReport: templateVm.disposalShowReport,
      title: "Disposal",
      expandedWidget: Container(
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(0.0),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffEFF5FF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: selectDisposal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            templateVm.chosenDisposalValue == "Follow Up"
                ? Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: DoctorFormField(
                            controller: templateVm.disposalDurationController,
                            rightContentPadding: 10,
                            borderRadius: 5,
                            focusBorderColor: '#808080',
                            enabledBorderColor: '#808080',
                            hintText: 'Duration',
                            // decoration: InputDecoration(
                            //   border: OutlineInputBorder(),
                            // ),
                          ),
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.2,
                        //   height: 40,
                        //   child: TextFormField(
                        //     controller: templateVm.disposalDurationController,
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: 45,
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xff808080))),
                          // child: TextField(
                          //   decoration: InputDecoration(
                          //       // suffixIcon: Icon(
                          //       //   Icons.keyboard_arrow_down,
                          //       //   color: Colors.grey,
                          //       // ),
                          //       border: OutlineInputBorder(),
                          //       labelText: 'Months',
                          //       // isDense: true,
                          //       labelStyle: TextStyle(fontSize: 14)),
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: selectDuration,
                          ),
                        ),
                        date
                        // InkWell(
                        //   onTap: () => _selectDate(context),
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width * 0.32,
                        //     height: 45,
                        //     margin: EdgeInsets.only(bottom: 15),
                        //     child: AbsorbPointer(
                        //       child: Stack(
                        //         children: [
                        //           Positioned(
                        //             right: 10,
                        //             top: 15,
                        //             child: Icon(
                        //               Icons.date_range_outlined,
                        //               size: 20,
                        //               color: Color(0xff808080),
                        //             ),
                        //           ),
                        //           Center(
                        //             child: TextFormField(
                        //               controller: _date,
                        //               decoration: InputDecoration(
                        //                   border: OutlineInputBorder(
                        //                   ),
                        //                   focusedBorder: OutlineInputBorder(
                        //                     borderSide: BorderSide(color: HexColor('#808080'), width: 1.0),
                        //                     borderRadius: BorderRadius.circular(5),
                        //                   ),
                        //                   enabledBorder: OutlineInputBorder(
                        //                     borderSide: BorderSide(color: HexColor("#808080"), width: 1.0),
                        //                     borderRadius: BorderRadius.circular(5),
                        //                   ),
                        //                   // labelText: 'Duration',
                        //                   // isDense: true,
                        //                   labelStyle: TextStyle(
                        //                       fontSize: isMobile ? 14 : 18)),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 60,
                  )
          ],
        ),
      ),
    );
  }
}

class DisposalItem {
  String disposal;
  String disposalDuration;
  String disposalDurationType;
  DateTime disposalDate;

  DisposalItem(
      {this.disposal,
      this.disposalDuration,
      this.disposalDurationType,
      this.disposalDate});
}
