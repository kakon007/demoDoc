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

  const PrescriptionCommonWidget({
    Key key,
    @required this.title,
    @required this.expandedWidget,
    @required this.onChangeShowReport,
    @required this.showReport,
  }) : super(key: key);

  @override
  _PrescriptionCommonWidgetState createState() =>
      _PrescriptionCommonWidgetState();
}

class _PrescriptionCommonWidgetState extends State<PrescriptionCommonWidget> {
  ExpandableController controller = ExpandableController(initialExpanded: true);
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          children: [
            Material(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${widget.title}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    isExpanded
                        ? Icon(
                            Icons.remove,
                            size: 30,
                          )
                        : Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.grey,
                          )
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              switchInCurve: Curves.easeIn,
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(child: child, sizeFactor: animation);
              },
              child: Container(
                key: Key(isExpanded.toString()),
                child: isExpanded
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: widget.expandedWidget,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
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
                      color: AppTheme.buttonActiveColor,
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
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                ExpandableIcon(
                                  theme: const ExpandableThemeData(
                                    expandIcon:
                                        Icons.keyboard_arrow_down_outlined,
                                    collapseIcon:
                                        Icons.keyboard_arrow_up_outlined,
                                    iconColor: Colors.white,
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
