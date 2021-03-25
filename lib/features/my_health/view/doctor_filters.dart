import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class DoctorFilter extends StatefulWidget {
  @override
  _DoctorFilterState createState() => _DoctorFilterState();
}

class _DoctorFilterState extends State<DoctorFilter> {
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('Chest Medicine', false),
    SimpleModel('Cardiology', false),
    SimpleModel('Child Neurology', false),
    SimpleModel('Chest Medicine', false),
    SimpleModel('Dermatology', false),
    SimpleModel('Diabetics', false),
  ];
  List _items3 = [];
  List _items4 = [];
  final List<SimpleModel> _items2 = <SimpleModel>[
    SimpleModel('Child Specialist', false),
    SimpleModel('Chest Surgeon', false),
    SimpleModel('Diabetologist', false),
    SimpleModel('Endocrinologist', false),
    SimpleModel('ENT', false),
    SimpleModel('Gastroenterologist', false),
  ];
  ScrollController _scrollController;
  ScrollController _scrollController2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController2 = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width * 0.44;
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );
    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var searchDepartment = TextFormField(
        decoration: new InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          hintText: StringResources.searchDepartment,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#EAEBED"), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: new BorderSide(color: Colors.teal)),
          contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
        ));
    var searchSpeciality = TextFormField(
        decoration: new InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          hintText: StringResources.searchSpeciality,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#EAEBED"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: new BorderSide(color: Colors.teal)),
          contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
        ));
    var modalSheetTitle = Padding(
      padding: EdgeInsets.only(left: width / 6.912, right: width / 6.912),
      child: Column(
        children: [
          horizontalSpace,
          horizontalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpace,
              Text(
                StringResources.filters,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.clear),
            ],
          ),
          horizontalSpace,
          horizontalSpace
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.signInSignUpColor,
        title: Text("MyHealthBD"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return FractionallySizedBox(
                                heightFactor: 0.85,
                                child: Column(
                                  children: [
                                    modalSheetTitle,
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 6.912,
                                            right: width / 6.912),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: height/3.55,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(25),
                                                        topRight:
                                                        Radius.circular(25)),
                                                    border: Border.all(
                                                      color: HexColor("#D6DCFF"),
                                                      //                   <--- border color
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      searchDepartment,
                                                      Expanded(
                                                        child: Scrollbar(
                                                          isAlwaysShown: true,
                                                          controller:
                                                          _scrollController,
                                                          child: ListView(
                                                            controller:
                                                            _scrollController,
                                                            children:
                                                            _items
                                                                .map(
                                                                  (SimpleModel
                                                              item) =>
                                                                  Container(
                                                                    height: 35,
                                                                    child:
                                                                    CheckboxListTile(
                                                                      activeColor:
                                                                      AppTheme
                                                                          .signInSignUpColor,
                                                                      controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                      title: Text(
                                                                        item.title,
                                                                        style: GoogleFonts.poppins(
                                                                            fontWeight: item.isChecked ==
                                                                                true
                                                                                ? FontWeight
                                                                                .w600
                                                                                : FontWeight
                                                                                .normal),
                                                                      ),
                                                                      value: item
                                                                          .isChecked,
                                                                      onChanged:
                                                                          (bool val) {
                                                                        setState(() {
                                                                          val == true
                                                                              ? _items4.add(item
                                                                              .title)
                                                                              : _items4
                                                                              .remove(item.title);
                                                                          item.isChecked =
                                                                              val;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                            ).toList(),


                                                          ),

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            horizontalSpace,
                                            horizontalSpace,
                                            horizontalSpace,
                                            Container(
                                              height: height/3.55,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(25),
                                                    topRight:
                                                    Radius.circular(25)),
                                                border: Border.all(
                                                  color: HexColor("#D6DCFF"),
                                                  //                   <--- border color
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  searchSpeciality,
                                                  Expanded(
                                                    child: Scrollbar(
                                                      isAlwaysShown: true,
                                                      controller:
                                                      _scrollController2,
                                                      child: ListView(
                                                        controller:
                                                        _scrollController2,
                                                        children: _items2
                                                            .map(
                                                              (SimpleModel
                                                          item) =>
                                                              Container(
                                                                height: 35,
                                                                child:
                                                                CheckboxListTile(
                                                                  activeColor:
                                                                  AppTheme
                                                                      .signInSignUpColor,
                                                                  controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                                  title: Text(
                                                                    item.title,
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight: item.isChecked ==
                                                                            true
                                                                            ? FontWeight
                                                                            .w600
                                                                            : FontWeight
                                                                            .normal),
                                                                  ),
                                                                  value: item
                                                                      .isChecked,
                                                                  onChanged:
                                                                      (bool val) {
                                                                    setState(() {
                                                                      val == true
                                                                          ? _items3.add(item
                                                                          .title)
                                                                          : _items3
                                                                          .remove(item.title);
                                                                      item.isChecked =
                                                                          val;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                        )
                                                            .toList(),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height:height>=600 ? 40: 25,),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                AbsorbPointer(
                                                  absorbing:
                                                  _items4.isEmpty && _items3.isEmpty
                                                      ? true
                                                      : false,
                                                  child: SizedBox(
                                                    width: width * .9,
                                                    height: width * .25,
                                                    child: FlatButton(
                                                      onPressed: () {},
                                                      textColor: _items4.isEmpty &&
                                                          _items3.isEmpty
                                                          ? HexColor("#969EC8")
                                                          : AppTheme.appbarPrimary,
                                                      color: HexColor("#FFFFFF"),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(8),
                                                          side: BorderSide(
                                                              color: _items4.isEmpty &&
                                                                  _items3.isEmpty
                                                                  ? HexColor("#969EC8")
                                                                  : AppTheme
                                                                  .appbarPrimary,
                                                              width: 1)),
                                                      child: Text(
                                                        StringResources.clearFilterText,
                                                        style: GoogleFonts.poppins(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AbsorbPointer(
                                                  absorbing:
                                                  _items4.isEmpty && _items3.isEmpty
                                                      ? true
                                                      : false,
                                                  child: SizedBox(
                                                    width: width * .9,
                                                    height: width * .25,
                                                    child: FlatButton(
                                                      textColor: Colors.white,
                                                      onPressed: () {},
                                                      color: _items4.isEmpty &&
                                                          _items3.isEmpty
                                                          ? HexColor("#969EC8")
                                                          : AppTheme.appbarPrimary,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      child: Text(
                                                        StringResources.applyFilterText,
                                                        style: GoogleFonts.poppins(),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      });
                },
                child: Text("Bottom Modal Sheet"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleModel {
  String title;
  bool isChecked;

  SimpleModel(this.title, this.isChecked);
}
