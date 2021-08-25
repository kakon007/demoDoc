import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/pre_diagnosis_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/chief_complaint_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ChiefComplaintWidget extends StatefulWidget {
  const ChiefComplaintWidget({Key key}) : super(key: key);
  @override
  _ChiefComplaintWidgetState createState() => _ChiefComplaintWidgetState();
}

class _ChiefComplaintWidgetState extends State<ChiefComplaintWidget> {
  bool showReport = false;
  TextEditingController controller = TextEditingController();
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ChiefComplaintViewModel>();
    return PrescriptionCommonWidget(
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      showReport: showReport,
      title: "Chief Complaint",
      expandedWidget: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                    textInputAction: TextInputAction.search,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Chief Complaint",
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppTheme.buttonActiveColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            selectedItems.add(controller.text);
                            controller.clear();
                            setState(() {});
                          },
                          icon: Icon(Icons.check,
                              color: AppTheme.buttonActiveColor)),
                    )),
                itemBuilder: (_, v) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("$v"),
                  );
                },
                onSuggestionSelected: (v) {
                  selectedItems.add(v);
                  setState(() {});
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                suggestionsCallback: (v) {
                  return PreDiagnosisSearchRepository().fetchSearchList(v);
                },
                // noItemsFoundBuilder: noItemsFoundBuilder ??
                //     (context) {
                //       return SizedBox();
                //     },
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: "Chief Complaint",
              //     prefixIcon: Icon(
              //       Icons.search,
              //       color: AppTheme.buttonActiveColor,
              //     ),
              //     suffixIcon:
              //         Icon(Icons.check, color: AppTheme.buttonActiveColor),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      selectedItems.length,
                      (index) => Container(
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Color(0xffEFF5FF),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color(0xffE6374DF)),
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${selectedItems[index]}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: InkWell(
                                    onTap: () {
                                      selectedItems.removeAt(index);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color(0xffE6374DF)),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
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
                      itemCount: vm.favouriteList.length,
                      itemBuilder: (context, index) {
                        var item = vm.favouriteList[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 20.0),
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("${item.favouriteVal}"),
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
