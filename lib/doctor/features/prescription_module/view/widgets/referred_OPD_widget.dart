import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_add_to_favorite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/delete_favorite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/pre_diagnosis_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/referred_opd_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/chief_complaint_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_searchable_dropdown_from_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ReferredOPDWidget extends StatefulWidget {
  const ReferredOPDWidget({Key key}) : super(key: key);

  @override
  _ReferredOPDWidgetState createState() => _ReferredOPDWidgetState();
}

class _ReferredOPDWidgetState extends State<ReferredOPDWidget> {
  bool showReport = false;
  TextEditingController controller = TextEditingController();
  TextEditingController _favoriteController = TextEditingController();
  List<String> referredOPDSelectedItems = [];
  int ind;

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ChiefComplaintViewModel>();
    return PrescriptionCommonWidget(
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      showReport: showReport,
      title: "Referred OPD",
      expandedWidget: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
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
                      hintText: "Referred OPD",
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppTheme.buttonActiveColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            // if (ind != null) {
                            //   referredOPDSelectedItems[ind] = controller.text;
                            //   controller.clear();
                            //   ind = null;
                            // } else {
                            //   if (controller.text.trim().isNotEmpty) {
                            //     if (referredOPDSelectedItems
                            //         .contains(controller.text.trim())) {
                            //       BotToast.showText(text: "All ready added");
                            //     } else {
                            //       referredOPDSelectedItems
                            //           .add(controller.text.trim());
                            //       controller.clear();
                            //     }
                            //   } else {
                            //     BotToast.showText(text: "Field is empty");
                            //   }
                            // }
                            //
                            // setState(() {});
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
                  if (referredOPDSelectedItems.contains(v)) {
                    BotToast.showText(text: "All ready added");
                  } else {
                    referredOPDSelectedItems.add(v);
                  }
                  setState(() {});
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                suggestionsCallback: (v) {
                  return ReferredOPDSearchRepository().fetchSearchList();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: List.generate(
                    referredOPDSelectedItems.length,
                    (index) => Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffEFF5FF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10.0, bottom: 5.0),
                              child: Text(
                                "${referredOPDSelectedItems[index]}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      referredOPDSelectedItems.removeAt(index);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.red),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
