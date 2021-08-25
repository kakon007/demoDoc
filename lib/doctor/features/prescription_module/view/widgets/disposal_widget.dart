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
  // TextEditingController controller = TextEditingController();
  // List<String> procedureSelectedItems = [];
  // int ind;
  SingingCharacter _character = SingingCharacter.lafayette;
  int _radioSelected = 1;
  String _radioVal;

  @override
  Widget build(BuildContext context) {
    // var vm = context.watch<ProcedureViewModel>();
    return PrescriptionCommonWidget(
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      showReport: showReport,
      title: "Disposal",
      expandedWidget: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
        child: Column(
          children: [
            // ListTile(
            //   title: const Text('Lafayette'),
            //   leading: Radio<SingingCharacter>(
            //     value: SingingCharacter.lafayette,
            //     groupValue: _character,
            //     onChanged: (SingingCharacter value) {
            //       setState(() {
            //         _character = value;
            //       });
            //     },
            //   ),
            // ),
            // ListTile(
            //   title: const Text('Lafayette'),
            //   leading: Radio<SingingCharacter>(
            //     value: SingingCharacter.lafayette,
            //     groupValue: _character,
            //     onChanged: (SingingCharacter value) {
            //       setState(() {
            //         _character = value;
            //       });
            //     },
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _radioSelected,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value;
                          _radioVal = 'noApplicable';
                        });
                      },
                    ),
                    Text(
                      'No Applicable',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _radioSelected,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value;
                          _radioVal = 'followUp';
                        });
                      },
                    ),
                    Text(
                      'Follow Up',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: _radioSelected,
                      activeColor: AppTheme.buttonActiveColor,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value;
                          _radioVal = 'hospitalized';
                        });
                      },
                    ),
                    Text(
                      'Hospitalized',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 40,
                    child: TextFormField(
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
                    child: TextField(
                      decoration: InputDecoration(
                          // suffixIcon: Icon(
                          //   Icons.keyboard_arrow_down,
                          //   color: Colors.grey,
                          // ),
                          border: OutlineInputBorder(),
                          labelText: 'Months',
                          // isDense: true,
                          labelStyle: TextStyle(fontSize: 14)),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          // suffixIcon: Icon(
                          //   Icons.date_range_outlined,
                          //   color: Colors.grey,
                          // ),
                          border: OutlineInputBorder(),
                          labelText: 'Duration',
                          // isDense: true,
                          labelStyle: TextStyle(fontSize: 14)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
