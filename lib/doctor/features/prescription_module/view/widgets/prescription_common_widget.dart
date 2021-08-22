import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'dart:math' as math;

import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PrescriptionCommonWidget extends StatelessWidget {
  final String title;

  const PrescriptionCommonWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool status = true;
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

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
                        child: Row(
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
                                expandIcon: Icons.keyboard_arrow_down_outlined,
                                collapseIcon: Icons.keyboard_arrow_up_outlined,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppTheme.buttonActiveColor, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 5, right: 5),
                        child: Column(
                          children: [
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
                                  value: status,
                                  onToggle: (val) {
                                    status = val;
                                  },
                                ),
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: title,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppTheme.buttonActiveColor,
                                ),
                                suffixIcon: Icon(Icons.check,
                                    color: AppTheme.buttonActiveColor),
                              ),
                            ),
                            Container(
                              height: 150,
                              child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return index < 3
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("search $index"),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Add 'Pain' to favourites",
                                            style: TextStyle(
                                                color:
                                                    AppTheme.buttonActiveColor),
                                          ),
                                        );
                                },
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Favourite list",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      Container(
                                        width: 200,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, top: 20),
                                            hintText: "Search Favourite list",
                                            suffixIcon: Icon(
                                              Icons.search,
                                              color: AppTheme.buttonActiveColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    value: false,
                                                  ),
                                                  Text("Favourite $index"),
                                                ],
                                              ),
                                              Icon(
                                                Icons.clear,
                                                color: Colors.red,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
