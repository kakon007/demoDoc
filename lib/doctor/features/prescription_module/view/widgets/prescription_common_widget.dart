import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

class PrescriptionCommonWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        initialExpanded: true,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
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
                                    title,
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
                            Row(
                              children: [
                                Text("Show in Report"),
                                SizedBox(
                                  width: 10,
                                ),
                                FlutterSwitch(
                                  height: 20,
                                  width: 40,
                                  toggleSize: 12,
                                  value: showReport,
                                  onToggle: onChangeShowReport,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: expandedWidget,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
