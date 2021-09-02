import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

_ExpandableControllers expandableControllers = _ExpandableControllers();

class _ExpandableControllers {
  var patientDemographyController = ExpandableController(initialExpanded: true);
  var vitalsController = ExpandableController(initialExpanded: true);
  var chiefCompleteController = ExpandableController(initialExpanded: true);
  var clinicalHistoryController = ExpandableController(initialExpanded: true);
  var pastIllnessController = ExpandableController(initialExpanded: true);
  var provisionalDiagnosisController =
      ExpandableController(initialExpanded: true);
  var deseaseController = ExpandableController(initialExpanded: true);
  var investigationController = ExpandableController(initialExpanded: true);
  var investigationFindingController =
      ExpandableController(initialExpanded: true);
  var orthosisController = ExpandableController(initialExpanded: true);
  var adviceController = ExpandableController(initialExpanded: true);
  var procedureController = ExpandableController(initialExpanded: true);
  var referredOPDController = ExpandableController(initialExpanded: true);
  var medicationController = ExpandableController(initialExpanded: true);
  var disposalController = ExpandableController(initialExpanded: true);
  var noteController = ExpandableController(initialExpanded: true);
  var referredDoctorController = ExpandableController(initialExpanded: true);
}

class PrescriptionCommonWidget extends StatefulWidget {
  final String title;
  final Widget expandedWidget;
  final Function(bool value) onChangeShowReport;
  final bool showReport;
  final bool isFixed;
  final ExpandableController controller;

  const PrescriptionCommonWidget(
      {Key key,
      @required this.controller,
      @required this.title,
      @required this.expandedWidget,
      @required this.onChangeShowReport,
      @required this.showReport,
      this.isFixed = false})
      : super(key: key);

  @override
  _PrescriptionCommonWidgetState createState() =>
      _PrescriptionCommonWidgetState();
}

class _PrescriptionCommonWidgetState extends State<PrescriptionCommonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    return ExpandableNotifier(
        controller: widget.controller,
        child: Padding(
          padding: EdgeInsets.only(
            left: isTablet ? 20 : 10,
            right: isTablet ? 20 : 10,
            top: isTablet ? 10 : 5,
            bottom: isTablet ? 10 : 5,
          ),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    controller: widget.controller,
                    theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(
                      decoration: BoxDecoration(
                        color: widget.isFixed
                            ? Colors.white
                            : AppTheme.buttonActiveColor,
                        border: Border(
                          top: BorderSide(
                            color: widget.isFixed
                                ? Color(0xffD2D2D2)
                                : AppTheme.buttonActiveColor,
                          ),
                          right: BorderSide(
                            color: widget.isFixed
                                ? Color(0xffD2D2D2)
                                : AppTheme.buttonActiveColor,
                          ),
                          left: BorderSide(
                            color: widget.isFixed
                                ? Color(0xffD2D2D2)
                                : AppTheme.buttonActiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: widget.isFixed
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: isTablet ? 18 : 16),
                                  ),
                                ),
                                ExpandableIcon(
                                  theme: ExpandableThemeData(
                                    expandIcon:
                                        Icons.keyboard_arrow_down_outlined,
                                    collapseIcon:
                                        Icons.keyboard_arrow_up_outlined,
                                    iconColor: widget.isFixed
                                        ? Color(0xff333333)
                                        : Colors.white,
                                    iconSize: isTablet ? 35 : 28.0,
                                    iconRotationAngle: math.pi / 2,
                                    iconPadding: EdgeInsets.only(right: 5),
                                    hasIcon: false,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: isTablet ? 8 : 5,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: isTablet ? 8 : 5),
                              child: Row(
                                children: [
                                  FlutterSwitch(
                                    activeText: "Hide",
                                    activeTextFontWeight: FontWeight.normal,
                                    inactiveTextColor: Colors.white,
                                    inactiveTextFontWeight: FontWeight.normal,
                                    activeTextColor: Colors.white,
                                    inactiveText: "Show",
                                    valueFontSize: isTablet ? 14 : 12,
                                    activeColor: Color(0xff55CFA6),
                                    inactiveColor: Color(0xffB1B1B1),
                                    showOnOff: true,
                                    height: isTablet ? 25 : 22,
                                    width: isTablet ? 70 : 60,
                                    toggleSize: isTablet ? 20 : 17,
                                    value: widget.showReport,
                                    onToggle: widget.onChangeShowReport,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: widget.expandedWidget,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
