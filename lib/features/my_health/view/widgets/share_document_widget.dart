import 'dart:convert';
import 'dart:typed_data';

import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/my_health/models/search_doctor_model.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/doctor_search_screen.dart';

import 'package:myhealthbd_app/features/my_health/view_model/shared_file_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/search_doctor_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';
import 'package:myhealthbd_app/features/my_health/models/shared_file_model.dart';
import 'package:http/http.dart' as http;

class ShareDocument extends StatefulWidget {
  List<Item> lenght;

  // String name;
  // String hosname;
  ShareDocument({this.lenght});

  @override
  _ShareDocumentState createState() => _ShareDocumentState();
}

class _ShareDocumentState extends State<ShareDocument> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController memberSearch = TextEditingController();
  List<Itemm> familyMembers= [];
  TextEditingController _descriptionTextEditingController = TextEditingController();
  var _searchFieldFocusNode2 = FocusNode();

  String _selectedName;
  String _selectedSharedtype;
  String selectedSearchValue;

  bool isRemove=false;

  Future<String> removeData({int id}) async{
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.MultipartRequest('DELETE', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-shared/delete?id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      print("Remove Body::" + body);
      return body;
    } else {
      print('Res:::' + response.reasonPhrase);
    }
  }

  Future sharedFile(
      {int fileNoArr,
      int regNo,
      int shareType,
      int doctorNoArr,
      String note}) async {
    var accessToken = await Provider.of<AccessTokenProvider>(
            appNavigator.context,
            listen: false)
        .getToken();
    var headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'text/plain'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://qa.myhealthbd.com:9096/diagnostic-api/api/file-shared/create'));
    request.body =
        '''{\n "fileNoArr": [$fileNoArr],\n "regNo": $regNo,\n "shareType": $shareType,\n "doctorNoArr": [$doctorNoArr],\n "activeStat": 1,\n "remarks": "$note"\n}\n''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('Resss:: ${response.statusCode}');
    print('Resss:: $fileNoArr');
    print('Resss:: $shareType');
    print('Resss:: $doctorNoArr');
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  loadProfileImage(String image, double height, double width, double border) {
    Uint8List _bytesImage = Base64Decoder().convert(image);
    //print(_bytesImage);
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: Image.memory(
        _bytesImage,
        fit: BoxFit.fill,
        width: width,
        height: height,
        gaplessPlayback: true,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _selectedName = null;
    _selectedSharedtype = null;
    selectedSearchValue = null;
    var vm = Provider.of<HospitalListViewModel>(context, listen: false);
    vm.getData();
    removeData();
    var vm2 = appNavigator.getProviderListener<SearchDoctorViewModel>();
    vm2.docNull('');
    // var vm2 = Provider.of<SearchDoctorViewModel>(context, listen: false);
    // vm2.getData();
    // Future.delayed(Duration.zero,()async{
    //   var vm10 =  Provider.of<SharedFileViewModel>(context, listen: false);
    //  await vm10.getData();
    //  //print('pres ::: ${widget.prescriptionNo}');
    // });
    // var vm10 =  Provider.of<SharedFileViewModel>(context, listen: false);
    // vm10.getData();
    //print('pres ::: ${widget.prescriptionNo}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _descriptionTextEditingController =
        TextEditingController();
    var _searchFieldFocusNode2 = FocusNode();

    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm = appNavigator.getProviderListener<HospitalListViewModel>();
    var vm2 = appNavigator.getProviderListener<SearchDoctorViewModel>();
    var vm10 = Provider.of<SharedFileViewModel>(context, listen: true);

    String color = "#8592E5";

    var hospitalName = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     height: 35.0,
              //     width: MediaQuery.of(context).size.width*.6,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top:8.0,left:5,right:10),
              //       child: Text("Document Type",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#333132'),fontSize: 12),),
              //     )),
              Container(
                height: 45.0,
                width: isTablet? deviceWidth * .92 :MediaQuery.of(context).size.width * .87,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: isTablet? deviceWidth * .87 : deviceWidth * .77,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: _selectedName != null
                                  ? Colors.black54
                                  : HexColor("#D2D2D2"),
                            ),
                            iconSize: 25,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                enabledBorder: InputBorder.none),
                            hint: Text(
                              'Select Hospital or Diagnostic',
                              style: GoogleFonts.roboto(
                                  fontSize: 13, color: HexColor("#333132")),
                            ),
                            // Not necessary for Option 1
                            value: _selectedName,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedName = newValue;
                                print('SelectValue::::: $_selectedName');
                              });
                            },
                            items: vm.hospitalList.map((hospitalName) {
                              return DropdownMenuItem(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .67,
                                  child: Text(
                                    hospitalName.companyName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(fontSize: 14),
                                  ),
                                ),
                                value: hospitalName.id.toString(),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    // var searchDropdown = Row(
    //   children: [
    //     GestureDetector(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           // Container(
    //           //     height: 35.0,
    //           //     width: MediaQuery.of(context).size.width*.6,
    //           //     child: Padding(
    //           //       padding: const EdgeInsets.only(top:8.0,left:5,right:10),
    //           //       child: Text("Document Type",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#333132'),fontSize: 12),),
    //           //     )),
    //           Container(
    //             height: 70.0,
    //             width:MediaQuery.of(context).size.width*.89,
    //             decoration: BoxDecoration(
    //                 color: Colors.transparent,
    //                 border: Border.all(color: HexColor(color)),
    //                 borderRadius: BorderRadius.circular(25)),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Stack(
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 15.0),
    //                       child: Container(
    //                         width: 280,
    //                         child:
    //                         SearchableDropdown(
    //                           items: StringResources.memberList.map((item) {
    //                             return  DropdownMenuItem(
    //                                 child: Text(item), value: item);
    //                           }).toList(),
    //                           isExpanded: true,
    //                           value: selectedSearchValue,
    //                           isCaseSensitiveSearch: true,
    //                           searchHint:  Text(
    //                             'Select ',
    //                             style:  TextStyle(fontSize: 20),
    //                           ),
    //                           onChanged: (value) {
    //                             setState(() {
    //                               selectedSearchValue = value;
    //                               print("search Value:: $selectedSearchValue");
    //                             });
    //                           },
    //                         ),
    //                       ),
    //                     ),
    //                     // Padding(
    //                     //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.75, top: 5),
    //                     //   child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#8592E5"),size: 30,),
    //                     // ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );

    var shareType = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     height: 35.0,
              //     width: MediaQuery.of(context).size.width*.6,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top:8.0,left:5,right:10),
              //       child: Text("Document Type",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#333132'),fontSize: 12),),
              //     )),
              Container(
                height: 45.0,
                width: isTablet? deviceWidth * .92: deviceWidth * .87,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: isTablet? deviceWidth * .87: deviceWidth * .77,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: _selectedSharedtype != null
                                  ? Colors.black54
                                  : HexColor("#D2D2D2"),
                            ),
                            iconSize: 25,
                            hint: Text(
                              'Share With',
                              style: GoogleFonts.roboto(
                                  fontSize: 13, color: HexColor("#333132")),
                            ),
                            // Not necessary for Option 1
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                enabledBorder: InputBorder.none),
                            value: _selectedSharedtype,
                            onChanged: (newValue) {
                              setState(() {
                                vm2.docNull('');
                                _selectedName=null;
                                _selectedSharedtype = newValue;
                                print('SelectValue::::: $_selectedSharedtype');
                              });
                            },
                            items: StringResources.ShareType.map((sharedType) {
                              return DropdownMenuItem(
                                child: SizedBox(
                                  width: deviceWidth * .67,
                                  child: Text(
                                    sharedType,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(fontSize: 14),
                                  ),
                                ),
                                value: sharedType,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    var writeDetailsField = Container(
      width: isTablet? deviceWidth * .92 : deviceWidth * .87,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        //color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          maxLength: 200,
          maxLengthEnforced: false,
          autofocus: false,
          textInputAction: TextInputAction.newline,
          focusNode: _searchFieldFocusNode2,
          controller: _descriptionTextEditingController,
          cursorColor: HexColor('#C5CAE8'),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type Your Notes Here',
            hintStyle:
                GoogleFonts.poppins(fontSize: isTablet? 15 : 11, fontWeight: FontWeight.w400),
            fillColor: Colors.white,
          ),
          onSubmitted: (v) {
            //vm2.search(_searchTextEditingController2.text,widget.accessToken);
          },

            inputFormatters: [
              LengthLimitingTextInputFormatter(200),
            ]
        ),
      ),
    );

    var doctorCard=
    Container( decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.withOpacity(0.3)),
    ),
     // margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 70,
      width: MediaQuery.of(context).size.width*.89,
      child:Row(
          children: [
            SizedBox(
              width: 10,
            ),

            vm2.image != null
                ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.appbarPrimary),
                  //color: AppTheme.appbarPrimary,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: Center(
                    child: loadProfileImage(vm2.image, 45, 45,50)
                ))
                : Container(
                decoration: BoxDecoration(
                  color: AppTheme.appbarPrimary,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset(
                    'assets/icons/dct.png',
                    height: 40,
                    width: 40,
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width:220,
                      child: Text(
                        vm2.doctorName==null?'Loading':vm2.doctorName,
                        style: GoogleFonts.poppins(
                            color: HexColor("#0D1231"),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(onTap: (){
                      setState(() {
                        vm2.adDoctorsInfo(isSelected: false,selectedCard: -1,doctorNo: null,hospitalName: '',doctorName: '',image: '',spName: '');
                      });
                      print('Tapped on cross');
                    },child: Icon(Icons.close)),
                  ],
                ),
                Container(
                  width:220,
                  child: Text(

                  vm2.spName==null?'Loading':vm2.spName,
                    style: GoogleFonts.poppins(
                      color: AppTheme.appbarPrimary,),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ) ,);

    var doctorCardForAllDoc = Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
    ),
      // margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 70,
      width: MediaQuery.of(context).size.width*.89,
      child:
      Center(
        child: Text(
          'You Are Sharing Documents With All Doctors'
        ),
      ));

    print('Nameeee:: ${vm2.doctorName}');
    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );
    var shareTitle = Column(
      children: [
        horizontalSpace,
        horizontalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            verticalSpace,
            Text(
              "Share",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: isTablet? 18 : 15),
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.clear)),
                SizedBox(width: isTablet? 10 : 5,)
              ],
            ),
            //horizontalSpace,
          ],
        ),
      ],
    );
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: _selectedSharedtype == null
                ?deviceWidth<=360 ? height*.65 :  height * .42
                : deviceWidth<=360 ? height * .8 : height * .60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: isTablet? 30 : 19,
                  right: isTablet? 30 : 19,
                  top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shareTitle,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "Type your hospital name",
                            //   style: GoogleFonts.poppins(),
                            // ),
                            horizontalSpace,
                            shareType,
                            _selectedSharedtype == null ||
                                    _selectedSharedtype == 'Share With All'
                                ? SizedBox()
                                : horizontalSpace,
                            _selectedSharedtype == null ||
                                    _selectedSharedtype == 'Share With All'
                                ? SizedBox()
                                : hospitalName,
                            // Container(
                            //   width: width * 1.2,
                            //   height: width * .32,
                            //   child: TextFormField(
                            //     controller: _username,
                            //     decoration: InputDecoration(
                            //       focusedBorder:
                            //       OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color:
                            //             HexColor("#D6DCFF"),
                            //             width: 1.0),
                            //         borderRadius:
                            //         BorderRadius.circular(
                            //             25),
                            //       ),
                            //       // contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
                            //       enabledBorder:
                            //       OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color:
                            //             HexColor("#EAEBED"),
                            //             width: 1.0),
                            //         borderRadius:
                            //         BorderRadius.circular(
                            //             25),
                            //       ),
                            //       prefixIcon: Padding(
                            //         padding:
                            //         const EdgeInsets.only(
                            //             left: 18.0),
                            //         child: Icon(
                            //           Icons.search_rounded,
                            //           color:
                            //           HexColor("#C7C8CF"),
                            //         ),
                            //       ),
                            //       suffixIcon: Padding(
                            //         padding: EdgeInsets.only(
                            //             right: 18.0),
                            //         child: Icon(
                            //           Icons
                            //               .keyboard_arrow_down_rounded,
                            //           color:
                            //           HexColor("#C7C8CF"),
                            //           size: 30,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            horizontalSpace,
                            // Text(
                            //   "Type your Doctor name",
                            //   style: GoogleFonts.poppins(),
                            // ),
                            //
                            _selectedSharedtype==null||_selectedSharedtype=='Share With All'? SizedBox():
                            GestureDetector(
                            onTap: (){
                              _selectedName==null?Fluttertoast.showToast(msg: 'Please Select A Hospital',backgroundColor: Colors.blue,textColor: Colors.white):Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchDoctor(selectedName: _selectedName,))).then((value){
                                setState(() {

                                });
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*.89,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                //color: Colors.white,
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .72,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0,top: 5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.search_outlined,size: 20,),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Search Doctor(s)",
                                        style: GoogleFonts.roboto(
                                          color:
                                          // familyVm.isSelected && memberList
                                          //     ? Colors.white
                                               Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                            vm2.doctorName=='' || vm2.hospitalName=='' || _selectedSharedtype==null?SizedBox.shrink(): horizontalSpace,
                            // Container(
                            //   height: 100,
                            //   width: MediaQuery.of(context).size.width*.89,
                            //   decoration: BoxDecoration(
                            //     border: Border.all(color:Colors.grey)
                            //   ),
                            //   child:
                            //   vm2.isLoading? Center(child: CircularProgressIndicator(valueColor:
                            //   AlwaysStoppedAnimation<Color>(
                            //       AppTheme.appbarPrimary),)) : SingleChildScrollView(
                            //         physics: ScrollPhysics(),
                            //         scrollDirection: Axis.vertical,
                            //         child: ListView.builder(
                            //             physics: NeverScrollableScrollPhysics(),
                            //             shrinkWrap: true,
                            //             itemCount: familyMembers.length,
                            //             itemBuilder: (BuildContext context, int index) {
                            //               //var photo = familyMembers[index]?.photo ?? "";
                            //               return Container(
                            //                   decoration: BoxDecoration(
                            //                     color: HexColor("#F0F2FF"),
                            //                     borderRadius: BorderRadius.circular(10),
                            //                   ),
                            //                   margin: EdgeInsets.only(top: 5, bottom: 5),
                            //                   height: 70,
                            //                   child: Row(
                            //                     children: [
                            //
                            //                       Column(
                            //                         crossAxisAlignment:
                            //                         CrossAxisAlignment.start,
                            //                         mainAxisAlignment: MainAxisAlignment.center,
                            //                         children: [
                            //                           Text(
                            //                             familyMembers[index].doctorName,
                            //                             style: GoogleFonts.poppins(
                            //                                 color: HexColor("#0D1231"),
                            //                                 fontSize: 16,
                            //                                 fontWeight: FontWeight.w500),
                            //                           ),
                            //                           Text(
                            //                             familyMembers[index].companyName,
                            //                             style: GoogleFonts.poppins(
                            //                               color: AppTheme.appbarPrimary,),
                            //                           )
                            //                         ],
                            //                       ),
                            //                     ],
                            //                   ));
                            //             }),
                            //       ),
                            // ),
                           vm2.doctorName!='' || vm2.hospitalName!=''?doctorCard:_selectedSharedtype=='Share With All'?doctorCardForAllDoc:SizedBox.shrink(),
                            horizontalSpace,
                            writeDetailsField,
                            horizontalSpace,
                          ],
                        ),
                        // verticalSpace,
                        // verticalSpace,
                        // _username.text != "" ||
                        //     _password.text != ""
                        //     ? Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //             color: HexColor(
                        //                 "#E9ECFE")),
                        //         borderRadius:
                        //         BorderRadius.circular(
                        //             15),
                        //         color: HexColor("#FFFFFF"),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: HexColor(
                        //                 "#0D1231")
                        //                 .withOpacity(0.08),
                        //             spreadRadius: 2,
                        //             blurRadius: 20,
                        //             offset: Offset(0,
                        //                 1), // changes position of shadow
                        //           ),
                        //         ]),
                        //     height: 160.0,
                        //     width: MediaQuery.of(context)
                        //         .size
                        //         .width *
                        //         .32,
                        //     child: Column(
                        //       children: [
                        //         SizedBox(
                        //           height: 12,
                        //         ),
                        //         Container(
                        //           height: 80,
                        //           width: 80,
                        //           child: Image.asset(
                        //             "assets/images/doc.png",
                        //             fit: BoxFit.fill,
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           height: 3,
                        //         ),
                        //         Text(
                        //           "Md. Sohel Rana",
                        //           style:
                        //           GoogleFonts.poppins(
                        //               fontWeight:
                        //               FontWeight
                        //                   .bold,
                        //               fontSize: 12),
                        //         ),
                        //         Text("Assistant Professor",
                        //             style:
                        //             GoogleFonts.poppins(
                        //                 fontSize: 12)),
                        //         Text(
                        //           "CARDIOLOGIST",
                        //           style: GoogleFonts.poppins(
                        //               height: 1.5,
                        //               color: AppTheme
                        //                   .appbarPrimary,
                        //               fontWeight:
                        //               FontWeight.w400,
                        //               fontSize: 12),
                        //         ),
                        //       ],
                        //     ))
                        //     : DashedContainer(
                        //   dashColor: HexColor("#E9ECFE"),
                        //   borderRadius: 10.0,
                        //   dashedLength: 10.0,
                        //   blankLength: 2.0,
                        //   child: Container(
                        //     height: 140.0,
                        //     width: MediaQuery.of(context)
                        //         .size
                        //         .width *
                        //         .32,
                        //   ),
                        // )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 20.0, right: 20),
                    //   child: AbsorbPointer(
                    //     // absorbing: _username.text == "" ||
                    //     //     _password.text == ""
                    //     //     ? true
                    //     //     : false,
                    //     child: SizedBox(
                    //       width:
                    //       MediaQuery.of(context).size.width,
                    //       height: width * .25,
                    //       child: FlatButton(
                    //         onPressed: () {
                    //           print('dhurrr');
                    //           var num=_selectedSharedtype=="Share With All"?1:2;
                    //           print('light $num');
                    //
                    //         },
                    //         textColor: Colors.white,
                    //         color: _username.text == "" &&
                    //             _password.text == ""
                    //             ? HexColor("#969EC8")
                    //             : AppTheme.appbarPrimary,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //           BorderRadius.circular(10),
                    //         ),
                    //         child: Text(
                    //           "Shared",
                    //           style: GoogleFonts.poppins(
                    //               fontWeight:
                    //               _username.text == "" &&
                    //                   _password.text == ""
                    //                   ? FontWeight.normal
                    //                   : FontWeight.w500),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    AbsorbPointer(
                      absorbing: _selectedSharedtype == null ||
                              _selectedName == null ||
                              vm2.doctorName == ''
                          ? true
                          : false,
                      child: GestureDetector(
                        onTap: () async {
                          var accessToken =
                              await Provider.of<AccessTokenProvider>(
                                      appNavigator.context,
                                      listen: false)
                                  .getToken();
                          SVProgressHUD.show(status: "Sharing");
                          await sharedFile(
                              fileNoArr: vm10.fileNo,
                              regNo: vm10.regId,
                              shareType:
                                  _selectedSharedtype == "Share With All" ? 1 : 2,
                              doctorNoArr: vm2.doctorNo,
                              note: _descriptionTextEditingController.text);
                          SVProgressHUD.dismiss();
                          Future.delayed(Duration.zero, () async {
                            // setState(() {
                            //   // file==null && _image==null?Loader():
                            //   // Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //   //     builder: (BuildContext context) =>
                            //   //     // DoctorHomeScreen(
                            //   //     HomeScreen(
                            //   //       accessToken: accessToken,
                            //   //     )));
                            //
                            // });

                            Navigator.pop(context);
                          });
                        },
                        child: Material(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: _selectedSharedtype == null ||
                                  _selectedName == null ||
                                  vm2.doctorName == ''
                              ? HexColor("#969EC8")
                              : AppTheme.appbarPrimary,
                          child: SizedBox(
                            width: isTablet? deviceWidth * .95 : MediaQuery.of(context).size.width * .87,
                            height:isTablet? 40 : deviceWidth>=360 ? 35 : 30,
                            child: Center(
                              child: Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isTablet? 16 : 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shared with",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  vm10.sharedFileList==null?Center(child: Text("No Share History Yet.")):
                  Column(
                    children: <Widget>[
                      vm10.sharedFileList==null?Text("No Share History Yet."):ListView.builder(physics: NeverScrollableScrollPhysics(),itemCount: vm10.sharedFileList.length,shrinkWrap: true,itemBuilder: (BuildContext context,index){
                        var photo = vm10.sharedFileList[index]?.photo ?? "";
                        return  Padding(padding: EdgeInsets.all(5),child:
                        Container(
                            height: 70,
                            width:
                            MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                              SizedBox(
                              width: 5,
                            ),
                                photo != ""
                                    ? Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppTheme.appbarPrimary),
                                      //color: AppTheme.appbarPrimary,
                                      shape: BoxShape.circle,
                                    ),
                                    height: 45,
                                    width: 45,
                                    child: Center(
                                        child: loadProfileImage(photo, 40, 40,50)
                                    ))
                                    : Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.appbarPrimary,
                                      shape: BoxShape.circle,
                                    ),
                                    height: 45,
                                    width: 45,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/dct.png',
                                        height: 35,
                                        width: 35,
                                      ),
                                    )),
                            // SizedBox(
                            //   width: 3,
                            // ),
                            Container(
                              height: 50,
                              width: 160,
                              child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                    SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    width: 120,
                                    child: Text(
                                        vm10.sharedFileList[index].doctorName==null?'No DocTor Name Available':vm10.sharedFileList[index].doctorName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts
                                        .poppins(
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight
                                    .w500)),
                                  ),
                              Container(
                                width: 120,
                                child: Text(
                                    vm10.sharedFileList[index].companyName==null?'No Hospital Name Available':vm10.sharedFileList[index].companyName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts
                                        .poppins(
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight
                                            .w500)),
                              )
                              ],
                            ))),
                       isRemove? Row(
                         children: [
                           GestureDetector(
                              onTap: ()async{

                                var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
                                SVProgressHUD.show(
                                  status: 'Deleting'
                                );
                                await removeData(id:vm10.sharedFileList[index].id);
                                SVProgressHUD.dismiss();

                                Future.delayed(Duration.zero, () async {
                                  setState(() {
                                    // file==null && _image==null?Loader():
                                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //     // DoctorHomeScreen(
                                    //     HomeScreen(
                                    //       accessToken: accessToken,
                                    //     )));
                                    Navigator.pop(context);
                                  });

                                });

                              },
                            child: Container(
                            decoration: BoxDecoration(
                            color: HexColor("#FFA7A7"),
                            borderRadius: BorderRadius.circular(8),
                            ),
                            height: 30,
                            width: 55,
                            child: Center(
                            child: Text(
                            "Confirm",
                            style:
                            GoogleFonts.poppins(
                            fontSize: 11,color:Colors.white ),
                            ),
                            ),
                            ),
                            ),

                            SizedBox(width: 5,),
                           GestureDetector(
                             onTap: ()async{

                               setState(() {
                                 isRemove=false;
                               });

                             },
                             child: Container(
                               decoration: BoxDecoration(
                                 color: HexColor("#8592E5"),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               height: 30,
                               width: 55,
                               child: Center(
                                 child: Text(
                                   "Cancel",
                                   style:
                                   GoogleFonts.poppins(
                                       fontSize: 11,color: Colors.white),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ):Padding(
                         padding: const EdgeInsets.only(left:8.0),
                         child: GestureDetector(
                           onTap: (){

                             setState(() {
                               isRemove=true;
                             });

                           },
                           child: Container(
                             decoration: BoxDecoration(
                               color: HexColor("#FFA7A7"),
                               borderRadius: BorderRadius.circular(8),
                             ),
                             height: 40,
                             width: 100,
                             child: Center(
                               child: Text(
                                 "Remove Access",
                                 style:
                                 GoogleFonts.poppins(
                                     fontSize: 11,color: Colors.white),
                               ),
                             ),
                           ),
                         ),
                       ),
                        ],
                        ),
                        )
                        ,);
                      })
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
