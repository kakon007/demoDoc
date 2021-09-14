import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/doctor_setup/view/add_new_doctor_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class DoctorSetupScreen extends StatefulWidget {
  @override
  _DoctorSetupScreenState createState() => _DoctorSetupScreenState();
}

class _DoctorSetupScreenState extends State<DoctorSetupScreen> {
  @override
  String selectOrganization;
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    var organizationName = Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: isTablet ? 50 : 45.0,
                width: width * 0.92,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD2D2D2)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        width: width * 0.8,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            onTap: () {
                              FocusManager.instance.primaryFocus.unfocus();
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: selectOrganization != null
                                  ? Colors.black54
                                  : Color(0XFFD2D2D2),
                            ),
                            iconSize: 25,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, -5, 0, 0),
                                enabledBorder: InputBorder.none),
                            isExpanded: true,
                            hint: Text(
                              'Organization Name',
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet ? 17 : 15,
                                  color: Color(0XFFD2D2D2)),
                            ),
                            value: selectOrganization,
                            onChanged: (newValue) {
                              setState(() {});
                            },
                            items:
                                StringResources.organizationList.map((gender) {
                              return DropdownMenuItem(
                                child: new Text(
                                  gender,
                                  style: GoogleFonts.roboto(fontSize: 15),
                                ),
                                value: gender,
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
        ],
      ),
    );
    var companyName = Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: isTablet ? 50 : 45.0,
                width: width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD2D2D2)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        width: width * 0.6,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            onTap: () {
                              FocusManager.instance.primaryFocus.unfocus();
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: selectOrganization != null
                                  ? Colors.black54
                                  : Color(0XFFD2D2D2),
                            ),
                            iconSize: 25,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, -5, 0, 0),
                                enabledBorder: InputBorder.none),
                            isExpanded: true,
                            hint: Text(
                              'Company Name',
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet ? 17 : 15,
                                  color: Color(0XFFD2D2D2)),
                            ),
                            value: selectOrganization,
                            onChanged: (newValue) {
                              setState(() {});
                            },
                            items:
                                StringResources.organizationList.map((gender) {
                              return DropdownMenuItem(
                                child: new Text(
                                  gender,
                                  style: GoogleFonts.roboto(fontSize: 15),
                                ),
                                value: gender,
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
        ],
      ),
    );
    double imageHeight = 35;
    double imageWidth = width <= 330 ? 120 : 120;
    var spaceBetween = SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Setup"),
        backgroundColor: Color(0xff354291),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(12.0),
                  bottomRight: const Radius.circular(12.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  spaceBetween,
                  organizationName,
                  spaceBetween,
                  companyName,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SignUpFormField(
                            onChanged: (value) {
                              // hospitalSearch(value);
                            },
                            textFieldKey: Key('hospitalSearchFieldKey'),
                            focusBorderColor: "#8592E5",
                            // controller: hospitalController,
                            borderRadius: 30,
                            minimizeBottomPadding: true,
                            // hintSize: isTablet ? 17 : 12,
                            hintText: "Search Company",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.search_rounded,
                                //color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: AppTheme.buttonActiveColor),
                                  color: Colors.white,
                                ),
                                height: imageHeight,
                                width: 35,
                                child: Center(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(19),
                                  // child: Image.file(
                                  //   _image,
                                  //   height: 110,
                                  //   width: 110,
                                  //   fit: BoxFit.fill,
                                  // ))
                                  // : photo != ''
                                  // ? companyInfoVm.loadDoctorProfileImage(photo, 110, 110, 19)
                                  child: Image.asset(
                                    'assets/images/dPro.png',
                                    height: 80,
                                    width: width <= 330 ? 80 : 80,
                                  ),
                                )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Doctor id. 01',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffFFB14A)),
                                      ),
                                      // SizedBox(
                                      //   width: 100,
                                      // ),
                                      // Row(
                                      //   children: [
                                      //     Icon(
                                      //       Icons.edit,
                                      //       color: AppTheme.buttonActiveColor,
                                      //       size: 16,
                                      //     ),
                                      //     Text(
                                      //       'Add Signature',
                                      //       style: TextStyle(
                                      //           fontWeight: FontWeight.bold,
                                      //           fontSize: 12,
                                      //           color:
                                      //               AppTheme.buttonActiveColor),
                                      //     )
                                      //   ],
                                      // )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'MD. Akramuzzaman',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              size: 12,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Active',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 11),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: AppTheme.buttonActiveColor,
                                    size: 16,
                                  ),
                                  Text(
                                    'Add Signature',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: AppTheme.buttonActiveColor),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Company: ',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Aalok Healthcare Ltd(Branch Mirpur 10)',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Degree: ',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Text(
                                  'MBBS.MDBCs',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Phone No:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '01788017656',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Chamber:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Address1',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        bool isTablet =
                                            Responsive.isTablet(context);
                                        return Material(
                                          type: MaterialType.transparency,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Material(
                                              type: MaterialType.transparency,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 300,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    //color: Colors.red,
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 0,
                                                                left: 20,
                                                                right: 20),
                                                        child: Container(
                                                          height: 180,
                                                          width: isTablet
                                                              ? 450
                                                              : 350,
                                                          decoration:
                                                              BoxDecoration(
                                                                  //color: HexColor('#f9f2f3'),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xfffdf0f2),
                                                                      Color(
                                                                          0xffFFFFFF)
                                                                    ],
                                                                    tileMode:
                                                                        TileMode
                                                                            .repeated,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 50.0),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0,
                                                                      right:
                                                                          10),
                                                                  child:
                                                                      RichText(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    text:
                                                                        TextSpan(
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontSize: isTablet
                                                                            ? 18
                                                                            : 16.0,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      children: <
                                                                          TextSpan>[
                                                                        TextSpan(
                                                                            text:
                                                                                'Are you sure want to delete this company?'),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      isTablet
                                                                          ? 25
                                                                          : 15,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        elevation:
                                                                            0,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            side: BorderSide(color: Color(0xff354291))),
                                                                        color: Colors
                                                                            .white,
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              50,
                                                                          width: isTablet
                                                                              ? 170
                                                                              : 120,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Cancel",
                                                                              style: GoogleFonts.poppins(color: Color(0xff354291), fontWeight: FontWeight.w500, fontSize: isTablet ? 18 : 15),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () async {},
                                                                      child:
                                                                          Material(
                                                                        elevation:
                                                                            0,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        color: Color(
                                                                            0xff354291),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              50,
                                                                          width: isTablet
                                                                              ? 170
                                                                              : 120,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Delete",
                                                                              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isTablet ? 18 : 15),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 210,
                                                    //top: MediaQuery.of(context).size.height / 1.8,
                                                    left: 100,
                                                    right: 100,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 30,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    60)),
                                                        // child: Image.asset(
                                                        //   "assets/icons/sign_in_prompt.png",
                                                        //   height: 90,
                                                        //   width: 90,
                                                        // ),
                                                        child: Icon(
                                                          Icons
                                                              .delete_sweep_rounded,
                                                          color:
                                                              Color(0xffFF8585),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFF8585),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Icon(
                                      Icons.delete,
                                      size: 15,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: AppTheme.buttonActiveColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  onPressed: () async {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.videocam,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Video Configuration',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: AppTheme.buttonActiveColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  onPressed: () async {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Edit',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDoctorSetupScreen()));
        },
        child: Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            color: AppTheme.buttonActiveColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add New",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
