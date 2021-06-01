import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class FamilyMembers extends StatefulWidget {
  @override
  _FamilyMembersState createState() => _FamilyMembersState();
}

class _FamilyMembersState extends State<FamilyMembers> {
  List<Item> familyMembers = [];
  int selectedCard = -1;
  bool isSelected = false;
  String familyMemName = '';
  String familyMemEmail = '';
  String familyMemMobile = '';
  String familyMemAddress = '';
  String familyMemGender = '';
  String familyMemDob = '';
  String familyMemRegNo = '';
  String image = '';
  String relation = '';
  @override
  void initState() {
    // TODO: implement initState
    var familyVm =
    Provider.of<FamilyMembersListViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      var userVm = Provider.of<UserDetailsViewModel>(context, listen: false);
      await userVm.getData();
      familyVm.familyMembers(userVm.userDetailsList.hospitalNumber);
      selectedCard = familyVm.selectedCard;
      print("slect $selectedCard");
      isSelected = false;
      familyMemName = '';
      familyMemEmail = '';
      familyMemMobile = '';
      familyMemAddress = '';
      familyMemGender = '';
      familyMemDob = '';
      familyMemRegNo = '';
      image = '';
      relation = '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var familyVm =
    Provider.of<FamilyMembersListViewModel>(context, listen: true);
    var vm = Provider.of<UserDetailsViewModel>(context, listen: true);
    var spaceBetween = SizedBox(
      height: 10,
    );
    var imageVm = Provider.of<UserImageViewModel>(context, listen: true);

    print("lenthhhhhhhhhhhhhhhhhhh::::: ${familyVm.familyMembersList.length}");
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.notes),
        backgroundColor: HexColor('#354291'),
        title: Text(
          "Family Members",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            familyVm.isLoading == true
                ? Center(
                child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(AppTheme.appbarPrimary),
                ))
                : Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: familyVm.familyMembersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var photo =
                          familyVm.familyMembersList[index]?.photo ?? "";
                      print("photo $photo");
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = index;
                            isSelected = true;
                            Future.delayed(Duration.zero, () async {
                              var vm3 = Provider.of<UserDetailsViewModel>(
                                  context,
                                  listen: false);
                              var familyVm = Provider.of<FamilyMembersListViewModel>(
                                  context,
                                  listen: false);
                              await vm3.getPatData(familyVm
                                  .familyMembersList[index].fmRegId);
                              familyMemEmail = vm3.patDetails.email;
                              familyMemMobile =
                                  vm3.patDetails.phoneMobile;
                              familyMemGender = vm3.patDetails.gender;
                              // _familyMembers = value;
                              familyMemName = familyVm
                                  .familyMembersList[index].fmName;
                              familyMemAddress = familyVm
                                  .familyMembersList[index].fmAddress;
                              familyMemDob =
                                  familyVm.familyMembersList[index].fmDob;
                              familyMemRegNo = familyVm
                                  .familyMembersList[index].fmRegNo
                                  .toString();
                              image = familyVm
                                  .familyMembersList[index]?.photo ??
                                  "";
                              relation = familyVm
                                  .familyMembersList[index].relationName
                                  .toString();
                              familyVm.memberDetail(selectedCard, isSelected, familyMemName, familyMemEmail, familyMemMobile, familyMemAddress, familyMemGender, familyMemDob, familyMemRegNo, image, relation);
                              Navigator.pop(context);
                            });
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? HexColor("#F0F2FF")
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(bottom: 2),
                            height: 70,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    photo != ""
                                        ? Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppTheme
                                                  .appbarPrimary),
                                          //color: AppTheme.appbarPrimary,
                                          shape: BoxShape.circle,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                            child: imageVm
                                                .loadProfileImage(
                                                photo,
                                                45,
                                                45,
                                                50)))
                                        : Container(
                                        decoration: BoxDecoration(
                                          color:
                                          AppTheme.appbarPrimary,
                                          shape: BoxShape.circle,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/dPro.png',
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 160,
                                          child: Text(
                                            familyVm
                                                .familyMembersList[index]
                                                .fmName,
                                            style: GoogleFonts.poppins(
                                                color:
                                                HexColor("#0D1231"),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          familyVm
                                              .familyMembersList[index]
                                              .relationName,
                                          style: GoogleFonts.poppins(
                                            color: AppTheme.appbarPrimary,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 2,
                                        color: AppTheme.appbarPrimary,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(50),
                                            color: selectedCard == index
                                                ? AppTheme.appbarPrimary
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),
              ),
            ),
            spaceBetween,
          ],
        ),
      ),
    );
  }
}
