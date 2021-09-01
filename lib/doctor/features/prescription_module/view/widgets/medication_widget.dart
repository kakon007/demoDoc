import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/common_prescription_search_items_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_prescription_search_items_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/delete_favorite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/generic_search_items_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/medication_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/medication_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class MedicationWidget extends StatefulWidget {
  const MedicationWidget({Key key}) : super(key: key);

  @override
  _MedicationWidgetState createState() => _MedicationWidgetState();
}

class _MedicationWidgetState extends State<MedicationWidget> {
  bool showReport = false;
  TextEditingController routeController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController multiDoseController = TextEditingController();
  TextEditingController multiDoseDurationController = TextEditingController();
  TextEditingController multiDoseDaysController = TextEditingController();
  TextEditingController multiDoseQuantityController = TextEditingController();
  TextEditingController multiDoseInstructionController =
      TextEditingController();
  TextEditingController continueDurationController = TextEditingController();
  TextEditingController continueDaysController = TextEditingController();
  TextEditingController continueQuantityController = TextEditingController();
  TextEditingController _favoriteController = TextEditingController();
  TextEditingController _genericController = TextEditingController();
  TextEditingController _brandController = TextEditingController();
  List<String> medicationSelectedItems = [];
  int ind;
  int multiDoseLength = 0;
  var vm = appNavigator.context.read<MedicationViewModel>();
  int tabIndex = 0;
  // value set to false
  bool _value = false;

  void searchFavoriteItem(String query) {
    List<FavouriteItemModel> initialFavoriteSearch = List<FavouriteItemModel>();
    initialFavoriteSearch = vm.favouriteList;
    print("init ${initialFavoriteSearch.length}");
    if (query.isNotEmpty) {
      List<FavouriteItemModel> initialFavoriteSearchItems =
          List<FavouriteItemModel>();
      initialFavoriteSearch.forEach((item) {
        if (tabIndex == 0) {
          if (item.genericName != null) {
            if (item.genericName.toLowerCase().contains(query.toLowerCase())) {
              initialFavoriteSearchItems.add(item);
              print(initialFavoriteSearchItems.length);
            }
          }
        } else {
          if (item.brandName != null) {
            if (item.brandName.toLowerCase().contains(query.toLowerCase())) {
              initialFavoriteSearchItems.add(item);
              print(initialFavoriteSearchItems.length);
            }
          }
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
      MedicationRepository().fetchMedicationList();
      var vm = context.read<MedicationViewModel>();
      await vm.getData();
      vm.getDataRouteToInstruction();
      favoriteItems.addAll(vm.favouriteList);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<MedicationViewModel>();

    final Widget addMulIon = SvgPicture.asset(
      "assets/icons/addmultidose.svg",
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      color: Colors.white,
      //semanticsLabel: 'Acme Logo'
    );
    return PrescriptionCommonWidget(
      key: Key("medicationWidget"),
      onChangeShowReport: (bool val) {
        showReport = val;
        setState(() {});
      },
      showReport: showReport,
      title: "Medication",
      expandedWidget: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            tabIndex = 0;
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .421,
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  color: tabIndex == 0
                                      ? AppTheme.buttonActiveColor
                                      : Colors.grey,
                                  width: tabIndex == 0 ? 3 : 1),
                            )
                                // border: Border.all(
                                //     color: tabIndex == 0
                                //         ? AppTheme.buttonActiveColor
                                //         : Colors.grey,
                                //     width: 2),
                                ),
                            child: Center(
                              child: Text(
                                "Generic",
                                style: TextStyle(
                                    color: tabIndex == 0
                                        ? AppTheme.buttonActiveColor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            tabIndex = 1;
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .421,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: tabIndex == 1
                                        ? AppTheme.buttonActiveColor
                                        : Colors.grey,
                                    width: tabIndex == 1 ? 3 : 1),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Brand",
                                style: TextStyle(
                                    color: tabIndex == 1
                                        ? AppTheme.buttonActiveColor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    tabIndex == 0
                        ? Container(
                            child: Column(
                              children: [
                                TypeAheadFormField<
                                    CommonPrescriptionSearchItems>(
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                          textInputAction:
                                              TextInputAction.search,
                                          controller: _genericController,
                                          decoration: InputDecoration(
                                            hintText: "Generic",
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: AppTheme.buttonActiveColor,
                                            ),
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.check,
                                                    color: AppTheme
                                                        .buttonActiveColor)),
                                          )),
                                  itemBuilder: (_, v) {
                                    return Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text("${v.genericName}"),
                                    );
                                  },
                                  onSuggestionSelected: (v) {
                                    _genericController.text = v.genericName;
                                    setState(() {});
                                  },
                                  suggestionsBoxDecoration:
                                      SuggestionsBoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  suggestionsCallback: (v) {
                                    return GenericSearchItemsRepository()
                                        .fetchSearchList(
                                            parItemTypeNo: 4, q: v);
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "  Favourite list",
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
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            width: 250,
                                            child: TextField(
                                              onChanged: (value) {
                                                searchFavoriteItem(
                                                    value.toLowerCase());
                                                // departmentSearch(value.toUpperCase());
                                              },
                                              controller: _favoriteController,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 10, top: 20),
                                                hintText:
                                                    "Search Favourite list",
                                                suffixIcon: Icon(
                                                  Icons.search,
                                                  color: AppTheme
                                                      .buttonActiveColor,
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
                                            padding: EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Container(
                                              color: (index % 2 == 0)
                                                  ? Color(0xffEFF5FF)
                                                  : Colors.white,
                                              child: CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                title: Text(
                                                    "${item.genericName ?? item.brandName}"),
                                                value: item.isCheck,
                                                onChanged: (val) {
                                                  item.isCheck = val;
                                                  if (val == true) {
                                                    _genericController.clear();
                                                    _genericController.text =
                                                        item.genericName;
                                                  }
                                                  setState(() {});
                                                },
                                                secondary: InkWell(
                                                  onTap: () async {
                                                    SVProgressHUD.show(
                                                        status: "Deleting");
                                                    await DeleteFavoriteLitRepository()
                                                        .deleteFavoriteList(
                                                            id: item.id)
                                                        .then((value) async =>
                                                            await vm.getData());
                                                    SVProgressHUD.dismiss();
                                                    // _favoriteController.clear();
                                                    favoriteItems.clear();
                                                    if (_favoriteController
                                                        .text.isNotEmpty) {
                                                      searchFavoriteItem(
                                                          _favoriteController
                                                              .text
                                                              .toLowerCase());
                                                    } else {
                                                      favoriteItems =
                                                          vm.favouriteList;
                                                    }
                                                    // favoriteItems.addAll(vm.favouriteList);
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Colors.red,
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
                          )
                        : Container(
                            child: Column(
                              children: [
                                TypeAheadFormField<
                                    CommonPrescriptionSearchItems>(
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                          textInputAction:
                                              TextInputAction.search,
                                          controller: _brandController,
                                          decoration: InputDecoration(
                                            hintText: "Brand",
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: AppTheme.buttonActiveColor,
                                            ),
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.check,
                                                    color: AppTheme
                                                        .buttonActiveColor)),
                                          )),
                                  itemBuilder: (_, v) {
                                    return Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text("${v.itemName}"),
                                    );
                                  },
                                  onSuggestionSelected: (v) {
                                    _brandController.text = v.itemName;
                                    setState(() {});
                                  },
                                  suggestionsBoxDecoration:
                                      SuggestionsBoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  suggestionsCallback: (v) {
                                    return CommonPrescriptionSearchItemsRepository()
                                        .fetchSearchList(
                                            q: v, parItemTypeNo: 4);
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "  Favourite list",
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
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            width: 250,
                                            child: TextField(
                                              onChanged: (value) {
                                                searchFavoriteItem(
                                                    value.toLowerCase());
                                                // departmentSearch(value.toUpperCase());
                                              },
                                              controller: _favoriteController,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 10, top: 20),
                                                hintText:
                                                    "Search Favourite list",
                                                suffixIcon: Icon(
                                                  Icons.search,
                                                  color: AppTheme
                                                      .buttonActiveColor,
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
                                            padding: EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Container(
                                              color: (index % 2 == 0)
                                                  ? Color(0xffEFF5FF)
                                                  : Colors.white,
                                              child: CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                title: Text(
                                                    "${item.brandName ?? item.genericName}"),
                                                value: item.isCheck,
                                                onChanged: (val) {
                                                  item.isCheck = val;
                                                  if (val == true) {
                                                    _brandController.clear();
                                                    _brandController.text =
                                                        item.brandName;
                                                  }
                                                  setState(() {});
                                                },
                                                secondary: InkWell(
                                                  onTap: () async {
                                                    SVProgressHUD.show(
                                                        status: "Deleting");
                                                    await DeleteFavoriteLitRepository()
                                                        .deleteFavoriteList(
                                                            id: item.id)
                                                        .then((value) async =>
                                                            await vm.getData());
                                                    SVProgressHUD.dismiss();
                                                    // _favoriteController.clear();
                                                    favoriteItems.clear();
                                                    if (_favoriteController
                                                        .text.isNotEmpty) {
                                                      searchFavoriteItem(
                                                          _favoriteController
                                                              .text
                                                              .toLowerCase());
                                                    } else {
                                                      favoriteItems =
                                                          vm.favouriteList;
                                                    }
                                                    // favoriteItems.addAll(vm.favouriteList);
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Colors.red,
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
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),

              //Route//
              SizedBox(
                height: 15,
              ),
              TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                    textInputAction: TextInputAction.search,
                    controller: routeController,
                    decoration: InputDecoration(
                      labelText: "Route",
                      //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                      hintText: "Route",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff3E58FF)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
                itemBuilder: (_, v) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("$v"),
                  );
                },
                onSuggestionSelected: (v) {
                  routeController.text = v;
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                suggestionsCallback: (v) {
                  // return vm.medicationModelList.items.where((element) => element.preDiagnosisVal.toString().contains(v));
                  return vm.medicationModelList.obj.routeList
                      .map((e) => e.preDiagnosisVal)
                      .where((element) =>
                          element.toLowerCase().contains(v.toLowerCase()))
                      .toList();
                },
              ),

              //Dose//
              SizedBox(
                height: 15,
              ),
              TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                    textInputAction: TextInputAction.search,
                    controller: doseController,
                    decoration: InputDecoration(
                      labelText: "Dose",
                      //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                      hintText: "Dose",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff3E58FF)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
                itemBuilder: (_, v) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("$v"),
                  );
                },
                onSuggestionSelected: (v) {
                  doseController.text = v;
                  // setState(() {});
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                suggestionsCallback: (v) {
                  return vm.medicationModelList.obj.doseList
                      .map((e) => e.preDiagnosisVal)
                      .where((element) =>
                          element.toLowerCase().contains(v.toLowerCase()))
                      .toList();
                },
              ),

              //Duration
              //Quantity
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: TypeAheadFormField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                          textInputAction: TextInputAction.search,
                          controller: durationController,
                          decoration: InputDecoration(
                            labelText: "Duration",
                            //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                            hintText: "Duration",
                            // prefixIcon: Icon(
                            //   Icons.search,
                            //   color: Colors.grey,
                            // ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff3E58FF)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          )),
                      itemBuilder: (_, v) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("$v"),
                        );
                      },
                      onSuggestionSelected: (v) {
                        durationController.text = v;
                      },
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suggestionsCallback: (v) {
                        return vm.medicationModelList.obj.durationList
                            .map((e) => e.preDiagnosisVal)
                            .where((element) =>
                                element.toLowerCase().contains(v.toLowerCase()))
                            .toList();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TypeAheadFormField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                          textInputAction: TextInputAction.search,
                          controller: daysController,
                          decoration: InputDecoration(
                            labelText: "Days",
                            //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                            hintText: "Days",
                            // prefixIcon: Icon(
                            //   Icons.search,
                            //   color: Colors.grey,
                            // ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff3E58FF)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          )),
                      itemBuilder: (_, v) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("$v"),
                        );
                      },
                      onSuggestionSelected: (v) {
                        daysController.text = v;
                        // setState(() {});
                      },
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suggestionsCallback: (v) {
                        return vm.medicationModelList.obj.durationMuList
                            .map((e) => e.preDiagnosisVal)
                            .where((element) =>
                                element.toLowerCase().contains(v.toLowerCase()))
                            .toList();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: quantityController,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEFF5FF),
                        labelText: "Quantity",
                        //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                        hintText: "Quantity",
                        // prefixIcon: Icon(
                        //   Icons.search,
                        //   color: Colors.grey,
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffEFF5FF)),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffEFF5FF)),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Instructions//
              SizedBox(
                height: 15,
              ),
              TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                    textInputAction: TextInputAction.search,
                    controller: instructionController,
                    decoration: InputDecoration(
                      labelText: "Instructions",
                      //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                      hintText: "Instructions",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff3E58FF)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
                itemBuilder: (_, v) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("$v"),
                  );
                },
                onSuggestionSelected: (v) {
                  instructionController.text = v;
                  // setState(() {});
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                suggestionsCallback: (v) {
                  return vm.medicationModelList.obj.relationWithMealList
                      .map((e) => e.preDiagnosisVal)
                      .where((element) =>
                          element.toLowerCase().contains(v.toLowerCase()))
                      .toList();
                  // return PreDiagnosisSearchRepository().fetchSearchList(
                  //     q: v,
                  //     favoriteType:
                  //     PrescriptionFavouriteType.chiefComplaint.toString());
                },
              ),

              //Multidose//
              SizedBox(
                height: 15,
              ),
              Wrap(
                  children: List.generate(
                multiDoseLength,
                (index) => Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  decoration: BoxDecoration(
                      color: Color(0xffEFF5FF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          multiDoseLength--;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TypeAheadFormField<String>(
                        textFieldConfiguration: TextFieldConfiguration(
                            textInputAction: TextInputAction.search,
                            controller: multiDoseController,
                            decoration: InputDecoration(
                              labelText: "Multidose",
                              //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                              hintText: "Multidose",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xff3E58FF)),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )),
                        itemBuilder: (_, v) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("$v"),
                          );
                        },
                        onSuggestionSelected: (v) {
                          multiDoseController.text = v;
                          // setState(() {});
                        },
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suggestionsCallback: (v) {
                          // return;
                          return vm.medicationModelList.obj.doseList
                              .map((e) => e.preDiagnosisVal)
                              .where((element) => element
                                  .toLowerCase()
                                  .contains(v.toLowerCase()))
                              .toList();
                        },
                      ),

                      //Duration
                      //Quantity
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TypeAheadFormField<String>(
                              textFieldConfiguration: TextFieldConfiguration(
                                  textInputAction: TextInputAction.search,
                                  controller: multiDoseDurationController,
                                  decoration: InputDecoration(
                                    labelText: "Duration",
                                    //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                                    hintText: "Duration",
                                    // prefixIcon: Icon(
                                    //   Icons.search,
                                    //   color: Colors.grey,
                                    // ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff3E58FF)),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  )),
                              itemBuilder: (_, v) {
                                return Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("$v"),
                                );
                              },
                              onSuggestionSelected: (v) {
                                multiDoseDurationController.text = v;
                                // setState(() {});
                              },
                              suggestionsBoxDecoration:
                                  SuggestionsBoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suggestionsCallback: (v) {
                                return vm.medicationModelList.obj.durationList
                                    .map((e) => e.preDiagnosisVal)
                                    .where((element) => element
                                        .toLowerCase()
                                        .contains(v.toLowerCase()))
                                    .toList();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: TypeAheadFormField<String>(
                              textFieldConfiguration: TextFieldConfiguration(
                                  textInputAction: TextInputAction.search,
                                  controller: multiDoseDaysController,
                                  decoration: InputDecoration(
                                    labelText: "Days",
                                    //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                                    hintText: "Days",
                                    // prefixIcon: Icon(
                                    //   Icons.search,
                                    //   color: Colors.grey,
                                    // ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff3E58FF)),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  )),
                              itemBuilder: (_, v) {
                                return Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("$v"),
                                );
                              },
                              onSuggestionSelected: (v) {
                                multiDoseDaysController.text = v;
                                // if (chiefComplaintSelectedItems.contains(v)) {
                                //   BotToast.showText(text: "All ready added");
                                // } else {
                                // //   chiefComplaintSelectedItems.add(v);
                                // }
                                // setState(() {});
                              },
                              suggestionsBoxDecoration:
                                  SuggestionsBoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suggestionsCallback: (v) {
                                return vm.medicationModelList.obj.durationMuList
                                    .map((e) => e.preDiagnosisVal)
                                    .where((element) => element
                                        .toLowerCase()
                                        .contains(v.toLowerCase()))
                                    .toList();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: multiDoseQuantityController,
                              autofocus: false,
                              decoration: InputDecoration(
                                //filled: true,
                                labelText: "Quantity",
                                //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                                hintText: "Quantity",
                                // prefixIcon: Icon(
                                //   Icons.search,
                                //   color: Colors.grey,
                                // ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xff3E58FF)),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Instructions//
                      SizedBox(
                        height: 15,
                      ),
                      TypeAheadFormField<String>(
                        textFieldConfiguration: TextFieldConfiguration(
                            textInputAction: TextInputAction.search,
                            controller: multiDoseInstructionController,
                            decoration: InputDecoration(
                              labelText: "Instructions",
                              //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                              hintText: "Instructions",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xff3E58FF)),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )),
                        itemBuilder: (_, v) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("$v"),
                          );
                        },
                        onSuggestionSelected: (v) {
                          multiDoseInstructionController.text = v;
                          // setState(() {});
                        },
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suggestionsCallback: (v) {
                          return vm.medicationModelList.obj.relationWithMealList
                              .map((e) => e.preDiagnosisVal)
                              .where((element) => element
                                  .toLowerCase()
                                  .contains(v.toLowerCase()))
                              .toList();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              )),
              //Continue this medicine
              SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Continue this medicine'),
                value: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val;
                  });
                },
              ),

              //Duration
              //Quantity
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: TypeAheadFormField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                          textInputAction: TextInputAction.search,
                          controller: continueDurationController,
                          decoration: InputDecoration(
                            labelText: "Duration",
                            //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                            hintText: "Duration",
                            // prefixIcon: Icon(
                            //   Icons.search,
                            //   color: Colors.grey,
                            // ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff3E58FF)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          )),
                      itemBuilder: (_, v) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("$v"),
                        );
                      },
                      onSuggestionSelected: (v) {
                        continueDurationController.text = v;
                        // setState(() {});
                      },
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suggestionsCallback: (v) {
                        return vm.medicationModelList.obj.durationList
                            .map((e) => e.preDiagnosisVal)
                            .where((element) =>
                                element.toLowerCase().contains(v.toLowerCase()))
                            .toList();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TypeAheadFormField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                          textInputAction: TextInputAction.search,
                          controller: continueDaysController,
                          decoration: InputDecoration(
                            labelText: "Days",
                            //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                            hintText: "Days",
                            // prefixIcon: Icon(
                            //   Icons.search,
                            //   color: Colors.grey,
                            // ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff3E58FF)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          )),
                      itemBuilder: (_, v) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("$v"),
                        );
                      },
                      onSuggestionSelected: (v) {
                        continueDaysController.text = v;
                        // setState(() {});
                      },
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suggestionsCallback: (v) {
                        return vm.medicationModelList.obj.durationMuList
                            .map((e) => e.preDiagnosisVal)
                            .where((element) =>
                                element.toLowerCase().contains(v.toLowerCase()))
                            .toList();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: continueQuantityController,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEFF5FF),
                        labelText: "Quantity",
                        //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                        hintText: "Quantity",
                        // prefixIcon: Icon(
                        //   Icons.search,
                        //   color: Colors.grey,
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffEFF5FF)),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffEFF5FF)),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Buttons
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      multiDoseLength++;
                      setState(() {});
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff6374DF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          children: [
                            addMulIon,
                            Spacer(),
                            Text('Add Multidose',
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 90,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff6374DF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.add_circle_outline, color: Colors.white),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Add',
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}