import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/order_confirm_view_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/test_item_view_model.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

import 'order_confirmation_screen_after_sign_in.dart';
import 'order_confirmation_signed_in.dart';

class BookingSummeryScreen extends StatefulWidget {
  @override
  _BookingSummeryScreenState createState() => _BookingSummeryScreenState();
}

class _BookingSummeryScreenState extends State<BookingSummeryScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var testItemVm = Provider.of<TestItemViewModel>(context);
    var submitVm = Provider.of<OrderConfirmViewModel>(context);
    num subTotal = 0;
    testItemVm.salesPrice.forEach((num e) {
      subTotal += e;
    });
    num discountAmt = 0;
    submitVm.subTotal = subTotal;
    testItemVm.discountAmt.forEach((num e) {
      discountAmt += e;
    });
    num discountPrice = 0;
    testItemVm.discountPrice.forEach((num e) {
      discountPrice += e;
    });
    submitVm.total = discountPrice;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff354291),
          title: Text(
            'Booking Summery',
            key: Key('emrAppbarKey'),
            style: GoogleFonts.poppins(
                fontSize: isTablet ? 20 : 16, fontWeight: FontWeight.w500),
          ),
          actions: [
            InkWell(
              onTap: () {
                showGeneralDialog(
                  barrierLabel: "Label",
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: Duration(milliseconds: 700),
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
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
                                width: isTablet
                                    ? MediaQuery.of(context).size.width * .7
                                    : MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Container(
                                    height: 200,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          HexColor('#fdf0f2'),
                                          HexColor('#FFFFFF')
                                        ],
                                        tileMode: TileMode.repeated,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 60.0),
                                      child: Column(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .08,
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.08),
                                                child: RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    style: GoogleFonts.poppins(
                                                      fontSize:
                                                          isTablet ? 18 : 14.0,
                                                      color: Colors.black,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              'Do you want to delete all these items?\n This action can\'t be undone.'),
                                                      // TextSpan(text: 'This action can\'t be undone.'),
                                                      // TextSpan(text: 'sure', style: GoogleFonts.poppins()),
                                                      // TextSpan(text: " you want to Delete?", style: GoogleFonts.poppins()),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Column(
                                          //   children: [
                                          //     Row(
                                          //       mainAxisAlignment: MainAxisAlignment.center,
                                          //       children: [
                                          //         Text("Remove ", style: GoogleFonts.poppins()),
                                          //         Text(familyVm.familyMembersList[index].fmName,style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                          //         Text(" from", style: GoogleFonts.poppins())
                                          //       ],
                                          //     ),
                                          //     Text("your members list.", style: GoogleFonts.poppins())
                                          //   ],
                                          // ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: isTablet
                                                ? 10
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width <=
                                                        330
                                                    ? 10
                                                    : 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .08,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0, right: 0),
                                                  child: Container(
                                                    width: isTablet
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .22
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    decoration: BoxDecoration(),
                                                    height: isTablet ? 50 : 45,
                                                    child: FlatButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppTheme
                                                                    .appbarPrimary,
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        textColor: AppTheme
                                                            .appbarPrimary,
                                                        color: Colors.white,
                                                        child: Text("Cancel",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        isTablet
                                                                            ? 18
                                                                            : 15))),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0, right: 0),
                                                  child: Container(
                                                    width: isTablet
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .22
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    height: isTablet ? 50 : 45,
                                                    child: FlatButton(
                                                        onPressed: () async {
                                                          testItemVm.cartList
                                                              .clear();
                                                          testItemVm.salesPrice
                                                              .clear();
                                                          testItemVm.discountAmt
                                                              .clear();
                                                          testItemVm
                                                              .discountPrice
                                                              .clear();
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                        },
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                        textColor: Colors.white,
                                                        color: AppTheme
                                                            .appbarPrimary,
                                                        child: Text("Delete",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        isTablet
                                                                            ? 18
                                                                            : 15))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 185,
                                left: 100,
                                right: 100,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: Constants.avatarRadius,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              Constants.avatarRadius)),
                                      child: Image.asset(
                                        "assets/images/deletewaring.png",
                                        height: 90,
                                        width: 90,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 2), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10),
                child: Text(
                  'Delete All',
                  //key: Key('emrAppbarKey'),
                  style: GoogleFonts.poppins(
                      fontSize: isTablet ? 20 : 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Items  ${(testItemVm.cartList.length)}',
                        style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20 : 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff354291)),
                      ),
                      Text(
                        'Price  (TK)',
                        style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20 : 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff354291)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: testItemVm.cartList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 260,
                                child: Text(
                                  testItemVm.cartList[index].itemName,
                                  style: GoogleFonts.poppins(
                                      fontSize: isTablet ? 20 : 14,
                                      color: Colors.black),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                testItemVm.cartList[index].salesPrice
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 20 : 15,
                                    color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  testItemVm.cartList.removeAt(index);
                                  testItemVm.salesPrice.removeAt(index);
                                  testItemVm.discountAmt.removeAt(index);
                                  testItemVm.discountPrice.removeAt(index);
                                  setState(() {});
                                },
                                child: Icon(Icons.delete_sweep,
                                    size: isTablet ? 27 : 20,
                                    color: Color(0xffFFA7A7)),
                              ),
                            ],
                          )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 2,
                        );
                      }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      border: Border.all(color: Colors.grey.withOpacity(0.2))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14,
                                  color: Colors.black),
                            ),
                            Text(
                              '$subTotal Tk',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14,
                                  color: Color(0xff037BB7)),
                            ),
                            Text(
                              '$discountAmt Tk',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14,
                                  color: Color(0xff037BB7)),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14,
                                  color: Colors.black),
                            ),
                            Text(
                              '$discountPrice Tk',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () async {
                    var vm3 = Provider.of<UserDetailsViewModel>(
                        context,
                        listen: false);
                    var cartVM =
                    Provider.of<OrderConfirmViewModel>(context, listen: false);
                    Future.delayed(Duration.zero, () {
                      // cartVM.forMe = true;
                      // cartVM.addPatient = false;
                       cartVM.getAppointType(true, false);
                    });
                    //await vm3.getData2();
                    if(cartVM.forMe){
                      cartVM.memberList = false;
                      cartVM.selectedMemberType=null;
                      var familyVm =
                      Provider.of<FamilyMembersListViewModel>(context, listen: false);
                      familyVm.memberDetail(
                          -1, false, "", "", "", "", "", "", "", "", "");
                      cartVM.fathersName.text = vm3.userDetailsList.fatherName?? "";
                      cartVM.mothersName.text = vm3.userDetailsList.motherName?? "";
                      cartVM.lastNameController.text = vm3.userDetailsList.lname?? "";
                      cartVM.firstNameController.text = vm3.userDetailsList.fname?? "";
                      print('ssss ${vm3.userDetailsList.fname}');
                      cartVM.mobileNumberController.text = vm3.userDetailsList.phoneMobile?? "";
                      cartVM.emailController.text = vm3.userDetailsList.email?? "";
                      cartVM.nidController.text = vm3.userDetailsList.nationalId?? "";
                      cartVM.passportController.text = vm3.userDetailsList.passportNo?? "";
                      cartVM.addressController.text = vm3.userDetailsList.address?? "";
                      cartVM.dayController.text = vm3.userDetailsList.ageDd.toString()?? "";
                      cartVM.monthController.text = vm3.userDetailsList.ageMm.toString()?? "";
                      cartVM.yearController.text = vm3.userDetailsList.ageYy.toString() ?? "";
                      // // cartVM.choseBlood = vm3.patDetails.bloodGroup?? "";
                      // // cartVM.choseMaritalStatus =  vm3.patDetails.maritalStatus ?? "" ;
                      cartVM.selectedDob = DateTime.parse(vm3.userDetailsList.dob) ?? DateTime.now();
                      print('qqqqq ${DateTime.parse(vm3.userDetailsList.dob) }');
                    }else{
                      cartVM.memberList = false;
                      var familyVm =
                      Provider.of<FamilyMembersListViewModel>(context, listen: false);
                      familyVm.memberDetail(
                          -1, false, "", "", "", "", "", "", "", "", "");
                      cartVM.selectedMemberType=null;
                      cartVM.fathersName.text = "";
                      cartVM.mothersName.text ="";
                      cartVM.lastNameController.text ="";
                      cartVM.firstNameController.text ="";
                      cartVM.mobileNumberController.text = "";
                      cartVM.emailController.text = "";
                      cartVM.nidController.text = "";
                      cartVM.passportController.text = "";
                      cartVM.addressController.text ="";
                      cartVM.dayController.text = "";
                      cartVM.monthController.text = "";
                      cartVM.yearController.text ="";
                      // cartVM.choseBlood = vm3.patDetails.bloodGroup?? "";
                      // cartVM.choseMaritalStatus =  vm3.patDetails.maritalStatus ?? "" ;
                      cartVM.selectedDob =
                              DateTime.now();
                      //familyVm.memberDetail(selectedCard, isSelected, familyMemName, familyMemEmail, familyMemMobile, familyMemAddress, familyMemGender, familyMemDob, familyMemRegNo, image, relation);
                      print('ppppp ${cartVM.fathersName.text}');
                    }

                   // familyVm.memberDetail(selectedCard, isSelected, familyMemName, familyMemEmail, familyMemMobile, familyMemAddress, familyMemGender, familyMemDob, familyMemRegNo, image, relation);
                    print('ppppp ${ cartVM.fathersName.text}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OrderConfirmationAfterSignIn()));
                    // if (Provider.of<AccessTokenProvider>(context, listen: false)
                    //         .accessToken ==
                    //     null) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               OrderConfirmationAfterSignIn()));
                    // } else {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => OrderConfirmation()));
                    // }
                  },
                  child: Material(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: HexColor("#354291"),
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width > 600
                      //     ? 335
                      //     : 300,
                      height: MediaQuery.of(context).size.width > 600 ? 35 : 45,
                      child: Center(
                        child: Text(
                          "Confirm Booking",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
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
    );
  }
}
