import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/organization_setup/view/add_organization.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class OrganizationSetupScreen extends StatefulWidget {
  const OrganizationSetupScreen({Key key}) : super(key: key);

  @override
  _OrganizationSetupScreenState createState() =>
      _OrganizationSetupScreenState();
}

class _OrganizationSetupScreenState extends State<OrganizationSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organization Setup'),
        backgroundColor: AppTheme.appbarPrimary,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SignUpFormField(
                      onChanged: (value) {
                        // hospitalSearch(value);
                      },
                      focusBorderColor: "#8592E5",
                      // controller: hospitalController,
                      borderRadius: 30,
                      minimizeBottomPadding: true,
                      // hintSize: isTablet ? 17 : 12,
                      hintText: "Search organization",
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
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                'Org id. 01',
                                style: GoogleFonts.poppins(
                                    color: Color(0xffFFB14A)),
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'AALOK Healthcare Limited',
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Color(0xff55CFA6),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Active',
                                    style: GoogleFonts.poppins(
                                        color: Color(0xff55CFA6), fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0, left: 10),
                          child: Text(
                            'Address: House 76 (Level 1) Road 4, Block B Niketan, Gulshan 1 Dhaka 1212, Bangladesh',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
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
                                                                                'Do you really want to delete this organization?'),
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
                                                                              "No",
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
                                                                              "Yes",
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
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFF8585),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: AppTheme.appbarPrimary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Edit",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => AddOrganizationScreen()),
          );
        },
        child: Container(
          height: 45,
          width: 120,
          decoration: BoxDecoration(
            color: AppTheme.appbarPrimary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add New",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add,
                size: 22,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
