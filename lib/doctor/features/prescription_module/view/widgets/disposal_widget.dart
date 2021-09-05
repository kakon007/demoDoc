import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
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
    var selectDuration = DropdownButtonHideUnderline(
      child: DropdownButton<String>(
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
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "",
            style: TextStyle(
                color: Colors.black,
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        onChanged: (String value) {
          setState(() {
            templateVm.disposalDurationType = value;
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
            // Row(
            //   children: [
            //     Row(
            //       children: [
            //         Radio(
            //           value: 1,
            //           groupValue: _radioSelected,
            //           activeColor: Colors.blue,
            //           onChanged: (value) {
            //             setState(() {
            //               _radioSelected = value;
            //               _radioVal = 'noApplicable';
            //             });
            //           },
            //         ),
            //         Text(
            //           'No Applicable',
            //           style: TextStyle(fontSize: 12),
            //         )
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Radio(
            //           value: 2,
            //           groupValue: _radioSelected,
            //           activeColor: Colors.blue,
            //           onChanged: (value) {
            //             setState(() {
            //               _radioSelected = value;
            //               _radioVal = 'followUp';
            //             });
            //           },
            //         ),
            //         Text(
            //           'Follow Up',
            //           style: TextStyle(fontSize: 12),
            //         )
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Radio(
            //           value: 3,
            //           groupValue: _radioSelected,
            //           activeColor: AppTheme.buttonActiveColor,
            //           onChanged: (value) {
            //             setState(() {
            //               _radioSelected = value;
            //               _radioVal = 'hospitalized';
            //             });
            //           },
            //         ),
            //         Text(
            //           'Hospitalized',
            //           style: TextStyle(fontSize: 12),
            //         )
            //       ],
            //     ),
            //   ],
            // ),

            templateVm.chosenDisposalValue == "Follow Up"
                ? Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: 40,
                          child: TextField(
                            controller: templateVm.disposalDurationController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
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
                            padding: const EdgeInsets.only(left: 10),
                            child: selectDuration,
                          ),
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.32,
                            height: 40,
                            child: AbsorbPointer(
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Icon(
                                      Icons.date_range_outlined,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Center(
                                    child: TextField(
                                      controller: _date,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Duration',
                                          // isDense: true,
                                          labelStyle: TextStyle(
                                              fontSize: isMobile ? 14 : 18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
