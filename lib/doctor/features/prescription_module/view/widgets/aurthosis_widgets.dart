import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class OrthosisWidget extends StatefulWidget {
  const OrthosisWidget({Key key}) : super(key: key);
  @override
  _OrthosisWidgetState createState() => _OrthosisWidgetState();
}

class _OrthosisWidgetState extends State<OrthosisWidget> {
  bool showReport = false;

  @override
  Widget build(BuildContext context) {
    // var vm = context.watch<ChiefComplaintViewModel>();
    return PrescriptionCommonWidget(
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      showReport: showReport,
      title: "Orthosis",
      expandedWidget: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Orthosis",
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppTheme.buttonActiveColor,
                  ),
                  suffixIcon:
                      Icon(Icons.check, color: AppTheme.buttonActiveColor),
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
                              style:
                                  TextStyle(color: AppTheme.buttonActiveColor),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Container(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, top: 20),
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        // var item = vm.favouriteList[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 20.0),
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Pain"),
                            value: false,
                            onChanged: (val) {},
                            secondary: Icon(
                              Icons.clear,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}