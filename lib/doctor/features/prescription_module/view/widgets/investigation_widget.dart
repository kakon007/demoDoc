import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/common_prescription_search_items_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_add_to_favorite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_prescription_search_items_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/delete_favorite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/clinical_history_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/investigation_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class InvestigationWidget extends StatefulWidget {
  const InvestigationWidget({Key key}) : super(key: key);
  @override
  _InvestigationWidgetState createState() => _InvestigationWidgetState();
}

class _InvestigationWidgetState extends State<InvestigationWidget> {
  bool showReport = false;
  TextEditingController controller = TextEditingController();
  TextEditingController _favoriteController = TextEditingController();
  List<CommonPrescriptionSearchItems> investigationSelectedItems = [];
  int ind;
  var vm = appNavigator.context.read<InvestigationViewModel>();
  void searchFavoriteItem(String query) {
    List<FavouriteItemModel> initialFavoriteSearch = List<FavouriteItemModel>();
    initialFavoriteSearch = vm.favouriteList;
    print("init ${initialFavoriteSearch.length}");
    if (query.isNotEmpty) {
      List<FavouriteItemModel> initialFavoriteSearchItems =
          List<FavouriteItemModel>();
      initialFavoriteSearch.forEach((item) {
        if (item.favouriteVal.toLowerCase().contains(query.toLowerCase())) {
          initialFavoriteSearchItems.add(item);
          print(initialFavoriteSearchItems.length);
        }
      });
      setState(() {
        print('shak');
        favoriteItems.clear();
        favoriteItems.addAll(initialFavoriteSearchItems);
      });
      return;
    } else {
      setState(() {
        print('sha');
        favoriteItems.clear();
        favoriteItems.addAll(vm.favouriteList);
      });
    }
  }

  List<FavouriteItemModel> favoriteItems = [];

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      var vm = context.read<InvestigationViewModel>();
      await vm.getData();
      favoriteItems.addAll(vm.favouriteList);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<InvestigationViewModel>();
    bool isTablet = Responsive.isTablet(context);
    var templateVm = Provider.of<GetTamplateDataViewModel>(context);
    //var templateVm = Provider.of<GetTamplateDataViewModel>(context, listen: false);
    // templateVm.prescriptionTamplateListData.investigationList.forEach((element) {
    //   investigationSelectedItems.add(CommonPrescriptionSearchItems(itemName: element.preDiagnosisVal,itemTypeNo: element.preDiagnosisValType));
    //   print('sakil ${investigationSelectedItems.length}');
    // });
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
          padding: EdgeInsets.only(top: 10.0, bottom: 10,
              left: isTablet ? 15 : 5,
              right: isTablet ? 15 : 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeAheadFormField<CommonPrescriptionSearchItems>(
                textFieldConfiguration: TextFieldConfiguration(
                    style: TextStyle(fontSize: isTablet ? 18 : 16),
                    textInputAction: TextInputAction.search,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Investigation",
                      prefixIcon: Icon(
                        Icons.search,
                        size: isTablet ? 30 : 25,
                        color: AppTheme.buttonActiveColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (ind != null) {
                              templateVm.investigationSelectedItems[ind].itemName =
                                  controller.text;
                              controller.clear();
                              ind = null;
                            } else {
                              if (controller.text.trim().isNotEmpty) {
                                if (templateVm.investigationSelectedItems
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
                                                            templateVm.investigationSelectedItems.add(
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
                                                            templateVm.investigationSelectedItems.add(
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
                              size: isTablet ? 30 : 25,
                              color: AppTheme.buttonActiveColor)),
                    )),
                itemBuilder: (_, v) {
                  return Padding(
                    padding: EdgeInsets.all(isTablet ? 12 : 10),
                    child: Text("${v.itemName}",
                        style: TextStyle(fontSize: isTablet ? 18 : 16),),
                  );
                },
                onSuggestionSelected: (v) {
                  if (templateVm.investigationSelectedItems.contains(v)) {
                    BotToast.showText(text: "All ready added");
                  } else {
                    templateVm.investigationSelectedItems.add(v);
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
                    templateVm.investigationSelectedItems.length,
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
                                  padding: EdgeInsets.only( left: isTablet ? 20 : 15,
                                      top: isTablet ? 15 : 10.0,
                                      bottom: isTablet ? 10 : 5.0),
                                  child: Text(
                                    "${templateVm.investigationSelectedItems[index].itemName}",
                                    style: TextStyle(
                                        fontSize: isTablet ? 18 : 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tooltip(
                                  message: templateVm.investigationSelectedItems[index]
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
                                          left: isTablet ? 20 : 15,
                                          top: isTablet ? 15 : 10.0,
                                          bottom: isTablet ? 10 : 5.0),
                                      child: Text(
                                        templateVm.investigationSelectedItems[index]
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
                              padding: EdgeInsets.only(bottom: isTablet ? 15 : 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await CommonAddToFavoriteListRepository()
                                          .addToFavouriteList(
                                              favoriteType: "36",
                                              favoriteVal:
                                              templateVm.investigationSelectedItems[
                                                          index]
                                                      .itemName)
                                          .then((value) async =>
                                              await vm.getData());
                                      favoriteItems.clear();
                                      if (_favoriteController.text.isNotEmpty) {
                                        searchFavoriteItem(_favoriteController
                                            .text
                                            .toLowerCase());
                                      } else {
                                        favoriteItems = vm.favouriteList;
                                      }
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                      size:  isTablet ? 35 : 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.text =
                                          templateVm.investigationSelectedItems[index]
                                              .itemName;
                                      ind = index;
                                    },
                                    child: Container(
                                      height: isTablet ? 35 : 30,
                                      width: isTablet ? 35 : 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color(0xffE6374DF)),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: isTablet ? 20 : 18,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      templateVm.investigationSelectedItems
                                          .removeAt(index);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: isTablet ? 35 : 30,
                                      width: isTablet ? 35 : 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.red),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: isTablet ? 22 : 20,
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
                height: isTablet ? 25 : 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Favourite list",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: isTablet ? 25 : 20),
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
                          padding: EdgeInsets.only(bottom: isTablet ? 15 : 10),
                          width: isTablet ? 350 : 250,
                          child: TextField(
                            onChanged: (value) {
                              searchFavoriteItem(value.toLowerCase());
                              // departmentSearch(value.toUpperCase());
                            },
                            style: TextStyle(fontSize: isTablet ? 18 : 16),
                            controller: _favoriteController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: isTablet ? 15 : 10, top: 20),
                              hintText: "Search Favourite list",
                              suffixIcon: Icon(
                                Icons.search,
                                size: isTablet ? 30 : 25,
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
                      itemCount: favoriteItems.length,
                      itemBuilder: (context, index) {
                        var item = favoriteItems[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Container(
                            color: (index % 2 == 0)
                                ? Color(0xffEFF5FF)
                                : Colors.white,
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("${item.favouriteVal}",    style: TextStyle(fontSize: isTablet ? 18 : 16),),
                              value: item.isCheck,
                              onChanged: (val) {
                                item.isCheck = val;
                                if (val == true) {
                                  if (templateVm.investigationSelectedItems
                                      .contains(item.favouriteVal)) {
                                    BotToast.showText(text: "All ready added");
                                  } else {
                                    templateVm.investigationSelectedItems.add(
                                        CommonPrescriptionSearchItems(
                                            itemName: item.favouriteVal,
                                            itemTypeNo: item.favouriteType));
                                  }
                                }
                                setState(() {});
                              },
                              secondary: InkWell(
                                onTap: () async {
                                  SVProgressHUD.show(status: "Deleting");
                                  await DeleteFavoriteLitRepository()
                                      .deleteFavoriteList(id: item.id)
                                      .then(
                                          (value) async => await vm.getData());
                                  SVProgressHUD.dismiss();
                                  favoriteItems.clear();
                                  if (_favoriteController.text.isNotEmpty) {
                                    searchFavoriteItem(
                                        _favoriteController.text.toLowerCase());
                                  } else {
                                    favoriteItems = vm.favouriteList;
                                  }
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: isTablet ? 30 : 25,
                                ),
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
