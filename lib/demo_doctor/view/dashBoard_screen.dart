
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/demo_doctor/view/active_doctors.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/filter_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../features/find_doctor/models/doctors_list_model.dart';

class DashboardDemoScreen extends StatefulWidget {
  @override
  _DashboardDemoScreenState createState() => _DashboardDemoScreenState();
}

class _DashboardDemoScreenState extends State<DashboardDemoScreen>  with AfterLayoutMixin{
  List<Datum> hospitalList;
  bool isSearched = false;
  List<Datum> hospitalItems=[];
  TextEditingController deptController = TextEditingController();

  bool isDesktop = Responsive.isDesktop(appNavigator.context);
  bool isTablet = Responsive.isTablet(appNavigator.context);
  bool isMobile = Responsive.isMobile(appNavigator.context);
  TextEditingController specialityController = TextEditingController();
 // TextEditingController deptController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  List _items1 = [];
  List _items2 = [];
  List _items3 = [];
  List _items4 = [];
  ScrollController _scrollController;
  ScrollController _scrollController2;
  List<SpecializationItem> specialistList;
  var items = <SpecializationItem>[];
  ScrollController _scrollControllerPagination = ScrollController();
  var width;
  var length;

  List<DeptItem> deptList;
  var specialityItems = <SpecializationItem>[];
  var deptItems = <DeptItem>[];
  var deptSelectedItem;
  var specialSelectedItem;
  var doctorItem = "";
  var doctorSearchItem = "";
  bool isFiltered = false;

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<DoctorListViewModel>(context, listen: false);
   await vm.getDoctor(2.toString(), 2.toString(), null, null, "");
    hospitalList = vm.doctorList;
    hospitalItems.addAll(hospitalList);

      var vm2 = Provider.of<FilterViewModel>(context, listen: false);
      await vm2.getSpecialist(2.toString(), 2.toString());
      specialistList = vm2.specialList;
      specialityItems.addAll(specialistList);
    });
  }

  void hospitalSearch(String query) {
    List<Datum> initialHospitalSearch = List<Datum>();
    hospitalList.forEach((element) {
      initialHospitalSearch.add(element);
    });
    if (query.isNotEmpty) {
      List<Datum> initialHospitalSearchItems = List<Datum>();
      initialHospitalSearch.forEach((item) {
        if (item.specializationName.toLowerCase().contains(query.toLowerCase())) {
          initialHospitalSearchItems.add(item);
        }
      });
      setState(() {
        isSearched = true;
        hospitalItems.clear();
        hospitalItems.addAll(initialHospitalSearchItems);
      });
      return;
    } else {
      setState(() {
        hospitalItems.clear();
        hospitalItems.addAll(hospitalList);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorListViewModel>(context);
    var width = MediaQuery.of(context).size.width;
    print('lenth ${hospitalItems.length}');
    var imageDashboard = Padding(
        padding: EdgeInsets.only(right: 15),
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xff7266D8),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 1)),
            height: width <= 330 ? 25 : 30,
            width: width <= 330 ? 25 : 30,
            child: Center(
              child: Image.asset(
                'assets/images/pro1.png',
                height: width <= 330 ? 16 : 20,
                width: width <= 330 ? 16 : 20,
              ),
            )));

    var hospitalCard=Container(
      width: 170,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff7266D8).withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 105,top: 15),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1)),
                  height: width <= 330 ? 25 : 30,
                  width: width <= 330 ? 25 : 30,
                  child: Center(
                    child: Icon(Icons.add_circle,color: Color(0xff7266D8),size: 40,),
                  ))),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 52.0),
            child: Text('Hospitals',style: TextStyle(color: Colors.black,fontSize: 20),),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text('Visit Your Near Hospital',style: TextStyle(color: Colors.grey,fontSize: 10),),
          ),
        ],
      ),
    );

    var activeDoctorCard=
    Container(
      width: 170,
      height: 150,
      decoration: BoxDecoration(
        color:Color(0xff7266D8),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff7266D8).withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 105,top: 15),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff7266D8),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff7266D8), width: 1)),
                  height: width <= 330 ? 25 : 30,
                  width: width <= 330 ? 25 : 30,
                  child: Center(
                    child: Icon(Icons.account_circle_sharp,color: Colors.white,size: 40,),
                  ))),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text('Active Doctors',style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text('Find Active Doctors',style: TextStyle(color: Colors.white,fontSize: 10),),
          ),
        ],
      ),
    );

    var searchDepartment =
    SignUpFormField(
      //focusNode: widget.f1,
      onChanged: (value) {
        hospitalSearch(value);
      },
      focusBorderColor: "#8592E5",
      controller: deptController,
      borderRadius: 30,
      minimizeBottomPadding: true,
      hintSize:  12,
      hintText: 'Search Speciality',
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.search_rounded,
          //color: Colors.grey,
        ),
      ),
    );

    var vm2 = Provider.of<FilterViewModel>(context, listen: true);
    List<SpecializationItem> specialistList = vm2.specialList;
    List<DeptItem> deptList = vm2.departmentList;
    // specialistList = vm2.specialList;
    var height = MediaQuery.of(context).size.height;
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );
    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    void specializationSearch(String query) {
      List<SpecializationItem> initialSpecialitySearch = List<SpecializationItem>();
      initialSpecialitySearch.addAll(specialistList);
      if (query.isNotEmpty) {
        List<SpecializationItem> initialSpecialitySearchItems = List<SpecializationItem>();
        initialSpecialitySearch.forEach((item) {
          if (item.dtlName
              .contains(query.substring(0, 1).toUpperCase() + query.substring(1).toLowerCase())) {
            initialSpecialitySearchItems.add(item);
          }
        });
        setState(() {
          specialityItems.clear();
          specialityItems.addAll(initialSpecialitySearchItems);
        });
        return;
      } else {
        setState(() {
          specialityItems.clear();
          specialityItems.addAll(specialistList);
        });
      }
    }
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
                key: Key('filtersKey'),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 18 : 15,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Future.delayed(Duration.zero, () async {
                      var vm = Provider.of<DoctorListViewModel>(context, listen: false);
                      await Navigator.pop(context);
                      if (deptSelectedItem == null && specialSelectedItem == null) {
                        deptController.clear();
                       /// departmentSearch('');
                        specialityController.clear();
                        specializationSearch('');
                        _items3.clear();
                        _items4.clear();
                        _items1.clear();
                        _items2.clear();
                        isFiltered = false;
                        await vm.getDoctor(2.toString(), 2.toString(), null, null, doctorItem);
                      }
                    });
                  },
                  child: Icon(Icons.clear)),
            ],
          ),
          horizontalSpace,
          horizontalSpace
        ],
      ),
    );

    var searchSpeciality = TextField(
        onChanged: (value) {
          specializationSearch(value);
          // print(value);
        },
        controller: specialityController,
        decoration: new InputDecoration(
          hintStyle: GoogleFonts.poppins(fontSize: isTablet ? 16 : 14),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          // suffixIcon: Padding(
          //   padding: EdgeInsets.only(right: width / 8.64),
          //   child: Container(
          //     width: 20,
          //     height: 15,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: AppTheme.appbarPrimary,
          //     ),
          //     child: GestureDetector(
          //         onTap: () {
          //           specialityController.clear();
          //           specializationSearch('');
          //         },
          //         child: Icon(
          //           Icons.clear,
          //           size: 15,
          //           color: Colors.white,
          //         )),
          //   ),
          // ),
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
          contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 40.0, 0.0),
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello,Jahid", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        actions: [
          imageDashboard
        ],
      ),
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top:15.0,left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  hospitalCard,
                  Spacer(),
                  InkWell(onTap: (){
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ActiveDoctorsScreen()
                      ),
                    );
                  },child: activeDoctorCard)
                ],
              ),
              SizedBox(height: 30,),
              Text('Speciality',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(children: [
                Expanded(child: searchDepartment),
                SizedBox(width: 15,),
                InkWell(
                  onTap: (){
                    FocusScope.of(context).unfocus();
                    showModalBottomSheet(
                      //enableDrag: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                            return FractionallySizedBox(
                              heightFactor: .95,
                              child: Column(
                                children: [
                                  modalSheetTitle,
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: width / 6.912, right: width / 6.912),
                                      child: Column(
                                        children: [
                                          horizontalSpace,
                                          Container(
                                            height: isTablet ? height / 2.7 : height / 3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(25),
                                                  topRight: Radius.circular(25)),
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
                                                    controller: _scrollController2,
                                                    child:
                                                    ListView(
                                                      controller: _scrollController2,
                                                      children: specialityItems
                                                          .map(
                                                            (SpecializationItem item) => Container(
                                                          height: 35,
                                                          child: CheckboxListTile(
                                                            dense: true,
                                                            activeColor: AppTheme.signInSignUpColor,
                                                            controlAffinity:
                                                            ListTileControlAffinity.leading,
                                                            title: Text(
                                                              item.dtlName,
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: isTablet ? 18 : 15,
                                                                  fontWeight: item.isChecked == true
                                                                      ? FontWeight.w600
                                                                      : FontWeight.normal),
                                                            ),
                                                            value: item.isChecked,
                                                            key: Key(
                                                                'speciality${specialityItems.indexOf(item)}'),
                                                            onChanged: (bool val) {
                                                              setState(() {
                                                                val == true
                                                                    ? _items4.add(item.id)
                                                                    : _items4.remove(item.id);
                                                                item.isChecked = val;
                                                                var stringList = _items4
                                                                    .join("&specializationList%5B%5D=");
                                                                print(stringList);
                                                                if (_items4.isEmpty) {
                                                                  specialSelectedItem = null;
                                                                } else {
                                                                  specialSelectedItem =
                                                                      "&specializationList%5B%5D=" +
                                                                          stringList;
                                                                }
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                          .toList(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: isTablet
                                                ? 45
                                                : height >= 600
                                                ? 25
                                                : 15,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              AbsorbPointer(
                                                absorbing: _items4.isEmpty && _items3.isEmpty ||
                                                    isFiltered == false
                                                    ? true
                                                    : false,
                                                child: SizedBox(
                                                  width: 40,
                                                  height:  50,
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      isFiltered = false;
                                                      vm2.specialList.forEach((element) {
                                                        element.isChecked = false;
                                                      });
                                                      vm2.departmentList.forEach((element) {
                                                        element.isChecked = false;
                                                      });
                                                      deptController.clear();
                                                      //departmentSearch('');
                                                      specialityController.clear();
                                                      specializationSearch('');
                                                      deptSelectedItem = null;
                                                      specialSelectedItem = null;
                                                      _items3.clear();
                                                      _items4.clear();
                                                      _items1.clear();
                                                      _items2.clear();
                                                      vm.getDoctor(2.toString(), 2.toString(), null,
                                                          null, doctorItem);
                                                      Navigator.pop(context);
                                                    },
                                                    textColor: Colors.white,
                                                    color: _items4.isEmpty && _items3.isEmpty ||
                                                        isFiltered == false
                                                        ? HexColor("#969EC8")
                                                        : AppTheme.appbarPrimary,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                        side: BorderSide(
                                                            color: _items4.isEmpty && _items3.isEmpty ||
                                                                isFiltered == false
                                                                ? HexColor("#969EC8")
                                                                : AppTheme.appbarPrimary,
                                                            width: 1)),
                                                    child: Text(
                                                      StringResources.clearFilterText,
                                                      key: Key('clearFilterButton'),
                                                      style: GoogleFonts.poppins(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AbsorbPointer(
                                                absorbing: _items4.isEmpty && _items3.isEmpty ||
                                                    _items1.join('') == _items3.join('') &&
                                                        _items2.join('') == _items4.join('')
                                                    ? true
                                                    : false,
                                                child: SizedBox(
                                                  width: 40,
                                                  height:  50,
                                                  child: FlatButton(
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      deptItems.sort((a, b) => b.isChecked ? 1 : -1);
                                                      specialityItems.sort((a, b) => b.isChecked ? 1 : -1);
                                                      isFiltered = true;
                                                      _items1 = List.from(_items3);
                                                      _items2 = List.from(_items4);
                                                      Navigator.pop(context);
                                                      vm.getDoctor(
                                                          2.toString(),
                                                          2.toString(),
                                                          deptSelectedItem,
                                                          specialSelectedItem,
                                                          doctorItem);
                                                    },
                                                    color: _items4.isEmpty && _items3.isEmpty ||
                                                        _items1.join('') == _items3.join('') &&
                                                            _items2.join('') == _items4.join('')
                                                        ? HexColor("#969EC8")
                                                        : AppTheme.appbarPrimary,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: Text(
                                                      StringResources.applyFilterText,
                                                      key: Key('applyFilterButtonKey'),
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0, bottom: 5),
                    child: SvgPicture.asset(
                      "assets/icons/fliter.svg",
                      key: Key('filterIconKey'),
                      width: 10,
                      height: 18,
                      fit: BoxFit.fitWidth,
                      allowDrawingOutsideViewBox: true,
                      matchTextDirection: true,
                      color:  Colors.grey,
                      //semanticsLabel: 'Acme Logo'
                    ),
                  ),
                ),
              ],),
              SizedBox(height: 10,),
              Expanded(child:
              vm.doctorList.length==null?Loader():ListView.separated(
                  itemCount: isSearched == false &&
                      hospitalItems.length == 0
                      ? vm.doctorList.length
                      : hospitalItems.length,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff7266D8),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Center(child: Row(
                          children: [
                            Text(isSearched == false &&
                        hospitalItems.length == 0
                        ? vm.doctorList[index].specializationName
                            : hospitalItems[index].specializationName,style: TextStyle(color: Colors.white,fontSize: 20),),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)
                          ],
                        )),
                      ),
                    );
                  },separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );}))

            ],
          ),
        ),
      ),
    );
  }
}
