import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/common_prescription_search_items_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_add_to_favorite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_prescription_search_items_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/delete_favorite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/investigation_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class InvestigationWidget extends StatefulWidget {
  const InvestigationWidget({Key key}) : super(key: key);
  @override
  _InvestigationWidgetState createState() => _InvestigationWidgetState();
}

class _InvestigationWidgetState extends State<InvestigationWidget> {
  bool showReport = false;
  TextEditingController controller = TextEditingController();
  List<CommonPrescriptionSearchItems> investigationSelectedItems = [];
  int ind;

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<InvestigationViewModel>();
    return PrescriptionCommonWidget(
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      showReport: showReport,
      title: "Investigation",
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
              TypeAheadFormField<CommonPrescriptionSearchItems>(
                textFieldConfiguration: TextFieldConfiguration(
                    textInputAction: TextInputAction.search,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Investigation",
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppTheme.buttonActiveColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (ind != null) {
                              investigationSelectedItems[ind].itemName =
                                  controller.text;
                              controller.clear();
                              ind = null;
                            } else {
                              if (controller.text.trim().isNotEmpty) {
                                if (investigationSelectedItems
                                    .contains(controller.text.trim())) {
                                  BotToast.showText(text: "All ready added");
                                } else {
                                  int itemTypeNo;
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              Text(
                                                  'Investigation Confirmation'),
                                              Divider(),
                                            ],
                                          ),
                                          content: StatefulBuilder(builder:
                                              (context, StateSetter setState) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Radio<int>(
                                                        value: 1,
                                                        groupValue: itemTypeNo,
                                                        onChanged: (int v) {
                                                          setState(() {
                                                            itemTypeNo = v;
                                                            investigationSelectedItems.add(
                                                                CommonPrescriptionSearchItems(
                                                                    itemName:
                                                                        controller
                                                                            .text
                                                                            .trim(),
                                                                    itemTypeNo:
                                                                        itemTypeNo));
                                                            controller.clear();
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        }),
                                                    Text("Pathology")
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Radio<int>(
                                                        value: 2,
                                                        groupValue: itemTypeNo,
                                                        onChanged: (int v) {
                                                          setState(() {
                                                            itemTypeNo = v;
                                                            investigationSelectedItems.add(
                                                                CommonPrescriptionSearchItems(
                                                                    itemName:
                                                                        controller
                                                                            .text
                                                                            .trim(),
                                                                    itemTypeNo:
                                                                        itemTypeNo));
                                                            controller.clear();
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        }),
                                                    Text("Radiology")
                                                  ],
                                                ),
                                              ],
                                            );
                                          }),
                                        );
                                      });
                                }
                              } else {
                                BotToast.showText(text: "Field is empty");
                              }
                            }

                            setState(() {});
                          },
                          icon: Icon(Icons.check,
                              color: AppTheme.buttonActiveColor)),
                    )),
                itemBuilder: (_, v) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("${v.itemName}"),
                  );
                },
                onSuggestionSelected: (v) {
                  if (investigationSelectedItems.contains(v)) {
                    BotToast.showText(text: "All ready added");
                  } else {
                    investigationSelectedItems.add(v);
                  }
                  setState(() {});
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                suggestionsCallback: (v) {
                  return CommonPrescriptionSearchItemsRepository()
                      .fetchSearchList(q: v, parItemTypeNo: 36);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: List.generate(
                    investigationSelectedItems.length,
                    (index) => Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffEFF5FF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, top: 10.0, bottom: 5.0),
                                  child: Text(
                                    "${investigationSelectedItems[index].itemName}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tooltip(
                                  message: investigationSelectedItems[index]
                                              .itemTypeNo ==
                                          1
                                      ? "Pathology"
                                      : "Radiology",
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 10),
                                      child: Text(
                                        investigationSelectedItems[index]
                                                    .itemTypeNo ==
                                                1
                                            ? "P"
                                            : "R",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
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
                                      CommonAddToFavoriteListRepository()
                                          .addToFavouriteList(
                                              favoriteType: "36",
                                              favoriteVal:
                                                  investigationSelectedItems[
                                                          index]
                                                      .itemName)
                                          .then((value) => vm.getData());
                                      // setState(() {});
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.text =
                                          investigationSelectedItems[index]
                                              .itemName;
                                      ind = index;
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color(0xffE6374DF)),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      investigationSelectedItems
                                          .removeAt(index);
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
                            value: item.isCheck,
                            onChanged: (val) {
                              item.isCheck = val;
                              if (val == true) {
                                if (investigationSelectedItems
                                    .contains(item.favouriteVal)) {
                                  BotToast.showText(text: "All ready added");
                                } else {
                                  investigationSelectedItems.add(
                                      CommonPrescriptionSearchItems(
                                          itemName: item.favouriteVal,
                                          itemTypeNo: item.favouriteType));
                                }
                              }
                              setState(() {});
                            },
                            secondary: InkWell(
                              onTap: () {
                                SVProgressHUD.show(status: "Deleting");
                                DeleteFavoriteLitRepository()
                                    .deleteFavoriteList(id: item.id)
                                    .then((value) => vm.getData());
                                SVProgressHUD.dismiss();
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
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
