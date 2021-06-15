import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:async/async.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/filter_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_container_for_find_doc.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:recase/recase.dart';
class FindYourDoctorScreen extends StatefulWidget {
  Uint8List image;
  Uint8List backgroundImage;
  String title;
  String phoneText;
  String emailText;
  String addressText;
  String orgNo;
  String companyNo;
  String id;
  String status;

  FindYourDoctorScreen(
      this.image,
      this.backgroundImage,
      this.title,
      this.phoneText,
      this.emailText,
      this.addressText,
      this.orgNo,
      this.companyNo,
      this.id);

  @override
  _FindYourDoctorScreenState createState() => _FindYourDoctorScreenState();
}

class _FindYourDoctorScreenState extends State<FindYourDoctorScreen> {
  AsyncMemoizer<DoctorsGridModel> _memoizer;
  bool isDesktop = Responsive.isDesktop(appNavigator.context);
  bool isTablet = Responsive.isTablet(appNavigator.context);
  bool isMobile = Responsive.isMobile(appNavigator.context);
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
  var items = List<SpecializationItem>();
  ScrollController _scrollControllerPagination = ScrollController();
  var width;
  loadLogo(String image) {
    Uint8List _bytesImage = Base64Decoder().convert(image);
    return Image.memory(
      _bytesImage,
      fit: BoxFit.fill,
      width: isTablet? MediaQuery.of(context).size.width*.23 : width <350  ? 90 : 120,
      height: isTablet? 148 : width <350 ? 118 : 160,
      gaplessPlayback: true,
    );
  }

  List<DeptItem> deptList;
  var specialityItems = List<SpecializationItem>();
  var deptItems = List<DeptItem>();
  var deptSelectedItem;
  var specialSelectedItem;
  var doctorItem = "";
  var doctorSearchItem = "";
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

    _scrollControllerPagination.addListener(() {
      if (_scrollControllerPagination.position.pixels >=
          _scrollControllerPagination.position.maxScrollExtent) {
        print('Scrolling');
        vm.getMoreData(widget.orgNo, widget.companyNo, deptSelectedItem,
            specialSelectedItem, doctorItem);
      }
    });
  }

  @override
  void dispose() {
    _scrollControllerPagination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width= MediaQuery.of(context).size.width;
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm = Provider.of<DoctorListViewModel>(context);
    final String assetName1 = "assets/icons/phone.svg";
    final String assetName2 = "assets/icons/mail.svg";
    final String assetName3 = "assets/icons/marker.svg";
    final Widget phoneimg = SvgPicture.asset(
      assetName1,
      width: isTablet ? 25 : 10,
      height: isTablet ? 25 : width <350  ? 15 :18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
    );
    final Widget mailimg = SvgPicture.asset(
      assetName2,
      width: isTablet ? 25 : 10,
      height: isTablet ? 25 : width <350  ? 15 :18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
    );
    final Widget mapimg = SvgPicture.asset(
      assetName3,
      width: isTablet ? 25 : 10,
      height: isTablet ? 25 : width <350  ? 15 :18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
    );

    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppTheme.appbarPrimary,
          accentColor: AppTheme.appbarPrimary,
          colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: NestedScrollView(
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
                expandedHeight: isTablet? 220 : 150.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
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
                                width: width<350 ?  140 :175,
                                child: Text(widget.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    )),
                              ),
                              Spacer(),
                              // IconButton(
                              //   icon: Icon(
                              //     Icons.notifications,
                              //     color: Colors.white,
                              //     size: 20,
                              //   ),
                              //   onPressed: () {
                              //     Navigator.of(context).push(MaterialPageRoute(
                              //         builder: (context) =>
                              //             NotificationScreen()));
                              //   },
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                    background: Stack(children: [
                      Stack(children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          height: width<350? 300 :450.0,
                          width: double.infinity,
                          child: FittedBox(
                            child: widget.backgroundImage == null
                                ? Loader()
                                : Image.memory(
                                    widget.backgroundImage,
                                    gaplessPlayback: true,
                                  ),
                            fit: BoxFit.fill,
                          ),
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
                            padding:  EdgeInsets.only(top: isTablet? 40 : 70.0, left: isTablet ? 50 : 20),
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: HexColor('#D6DCFF'), width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SizedBox(
                                  height: isTablet? 110 : width <350  ? 50 : 85,
                                  width:
                                  isTablet ? MediaQuery.of(context).size.width / 4 : width <350  ? MediaQuery.of(context).size.width / 7.3: MediaQuery.of(context).size.width / 5.4,
                                  child: Image.memory(
                                    widget.image,
                                    gaplessPlayback: true,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: isTablet? 15 : 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: width<350 ? 85 : 75.0),
                                child: Container(
                                    width: isTablet ? MediaQuery.of(context).size.width*.6 : width <350  ? 190 :260,
                                    child: Text(
                                      widget.title.titleCase,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: isTablet ? 20 : width <350  ? 12 : 18,
                                          fontWeight: FontWeight.w600,
                                          color: HexColor('#141D53')),
                                    )),
                              ),
                              SizedBox(
                                height: isTablet ? 15 : 5,
                              ),
                              Row(
                                children: [
                                  phoneimg,
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SelectableText.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: widget.phoneText,
                                            style: GoogleFonts.poppins(
                                                color: HexColor('#141D53'),
                                                fontSize: isTablet? 15 : width <350  ? 9 : 11),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                launch(
                                                    ('tel://${widget.phoneText}'));
                                              }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  mailimg,
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    //width: 105,
                                    child: SelectableText.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: widget.emailText,
                                              style: GoogleFonts.poppins(
                                                color: HexColor('#141D53'),
                                                fontSize: isTablet? 15 : width <350  ? 9 :11,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  launch(
                                                      ('mailto://${widget.emailText}'));
                                                }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: isTablet? 10 : 5,
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
                                      width: isTablet? width*.6 : width <350  ? 180 :200,
                                      child: Text(widget.addressText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            color: HexColor('#141D53'),
                                            fontSize: isTablet? 15 : width <350  ? 9 :11,
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
            ];
          },
          body: SingleChildScrollView(
            controller: _scrollControllerPagination,
            child: Padding(
              padding:  EdgeInsets.only(left: isTablet? 10 : 0 , right: isTablet? 10 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 8, bottom: 3, left: 25),
                          child: Text('Doctors',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet? 18 : 15, fontWeight: FontWeight.w600))),
                      isFiltered == false
                          ? SizedBox()
                          : Container(
                              margin:
                                  EdgeInsets.only(top: 8, bottom: 3, right: 25),
                              child: Text('Showing Filtered Result',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet? 16 : 13,
                                  )))
                    ],
                  ),
                  vm.shouldShowPageLoader
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.appbarPrimary),
                          ),
                        )
                      : vm.doctorList.length == 0
                          ? Center(child: Text("No doctors found!",style: GoogleFonts.poppins(fontSize: isTablet? 18 : 12 ),))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: vm.doctorList.length + 1,
                              itemBuilder: (BuildContext context, int i) {
                                if (i == vm.doctorList.length) {
                                  return vm.isFetchingMoreData
                                      ? SizedBox(
                                          height: 60,
                                          child: Center(
                                              child: CircularProgressIndicator()))
                                      : SizedBox();
                                }
                                return CustomContainer(
                                  vm.doctorList[i].jobtitle != null
                                      ? vm.doctorList[i].jobtitle
                                      : "",
                                  vm.doctorList[i].photo != null
                                      ? loadLogo(vm.doctorList[i].photo)
                                      : Image.asset(
                                          "assets/icons/dct.png",
                                          fit: BoxFit.fill,
                                    width: isTablet? MediaQuery.of(context).size.width*.23 : width <350  ? 90 : 120,
                                    height: isTablet? 148 : width <350 ? 118 : 160,
                                        ),
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
                                      : vm.doctorList[i]?.ogNo.toString(),
                                  widget.title,
                                  widget.phoneText
                                );
                              }),
                ],
              ),
            ),
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
          hintStyle: GoogleFonts.poppins(fontSize: isTablet? 16 : 14 ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: width / 8.64),
            child: Container(
              width: 20,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.appbarPrimary,
              ),
              child: GestureDetector(
                  onTap: () {
                    deptController.clear();
                    departmentSearch('');
                  },
                  child: Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.white,
                  )),
            ),
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
          contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 40.0, 0.0),
        ));
    var searchSpeciality = TextField(
        onChanged: (value) {
          specializationSearch(value);
          // print(value);
        },
        controller: specialityController,
        decoration: new InputDecoration(
          hintStyle: GoogleFonts.poppins(fontSize: isTablet? 16 : 14 ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: width / 8.64),
            child: Container(
              width: 20,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.appbarPrimary,
              ),
              child: GestureDetector(
                  onTap: () {
                    specialityController.clear();
                    specializationSearch('');
                  },
                  child: Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.white,
                  )),
            ),
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
          contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 40.0, 0.0),
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
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: isTablet? 18 : 15 ,),
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
    var vm = Provider.of<DoctorListViewModel>(context, listen: false);
    var deviceWidth = MediaQuery.of(context).size.width;
    return SliverAppBar(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      floating: false,
      forceElevated: true,
      shadowColor: Colors.blue.withOpacity(0.3),
      elevation: 2,
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
                doctorItem = value.replaceAll(" ", "%20");
                vm.getDoctor(widget.orgNo, widget.companyNo, deptSelectedItem,
                    specialSelectedItem, doctorItem);
                //doctorSearch(doctorItem);
              },
              controller: doctorController,
              decoration: new InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(left: width / 8.64, right: width / 8.64),
                  child: Icon(Icons.search),
                ),
                hintText: "Find your doctor",
                hintStyle: GoogleFonts.poppins(fontSize: isTablet? 16 : width<350? 12 : 15.0,),
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
                contentPadding:width<350?  EdgeInsets.fromLTRB(15.0, 0.0, 40.0, 0.0) :  EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
              )),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return FractionallySizedBox(
                      heightFactor: .95,
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
                                    height: isTablet? height/2.7 : height / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25)),
                                      border: Border.all(
                                        color: HexColor("#D6DCFF"),
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
                                                        dense: true,
                                                        activeColor: AppTheme
                                                            .signInSignUpColor,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        title: Text(
                                                          Validator()
                                                              .capitalizeTheFirstLetterOfEachWord(
                                                                  item.buName),
                                                          style: GoogleFonts.poppins(
                                                              fontSize: isTablet? 18 : 15,
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
                                                            print(stringList);
                                                            if (_items3
                                                                .isEmpty) {
                                                              deptSelectedItem =
                                                                  null;
                                                            } else {
                                                              deptSelectedItem =
                                                                  "&buList%5B%5D=" +
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
                                        // SizedBox(height: 10,),
                                      ],
                                    ),
                                  ),
                                  horizontalSpace,
                                  horizontalSpace,
                                  Container(
                                    height: isTablet? height/2.7 : height / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
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
                                                        dense: true,
                                                        activeColor: AppTheme
                                                            .signInSignUpColor,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        title: Text(
                                                          item.dtlName,
                                                          style: GoogleFonts.poppins(
                                                              fontSize: isTablet? 18 : 15,
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
                                                            print(stringList);
                                                            if (_items4
                                                                .isEmpty) {
                                                              specialSelectedItem =
                                                                  null;
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
                                    height: isTablet? 45 :  height >= 600 ? 25 : 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AbsorbPointer(
                                        absorbing: _items4.isEmpty &&
                                                    _items3.isEmpty ||
                                                isFiltered == false
                                            ? true
                                            : false,
                                        child: SizedBox(
                                          width: width * .9,
                                          height: isTablet? 50 : width * .25,
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
                                              deptController.clear();
                                              departmentSearch('');
                                              specialityController.clear();
                                              specializationSearch('');
                                              deptSelectedItem = null;
                                              specialSelectedItem = null;
                                              _items3.clear();
                                              _items4.clear();
                                              _items1.clear();
                                              _items2.clear();
                                              vm.getDoctor(
                                                  widget.orgNo,
                                                  widget.companyNo,
                                                  null,
                                                  null,
                                                  doctorItem);
                                              Navigator.pop(context);
                                            },
                                            textColor: Colors.white,
                                            color: _items4.isEmpty &&
                                                        _items3.isEmpty ||
                                                    isFiltered == false
                                                ? HexColor("#969EC8")
                                                : AppTheme.appbarPrimary,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                    color: _items4.isEmpty &&
                                                                _items3
                                                                    .isEmpty ||
                                                            isFiltered == false
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
                                          height: isTablet? 50 : width * .25,
                                          child: FlatButton(
                                            textColor: Colors.white,
                                            onPressed: () {
                                              deptItems.sort((a, b) =>
                                                  b.isChecked ? 1 : -1);
                                              specialityItems.sort((a, b) =>
                                                  b.isChecked ? 1 : -1);
                                              isFiltered = true;
                                              _items1 = List.from(_items3);
                                              _items2 = List.from(_items4);
                                              Navigator.pop(context);
                                              print(doctorSearchItem);
                                              vm.getDoctor(
                                                  widget.orgNo,
                                                  widget.companyNo,
                                                  deptSelectedItem,
                                                  specialSelectedItem,
                                                  doctorItem);
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
              color: isFiltered == true ? AppTheme.appbarPrimary : Colors.grey,
              //semanticsLabel: 'Acme Logo'
            ),
          ),
        ),
      ],
    );
  }
}
