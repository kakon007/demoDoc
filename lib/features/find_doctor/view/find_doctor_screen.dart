import 'dart:ui';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/filter_view_model.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_container_for_find_doc.dart';
import 'package:provider/provider.dart';

class FindYourDoctorScreen extends StatefulWidget {
  String title;
  String phoneText;
  String emailText;
  String addressText;
  String orgNo;
  String companyNo;
  String id;
  String status;

  FindYourDoctorScreen(this.title, this.phoneText, this.emailText,
      this.addressText, this.orgNo, this.companyNo, this.id);

  @override
  _FindYourDoctorScreenState createState() => _FindYourDoctorScreenState();
}

class _FindYourDoctorScreenState extends State<FindYourDoctorScreen> {
  AsyncMemoizer<DoctorsGridModel> _memoizer;

  TextEditingController specialityController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  List _items1 = [];
  List _items2 = [];
  List _items3 = [];
  List _items4 = [];
  var length;
  final Widget filtericon = SvgPicture.asset(
    "assets/icons/fliter.svg",
    width: 10,
    height: 18,
    fit: BoxFit.fitWidth,
    allowDrawingOutsideViewBox: true,
    matchTextDirection: true,
    //semanticsLabel: 'Acme Logo'
  );
  ScrollController _scrollController;
  ScrollController _scrollController2;
  List<SpecializationItem> specialistList;
  List<DeptItem> deptList;
  var specialityItems = List<SpecializationItem>();
  var deptItems = List<DeptItem>();
  var deptSelectedItem;
  var specialSelectedItem;
  var doctorItem="";
  var doctorSearchItem="";
  bool isFiltered = false;
  // void doctorSearch(String value){
  //   doctorSearchItem= value;
  // }
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController2 = ScrollController();
    var vm = Provider.of<DoctorListViewModel>(context, listen: false);
    vm.getDoctor(widget.orgNo, widget.companyNo, null, null, "");
    // TODO: implement initState
    super.initState();
    isFiltered = false;
    _memoizer = AsyncMemoizer();
    Future.delayed(Duration.zero, () async {
      var vm2 = Provider.of<FilterViewModel>(context, listen: false);
      await vm2.getDepartment(widget.companyNo);
      await vm2.getSpecialist(widget.id, widget.orgNo);
      specialistList = vm2.specialList;
      specialityItems.addAll(specialistList);
      deptList = vm2.departmentList;
      deptItems.addAll(deptList);
    });

    // });
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorListViewModel>(context);
    final String assetName1 = "assets/icons/phone.svg";
    final String assetName2 = "assets/icons/mail.svg";
    final String assetName3 = "assets/icons/marker.svg";
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final Widget phoneimg = SvgPicture.asset(
      assetName1,
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget mailimg = SvgPicture.asset(
      assetName2,
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final Widget mapimg = SvgPicture.asset(
      assetName3,
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    var deviceWidth = MediaQuery.of(context).size.width;
    var contrainerWidth = deviceWidth >= 400 ? double.infinity : 400.00;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 19.0, left: 5),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: HexColor('#354291'),
                    )),
              ),
              backgroundColor: HexColor('#354291'),
              expandedHeight: 150.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  // centerTitle: true,
                  //titlePadding: EdgeInsetsGeometry.lerp(, a, 10),
                  titlePadding: EdgeInsetsDirectional.only(
                      start: 15.0, bottom: 4.0, top: 31),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_outlined,
                                    color: Colors.white)),
                            SizedBox(
                              width: 3,
                            ),
                            Container(
                              width: 175,
                              child: Text(widget.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  )),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NotificationScreen()));
                              },
                            )
                          ],
                        ),
                      ),

                      // Text("Collapsing Toolbar",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 16.0,
                      //     )),
                    ],
                  ),
                  background: Stack(children: [
                    // Container(
                    //   height: 420.0,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: FadeInImage(
                    //     fit: BoxFit.cover,
                    //     image:AssetImage("assets/images/dashboard_back.png"),
                    //     placeholder: AssetImage(''),
                    //   ),
                    // ),
                    Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/backhosimg.png',
                            ),
                          ),
                        ),
                        height: 450.0,
                      ),
                      Container(
                        height: 350.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  HexColor('#D6DCFF').withOpacity(0.9),
                                  HexColor('#FFFFFF').withOpacity(0.8),
                                ],
                                stops: [
                                  0.0,
                                  1.0
                                ])),
                      )
                    ]),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70.0, left: 25),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: HexColor('#D6DCFF'), width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SizedBox(
                                height: 85,
                                width: MediaQuery.of(context).size.width / 4.5,
                                child:
                                    Image.asset("assets/images/dummyimg.png")),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 75.0),
                              child: Container(
                                  width: 260,
                                  child: Text(
                                    widget.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: HexColor('#141D53')),
                                  )),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                phoneimg,
                                SizedBox(
                                  width: 5,
                                ),
                                Text(widget.phoneText,
                                    style: GoogleFonts.poppins(
                                        color: HexColor('#141D53'),
                                        fontSize: 11)),
                                SizedBox(
                                  width: 5,
                                ),
                                mailimg,
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 105,
                                    child: Text(widget.emailText,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          color: HexColor('#141D53'),
                                          fontSize: 11,
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: mapimg,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 200,
                                    child: Text(widget.addressText,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          color: HexColor('#141D53'),
                                          fontSize: 11,
                                        ))),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ])),
            ),
            createSilverAppBar2(),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //         (_, index) =>
            //         ListTile(
            //           title: Text("Index: $index"),
            //         ),
            //   ),
            // )
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //       FlatButton(onPressed: (){
              //         vm.getDoctor("7", "10");
              //       },
              // child: Text("Button"),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 8, bottom: 3, left: 25),
                      child: Text('Doctors',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600))),
          isFiltered == false? Text(""):
          Container(
              margin: EdgeInsets.only(top: 8, bottom: 3, right: 25),
              child: Text('Showing Filtered result',
                  style: GoogleFonts.poppins(
                      fontSize: 13,)))
          // Container(
          //     margin: EdgeInsets.only(top: 15, bottom: 3, right: 25),
          //     child: Text("Showing Filtered result", style: GoogleFonts.poppins(),)),
                ],
              ),
              vm.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.appbarPrimary),
                      ),
                    )
                  : vm.doctorList.length == 0
                      ? Center(child: Text("No doctors found!"))
                      : Column(children: [
                          ...List.generate(
                            vm.doctorList.length,
                            (i) => CustomContainer(
                                vm.doctorList[i]?.doctorName == null
                                    ? ""
                                    : vm.doctorList[i]?.doctorName,
                                vm.doctorList[i]?.specializationName == null
                                    ? ""
                                    : vm.doctorList[i]?.specializationName,
                                'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital',
                                "assets/images/doc.png",
                                vm.doctorList[i]?.consultationFee.toString() ==
                                        null
                                    ? ""
                                    : vm.doctorList[i]?.consultationFee
                                        .toString(),
                                vm.doctorList[i]?.docDegree == null
                                    ? ""
                                    : vm.doctorList[i]?.docDegree,
                                vm.doctorList[i]?.doctorNo.toString() == null
                                    ? ""
                                    : vm.doctorList[i]?.doctorNo.toString(),
                                vm.doctorList[i]?.companyNo.toString() == null
                                    ? ""
                                    : vm.doctorList[i]?.companyNo.toString(),
                                vm.doctorList[i]?.ogNo.toString() == null
                                    ? ""
                                    : vm.doctorList[i]?.ogNo.toString()),
                          ),
                        ])
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar2() {
    var vm2 = Provider.of<FilterViewModel>(context, listen: true);
    List<SpecializationItem> specialistList = vm2.specialList;
    List<DeptItem> deptList = vm2.departmentList;
    // specialistList = vm2.specialList;
    var width = MediaQuery.of(context).size.width * 0.44;
    var height = MediaQuery.of(context).size.height;
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );
    void specializationSearch(String query) {
      List<SpecializationItem> initialSpecialitySearch =
          List<SpecializationItem>();
      initialSpecialitySearch.addAll(specialistList);
      if (query.isNotEmpty) {
        List<SpecializationItem> initialSpecialitySearchItems =
            List<SpecializationItem>();
        initialSpecialitySearch.forEach((item) {
          if (item.dtlName.contains(query.substring(0, 1).toUpperCase() +
              query.substring(1).toLowerCase())) {
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
    void departmentSearch(String query) {
      List<DeptItem> initialDeptSearch = List<DeptItem>();
      initialDeptSearch.addAll(deptList);
      if (query.isNotEmpty) {
        List<DeptItem> initialDeptSearchItems = List<DeptItem>();
        initialDeptSearch.forEach((item) {
          if (item.buName.contains(query)) {
            initialDeptSearchItems.add(item);
          }
        });
        setState(() {
          deptItems.clear();
          deptItems.addAll(initialDeptSearchItems);
        });
        return;
      } else {
        setState(() {
          deptItems.clear();
          deptItems.addAll(deptList);
        });
      }
    }

    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var searchDepartment = TextField(
        onChanged: (value) {
          departmentSearch(value.toUpperCase());
        },
        controller: deptController,
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
        onChanged: (value) {
          specializationSearch(value);
          // print(value);
        },
        controller: specialityController,
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
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.clear)),
            ],
          ),
          horizontalSpace,
          horizontalSpace
        ],
      ),
    );
    //var list = ['one', 'two', 'three'];
    var vm = Provider.of<DoctorListViewModel>(context, listen: false);

    var deviceWidth = MediaQuery.of(context).size.width;
    var contrainerWidth = deviceWidth >= 400 ? double.infinity : 400.00;
    return SliverAppBar(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      floating: false,
      forceElevated: true,
      shadowColor: Colors.blue.withOpacity(0.3),
      elevation: 5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.only(
            start: 18.0, bottom: 10.0, top: 15, end: 45),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7.0, right: 10),
          child: TextField(
              onChanged: (value) {
                doctorItem= value.replaceAll(" ", "%20");

                vm.getDoctor(widget.orgNo, widget.companyNo, deptSelectedItem, specialSelectedItem, doctorItem);
                 //doctorSearch(doctorItem);
              },
              controller: doctorController,
              decoration: new InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                      left: width / 8.64, right: width / 8.64),
                  child: Icon(Icons.search),
                ),
                hintText: "Find your doctor",
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: HexColor("#D6DCFF"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: HexColor("#EAEBED"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: new BorderSide(color: Colors.teal)),
                contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
              )),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
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
                                  left: width / 6.912, right: width / 6.912),
                              child: Column(
                                children: [
                                  Container(
                                    height: height / 3.60,
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
                                        searchDepartment,
                                        Expanded(
                                          child: Scrollbar(
                                            isAlwaysShown: true,
                                            controller: _scrollController,
                                            child: ListView(
                                              controller: _scrollController,
                                              children: deptItems
                                                  .map(
                                                    (DeptItem item) =>
                                                        Container(
                                                      height: 35,
                                                      child: CheckboxListTile(
                                                        activeColor: AppTheme
                                                            .signInSignUpColor,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        title: Text(
                                                          item.buName
                                                                  .substring(
                                                                      0, 1)
                                                                  .toUpperCase() +
                                                              item.buName
                                                                  .substring(1)
                                                                  .toLowerCase(),
                                                          style: GoogleFonts.poppins(
                                                              fontWeight: item
                                                                          .isChecked ==
                                                                      true
                                                                  ? FontWeight
                                                                      .w600
                                                                  : FontWeight
                                                                      .normal),
                                                        ),
                                                        value: item.isChecked,
                                                        onChanged: (bool val) {
                                                          setState(() {
                                                            val == true
                                                                ? _items3.add(
                                                                    item.id)
                                                                : _items3
                                                                    .remove(item
                                                                        .id);
                                                            print(_items1);
                                                            print(_items3);
                                                            item.isChecked =
                                                                val;
                                                            var stringList =
                                                                _items3.join(
                                                                    "&buList%5B%5D=");
                                                            deptSelectedItem =
                                                                "&buList%5B%5D=" +
                                                                    stringList;
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
                                  Container(
                                    height: height / 3.55,
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
                                            child: ListView(
                                              controller: _scrollController2,
                                              children: specialityItems
                                                  .map(
                                                    (SpecializationItem item) =>
                                                        Container(
                                                      height: 35,
                                                      child: CheckboxListTile(
                                                        activeColor: AppTheme
                                                            .signInSignUpColor,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        title: Text(
                                                          item.dtlName,
                                                          style: GoogleFonts.poppins(
                                                              fontWeight: item
                                                                          .isChecked ==
                                                                      true
                                                                  ? FontWeight
                                                                      .w600
                                                                  : FontWeight
                                                                      .normal),
                                                        ),
                                                        value: item.isChecked,
                                                        onChanged: (bool val) {
                                                          setState(() {
                                                            val == true
                                                                ? _items4.add(
                                                                    item.id)
                                                                : _items4
                                                                    .remove(item
                                                                        .id);
                                                            item.isChecked =
                                                                val;
                                                            var stringList =
                                                                _items4.join(
                                                                    "&specializationList%5B%5D=");
                                                            specialSelectedItem =
                                                                "&specializationList%5B%5D=" +
                                                                    stringList;
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
                                  SizedBox(
                                    height: height >= 600 ? 25 : 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AbsorbPointer(
                                        absorbing:
                                            _items4.isEmpty && _items3.isEmpty || isFiltered== false
                                                ? true
                                                : false,
                                        child: SizedBox(
                                          width: width * .9,
                                          height: width * .25,
                                          child: FlatButton(
                                            onPressed: () {
                                              isFiltered = false;
                                              vm2.specialList
                                                  .forEach((element) {
                                                element.isChecked = false;
                                              });
                                              vm2.departmentList
                                                  .forEach((element) {
                                                element.isChecked = false;
                                              });
                                              print("Shakil" + doctorItem);
                                              _items3.clear();
                                              _items4.clear();
                                              _items1.clear();
                                              _items2.clear();
                                              vm.getDoctor(widget.orgNo,
                                                  widget.companyNo, null, null, doctorItem);
                                              Navigator.pop(context);
                                            },
                                            textColor: Colors.white,
                                            color: _items4.isEmpty &&
                                                _items3.isEmpty || isFiltered== false ? HexColor("#969EC8")
                                                : AppTheme.appbarPrimary,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                    color: _items4.isEmpty &&
                                                            _items3.isEmpty || isFiltered== false
                                                        ? HexColor("#969EC8")
                                                        : AppTheme
                                                            .appbarPrimary,
                                                    width: 1)

                                            ),
                                            child: Text(
                                              StringResources.clearFilterText,
                                              style: GoogleFonts.poppins(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AbsorbPointer(
                                        absorbing: _items4.isEmpty &&
                                                    _items3.isEmpty ||
                                                _items1.join('') ==
                                                        _items3.join('') &&
                                                    _items2.join('') ==
                                                        _items4.join('')
                                            ? true
                                            : false,
                                        child: SizedBox(
                                          width: width * .9,
                                          height: width * .25,
                                          child: FlatButton(
                                            textColor: Colors.white,
                                            onPressed: () {
                                              isFiltered = true;
                                              _items1 = List.from(_items3);
                                              _items2 = List.from(_items4);
                                              Navigator.pop(context);
                                              print(doctorSearchItem);
                                              vm.getDoctor(
                                                  widget.orgNo,
                                                  widget.companyNo,
                                                  deptSelectedItem,
                                                  specialSelectedItem, doctorItem);
                                            },
                                            color: _items4.isEmpty &&
                                                        _items3.isEmpty ||
                                                    _items1.join('') ==
                                                            _items3.join('') &&
                                                        _items2.join('') ==
                                                            _items4.join('')
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
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 25),
            child: SvgPicture.asset(
              "assets/icons/fliter.svg",
              width: 10,
              height: 18,
              fit: BoxFit.fitWidth,
              allowDrawingOutsideViewBox: true,
              matchTextDirection: true,
              color: isFiltered == true? Colors.blue : Colors.grey,
              //semanticsLabel: 'Acme Logo'
            ),
          ),
        ),
      ],
    );
  }
}
