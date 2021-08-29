import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

enum SingingCharacter { lafayette, jefferson }

class DisposalWidget extends StatefulWidget {
  const DisposalWidget({Key key}) : super(key: key);
  @override
  _DisposalWidgetState createState() => _DisposalWidgetState();
}

class _DisposalWidgetState extends State<DisposalWidget> {
  bool showReport = false;
  TextEditingController _date = new TextEditingController();
  TextEditingController _numberController = new TextEditingController();
  SingingCharacter _character = SingingCharacter.lafayette;
  String _chosenValue;
  String _durationValue;
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
        _date.value = TextEditingValue(text: "${formattedDate.toString()}");
      });
  }

  @override
  Widget build(BuildContext context) {
    // var vm = context.watch<ProcedureViewModel>();
    var selectDisposal = DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      icon: Icon(Icons.keyboard_arrow_down_sharp),
      value: _chosenValue,
      //elevation: 5,
      style: TextStyle(color: Colors.black),
      items: <String>[
        'N/A',
        'Follow Up',
        'Hospitalized',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        "N/A",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      onChanged: (String value) {
        setState(() {
          _chosenValue = value;
        });
      },
    ));
    var selectDuration = DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        value: _durationValue,
        //elevation: 5,
        style: TextStyle(color: Colors.black),
        items: <String>[
          'Days',
          'Weeks',
          'Months',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        onChanged: (String value) {
          setState(() {
            _durationValue = value;
          });
        },
      ),
    );
    return PrescriptionCommonWidget(
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      showReport: showReport,
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

            _chosenValue == "Follow Up"
                ? Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 40,
                          child: TextField(
                            controller: _numberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 100,
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
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Container(
                            width: 120,
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
                                          labelStyle: TextStyle(fontSize: 14)),
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
