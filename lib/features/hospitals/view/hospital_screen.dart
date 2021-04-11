
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/my_health/view/doctor_filters.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  List<Item> dataList = List<Item>();
  final List<DeptItem> departmentList = List<DeptItem>();
  final List<SpecializationItem> specializationList = List<SpecializationItem>();
  List _items3 = [];
  List _items4 = [];
  DeptListModel data;
  SepcializationListModel spItem;
  var accessToken;
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
    fetchHospitalList();
    fetchDepartmentList();
    fetchSpecializationList();
    //getNews();
    super.initState();
    _scrollController = ScrollController();
    _scrollController2 = ScrollController();
  }
  Future<HospitalListModel> fetchHospitalList() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyList";
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
     // print(response.body);
      HospitalListModel data = hospitalListModelFromJson(response.body) ;
      setState(() {
        data.items.forEach((element) {
          dataList.add(element);
        });
      });
      return data;
    }else {
      return null;
    }
  }
  // Future<DeptListModel> fetchDepartmentList() async {
  //   // SharedPreferences prefs= await SharedPreferences.getInstance();
  //   // accessToken = prefs.getString('accessToken');
  //   // var username=  prefs.getString("username");
  //   // print(username);
  //   var url =
  //       "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/departmentList?companyNo=2&flagList=2,3";
  //   var client = http.Client();
  //   var response = await client.get(url);
  //   print("anbcsdcdsfdfdf");
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonMap = json.decode(response.body);
  //     print(response.body);
  //     data = deptListModelFromJson(response.body) ;
  //     setState(() {
  //       data.deptItem.forEach((element) {
  //         departmentList.add(element);
  //       });
  //     });
  //    print('Data:: ' + data.deptItem[12].isChecked.toString());
  //     return data;
  //   }else {
  //     return null;
  //   }
  // }
  Future<DeptListModel>  fetchDepartmentList() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/departmentList?companyNo=2&flagList=2,3";
    final http.Response response = await http.get(url);
    print("aasdsadsadsadsadadsadsdfhghg");
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      data = deptListModelFromJson(response.body) ;
      // print(spItem);
      setState(() {
        data.deptItem.forEach((element) {
          departmentList.add(element);
        });
      });
      print('Data:: ' + data.deptItem[2].buName);
      return data;
    }else {
      return null;
    }
  }
  Future<SepcializationListModel>  fetchSpecializationList() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/specializationList";
    final http.Response response = await http.post(url,body: jsonEncode(<String, int>{
      'id': 4,
      "ogNo": 2
    }),);
    //print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      spItem = sepcializationListModelFromJson(response.body) ;
     // print(spItem);
      setState(() {
        spItem.specializationItem.forEach((element) {
          specializationList.add(element);
        });
      });
    // print('Data:: ' + spItem.specializationItem[2].dtlDescription);
      return spItem;
    }else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(accessToken);
   // print(specializationList[1].dtlName);
    var searchField = SignUpFormField(
      borderRadius: 30,
      hintText: StringResources.searchBoxHint,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.search_rounded,
          color: Colors.grey,
        ),
      ),
    );
    var hospital= FutureBuilder<HospitalListModel>(
        future:fetchHospitalList(),
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...List.generate(
                    snapshot.data.items.length,
                        (i) => HospitalListCard(snapshot.data.items[i].companyName,snapshot.data.items[i].companyAddress==null?"Mirpur,Dahaka,Bangladesh":snapshot.data.items[i].companyAddress,"60 Doctors",snapshot.data.items[i].companyPhone==null?"+880 1962823007":snapshot.data.items[i].companyPhone,snapshot.data.items[i].companyEmail==null?"info@mysoftitd.com":snapshot.data.items[i].companyEmail,snapshot.data.items[i].companyLogo,snapshot.data.items[i].ogNo.toString(), snapshot.data.items[i].companyId),
                  ),
                ],
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        });
    var width = MediaQuery.of(context).size.width * 0.44;
    var height = MediaQuery.of(context).size.height;
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
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },child: Icon(Icons.clear)),
            ],
          ),
          horizontalSpace,
          horizontalSpace
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.appbarPrimary,
        title: Text(
          StringResources.hospitalListAppbar,
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        actions: <Widget>[
          accessToken!=null ? Container(
            //margin: EdgeInsets.all(100.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: CircleAvatar(
              backgroundImage:AssetImage("assets/images/alok.png"),radius: 15.0,),
          ) :SizedBox(),
          SizedBox(width: 10,),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 20,
            ),
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
                          var index=0;
                          bool isTrue= false;
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
                                              searchDepartment,
                                              Expanded(
                                                child: Scrollbar(
                                                  isAlwaysShown: true,
                                                  controller:
                                                  _scrollController,
                                                  child: ListView(
                                                    controller:
                                                    _scrollController,
                                                    children: departmentList
                                                        .map(
                                                          (DeptItem
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
                                                                item.buName,
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
                                                                      ? _items3.add(item.buName)
                                                                      : _items3
                                                                      .remove(item.buName);
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
                                                    children: specializationList
                                                        .map(
                                                          (SpecializationItem
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
                                                                item.dtlName,
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
                                                                      ? _items3.add(item.dtlName)
                                                                      : _items3
                                                                      .remove(item.dtlName);
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
                                                  onPressed: () {
                                                    _items4.clear();
                                                    _items3.clear();
                                                  },
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
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // FlatButton(onPressed: (){
            //  fetchSpecializationList();
            // }),
            searchField,
            Expanded(child: hospital),
          ],
        ),
      ),
    );
  }
}

class HospitalList {
  String hospitalName;
  String location;
  String doctorOnline;
  String hospitalLogo;

  HospitalList(
      {this.hospitalLogo, this.hospitalName, this.location, this.doctorOnline});
}
