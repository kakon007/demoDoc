import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:provider/provider.dart';
class ShareDocument extends StatefulWidget {
  @override
  _ShareDocumentState createState() => _ShareDocumentState();
}

class _ShareDocumentState extends State<ShareDocument> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _selectedName;
  String _selectedSharedtype;

  @override
  void initState() {
    // TODO: implement initState
    _selectedName=null;
    _selectedSharedtype=null;
    var vm = Provider.of<HospitalListViewModel>(context, listen: false);
    vm.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width * 0.44;
    var height = MediaQuery.of(context).size.height;

    var vm = appNavigator.getProviderListener<HospitalListViewModel>();

    String color = "#8592E5";
    var doctorList=
    Padding(padding: EdgeInsets.all(5),child:
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
            width: 10,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/images/doc.png"),
              radius: 15.0,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
              height: 50,
              width: 170,
              child: Center(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                          "Dr. Zia Udiin Arman",
                          style: GoogleFonts
                              .poppins(
                              fontSize: 12,
                              fontWeight:
                              FontWeight
                                  .w500)),
                      Text(
                          "Lab Science Diagnostic 02",
                          style: GoogleFonts
                              .poppins(
                              fontSize: 12,
                              fontWeight:
                              FontWeight
                                  .w500))
                    ],
                  ))),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor("#FFA7A7"),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 40,
              width: 100,
              child: Center(
                child: Text(
                  "Remove Access",
                  style:
                  GoogleFonts.poppins(
                      fontSize: 11),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    )
      ,);
   
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
                width:MediaQuery.of(context).size.width*.89,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 280,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text('Select Hospital', style:  GoogleFonts.roboto(fontSize: 13, color: HexColor("#333132")),), // Not necessary for Option 1
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
                                      width: 275,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.75, top: 5),
                          child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#8592E5"),size: 30,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

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
                width:MediaQuery.of(context).size.width*.89,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 280,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text('Share With', style:  GoogleFonts.roboto(fontSize: 13, color: HexColor("#333132")),), // Not necessary for Option 1
                                value: _selectedSharedtype,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSharedtype = newValue;
                                    print('SelectValue::::: $_selectedSharedtype');
                                  });
                                },
                                items: StringResources.ShareType.map((sharedType) {
                                  return DropdownMenuItem(
                                    child: SizedBox(
                                      width: 275,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.75, top: 5),
                          child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#8592E5"),size: 30,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );



    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );
    var shareTitle = Padding(
      padding: EdgeInsets.only(left: width / 6.912, right: width / 6.912),
      child: Column(
        children: [
          horizontalSpace,
          horizontalSpace,
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpace,
                Text(
                  "Share",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.clear)),
                //horizontalSpace,
              ],
            ),
          ),
        ],
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * .50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  shareTitle,
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "Type your hospital name",
                            //   style: GoogleFonts.poppins(),
                            // ),
                            horizontalSpace,
                            shareType,
                            horizontalSpace,
                            hospitalName,
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
                            Container(
                              width: MediaQuery.of(context).size.width*.89,
                              height: width * .32,
                              child: TextFormField(
                                controller: _password,
                                decoration: InputDecoration(
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        HexColor("#D6DCFF"),
                                        width: 1.0),
                                    borderRadius:
                                    BorderRadius.circular(
                                        25),
                                  ),
                                  // contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
                                  enabledBorder:
                                  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        HexColor("#EAEBED"),
                                        width: 1.0),
                                    borderRadius:
                                    BorderRadius.circular(
                                        25),
                                  ),
                                  prefixIcon: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 18.0),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: AppTheme
                                          .appbarPrimary,
                                    ),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        right: 18.0),
                                    child: Icon(
                                      Icons
                                          .keyboard_arrow_down_rounded,
                                      color: AppTheme
                                          .appbarPrimary,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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

                  GestureDetector(
                    onTap:(){
                     print('Dhuuurrr');
                     var num=_selectedSharedtype=="Share With All"?1:2;
                                 print('light $num');
                    },
                    child: Material(
                      elevation: 2  ,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      color:_username.text == "" &&
                                      _password.text == ""
                                      ? HexColor("#969EC8")
                                      : AppTheme.appbarPrimary,
                      child: SizedBox(
                        width:
                              MediaQuery.of(context).size.width*.89,
                              height: width * .25,
                        child: Center(
                          child: Text("Start Consultation",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shared with",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: <Widget>[
                      ListView.builder(physics: NeverScrollableScrollPhysics(),itemCount: 10,shrinkWrap: true,itemBuilder: (BuildContext context,index){
                        return doctorList;
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
