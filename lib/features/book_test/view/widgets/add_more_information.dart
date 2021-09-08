import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

_ExpandableControllers expandableControllers = _ExpandableControllers();

class _ExpandableControllers {
  var addMoreController = ExpandableController(initialExpanded: false);
}

class AddMoreWidget extends StatefulWidget {
  final String title;
  final Widget expandedWidget;
  final Function(bool value) onChangeShowReport;
  final ExpandableController controller;

  const AddMoreWidget({
    Key key,
    @required this.controller,
    @required this.title,
    @required this.expandedWidget,
    @required this.onChangeShowReport,
  }) : super(key: key);

  @override
  _AddMoreWidgetState createState() => _AddMoreWidgetState();
}

class _AddMoreWidgetState extends State<AddMoreWidget> {
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
            left: isTablet ? 0 : 0,
            right: isTablet ? 0 : 0,
            top: isTablet ? 0 : 0,
            bottom: isTablet ? 0 : 0,
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
                        color: Color(0XFFEFF5FF),
                        border: Border(
                          top: BorderSide(
                            color: Color(0XFFEFF5FF),
                          ),
                          right: BorderSide(
                            color: Color(0XFFEFF5FF),
                          ),
                          left: BorderSide(
                            color: Color(0XFFEFF5FF),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration:
                                      BoxDecoration(color: Color(0XFFAFBBFF)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: isTablet ? 18 : 16),
                                  ),
                                ),
                                ExpandableIcon(
                                  theme: ExpandableThemeData(
                                    expandIcon:
                                        Icons.keyboard_arrow_down_outlined,
                                    collapseIcon:
                                        Icons.keyboard_arrow_up_outlined,
                                    // iconColor: Colors.black,
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
