import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

class PrescriptionCommonWidget extends StatefulWidget {
  final String title;
  final Widget expandedWidget;
  final Function(bool value) onChangeShowReport;
  final bool showReport;
  final bool isFixed;

  const PrescriptionCommonWidget(
      {Key key,
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
  ExpandableController controller;
  @override
  void initState() {
    controller = ExpandableController(initialExpanded: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    controller: controller,
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
                        padding: const EdgeInsets.all(10.0),
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
                                            fontSize: 16),
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
                                    iconSize: 28.0,
                                    iconRotationAngle: math.pi / 2,
                                    iconPadding: EdgeInsets.only(right: 5),
                                    hasIcon: false,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                FlutterSwitch(
                                  activeText: "Hide",
                                  activeTextFontWeight: FontWeight.normal,
                                  inactiveTextColor: Colors.white,
                                  inactiveTextFontWeight: FontWeight.normal,
                                  activeTextColor: Colors.white,
                                  inactiveText: "Show",
                                  valueFontSize: 12,
                                  activeColor: Color(0xff55CFA6),
                                  inactiveColor: Color(0xffB1B1B1),
                                  showOnOff: true,
                                  height: 22,
                                  width: 60,
                                  toggleSize: 17,
                                  value: widget.showReport,
                                  onToggle: widget.onChangeShowReport,
                                ),
                              ],
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
