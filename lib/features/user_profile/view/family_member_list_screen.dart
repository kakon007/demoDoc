import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/view/widgets/search_family_member.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/registered_member_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/add_family_member_prompt.dart';
import 'package:myhealthbd_app/main_app/views/widgets/edit_member_list_prompt.dart';
import 'package:provider/provider.dart';

class FamilyMemberListScreen extends StatefulWidget {
  @override
  _FamilyMemberListScreenState createState() => _FamilyMemberListScreenState();
}

class _FamilyMemberListScreenState extends State<FamilyMemberListScreen> {
  List<Item> familyMembers=[];
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      var userVm = Provider.of<UserDetailsViewModel>(context,listen: false);
      await userVm.getData();
      var familyVm = Provider.of<FamilyMembersListViewModel>(context,listen: false);
       familyVm.familyMembers(userVm.userDetailsList.hospitalNumber);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var familyVm = Provider.of<FamilyMembersListViewModel>(context,listen: true);
    var vm = Provider.of<UserDetailsViewModel>(context,listen: true);
    var spaceBetween = SizedBox(
      height: 10,
    );
    var width =MediaQuery.of(context).size.width;
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right:10.0),
        //     child: Row(
        //       children: [
        //         GestureDetector(
        //           onTap: (){},
        //           child: Container(
        //               width: 18,
        //               height: 18,
        //               child:Image.asset('assets/icons/slt.png')),
        //         ),
        //         SizedBox(width: 10,),
        //         Icon(Icons.notifications)
        //       ],
        //     ),
        //   )
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Family members",
            //   style: GoogleFonts.poppins(
            //       fontSize: 15,
            //       color: HexColor("#354291"),
            //       fontWeight: FontWeight.w500),
            // ),
            // spaceBetween,
            GestureDetector(
              onTap: (){
                //_showAlert(context);
              },
              child: GestureDetector(
                onTap: (){
                  familyVm.userRegId(vm.userDetailsList.hospitalNumber);
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                   return SearchFamilyMember();
                 }));
                },
                child: DashedContainer(
                  dashColor: AppTheme.appbarPrimary,
                  borderRadius: 5.0,
                  dashedLength: 15.0,
                  blankLength: 5.0,
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_sharp,
                          color: AppTheme.appbarPrimary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Add Family Members",
                            style: GoogleFonts.roboto(color: HexColor("#354291"),fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            spaceBetween,
            spaceBetween,
            // Expanded(child: ListView.builder(
            //     itemCount: familyVm.familyMembersList.length,
            //     itemBuilder: (BuildContext, index){
            //   return Text(familyVm.familyMembersList[index].fmName);
            // }),)
            familyVm.isLoading==true? Center(child: CircularProgressIndicator(valueColor:
            AlwaysStoppedAnimation<Color>(
                AppTheme.appbarPrimary),)) : Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: familyVm.familyMembersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var photo = familyVm.familyMembersList[index]?.photo ?? "";
                      print("photo $photo");
                      return Container(
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? HexColor("#F0F2FF")
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(bottom: 2),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  photo != ""
                                      ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppTheme.appbarPrimary),
                                        //color: AppTheme.appbarPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      height: 50,
                                      width: width<=330 ? 40 : 50,
                                      child: Center(
                                          child: imageVm.loadProfileImage(photo, width<=330 ? 35 : 45, width<=330 ? 35 : 45,50)
                                      ))
                                      : Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.appbarPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      height: width<=330 ? 40 : 50,
                                      width:width<=330 ? 40 :  50,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/dPro.png',
                                          height:width<=330 ? 35 :  40,
                                          width: width<=330 ? 35 : 40,
                                        ),
                                      )),
                                  SizedBox(
                                    width: width<=330 ? 10 : 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width<=330 ? 145 : 160,
                                        child: Text(
                                          familyVm.familyMembersList[index].fmName,
                                          style: GoogleFonts.poppins(
                                              color: HexColor("#0D1231"),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                       Text(
                                         familyVm.familyMembersList[index].relationName,
                                        style: GoogleFonts.poppins(
                                          color: AppTheme.appbarPrimary,),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                   GestureDetector(
                                     onTap:(){
                                       _showAlertDialogForEditMemberList(context);
                                       familyVm.getSelectedUserImage(relationId: familyVm.familyMembersList[index].relation.toString(),regId: familyVm.familyMembersList[index].regId,id: familyVm.familyMembersList[index].id.toString(),name: familyVm.familyMembersList[index].fmName,image: familyVm.familyMembersList[index].photo,userId: familyVm.familyMembersList[index].fmRegId,relationName: familyVm.familyMembersList[index].relationName, memberRegId: familyVm.familyMembersList[index].fmRegId);
                                     },
                                     child: Container(
                                        height: 16,
                                        child: Icon(Icons.edit, color: AppTheme.appbarPrimary,size: 18,)),
                                   ),
                                  SizedBox(
                                    width: width<=330 ? 12 : 16,
                                  ),
                                 GestureDetector(
                                    child: Icon(Icons.delete_sweep,
                                        color: AppTheme.appbarPrimary),
                                    onTap: () {
                                      familyVm.getSelectedUserImage(relationId: familyVm.familyMembersList[index].relation.toString(),regId: familyVm.familyMembersList[index].regId,id: familyVm.familyMembersList[index].id.toString(),name: familyVm.familyMembersList[index].fmName,image: familyVm.familyMembersList[index].photo,userId: familyVm.familyMembersList[index].fmRegId,relationName: familyVm.familyMembersList[index].relationName);
                                      showGeneralDialog(
                                        barrierLabel: "Label",
                                        barrierDismissible: true,
                                        barrierColor:
                                        Colors.black.withOpacity(0.5),
                                        transitionDuration:
                                        Duration(milliseconds: 700),
                                        context: context,
                                        pageBuilder:
                                            (context, anim1, anim2) {
                                          return Material(
                                            type: MaterialType
                                                .transparency,
                                            child: Align(
                                              alignment:
                                              Alignment.center,
                                              child: Material(
                                                type: MaterialType
                                                    .transparency,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                     height: 300,
                                                      child: Center(
                                                        child: Container(
                                                          height: 200,
                                                          margin:
                                                          EdgeInsets.only(
                                                              left: 15,
                                                              right: 15),
                                                          decoration:
                                                          BoxDecoration(
                                                            gradient:
                                                            LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                HexColor(
                                                                    '#fdf0f2'),
                                                                HexColor(
                                                                    '#FFFFFF')
                                                              ],
                                                              tileMode: TileMode
                                                                  .repeated,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                20),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 60.0),
                                                            child: Column(
                                                              children: [
                                                                Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Padding(
                                                                      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.08, right: MediaQuery.of(context).size.width*0.08),
                                                                      child: RichText(
                                                                        textAlign: TextAlign.center,
                                                                        text:  TextSpan(
                                                                          style:  GoogleFonts.poppins(
                                                                            fontSize: 14.0,
                                                                            color: Colors.black,
                                                                          ),
                                                                          children: <TextSpan>[
                                                                            TextSpan(text: 'Remove '),
                                                                            TextSpan(text: familyVm.familyMembersList[index].fmName, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                                                            TextSpan(text: " from your family member list?", style: GoogleFonts.poppins()),
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
                                                                  height: width<=330 ? 10 : 20,
                                                                ),
                                                                Padding(
                                                                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.08, right: MediaQuery.of(context).size.width*0.08),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(left: 0.0, right: 0),
                                                                        child: Container(
                                                                          width: MediaQuery.of(context).size.width/3,
                                                                          decoration: BoxDecoration(),
                                                                          height: 45,
                                                                          child: FlatButton(
                                                                              onPressed: (){
                                                                                Navigator.pop(context);
                                                                              },
                                                                              shape: RoundedRectangleBorder(
                                                                                  side: BorderSide(
                                                                                      color: AppTheme.appbarPrimary
                                                                                      ,width: 1),
                                                                                  borderRadius: BorderRadius.circular(10)),
                                                                              textColor: AppTheme.appbarPrimary ,
                                                                              color: Colors.white ,child: Text("Cancel",  style: GoogleFonts.poppins())),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(left: 0.0, right: 0),
                                                                        child: Container(
                                                                          width: MediaQuery.of(context).size.width/3,
                                                                          height: 45,
                                                                          child: FlatButton(
                                                                              onPressed: (){
                                                                                Future.delayed(Duration.zero, () async {
                                                                                  await familyVm.deleteMember();
                                                                                  if(familyVm.deleteMessage=="Delete Successfully"){
                                                                                    Fluttertoast.showToast(
                                                                                        msg: familyVm.deleteMessage,
                                                                                        toastLength: Toast.LENGTH_SHORT,
                                                                                        gravity: ToastGravity.BOTTOM,
                                                                                        backgroundColor: Colors.green,
                                                                                        textColor: Colors.white,
                                                                                        fontSize: 12.0);
                                                                                    Navigator.pop(context);
                                                                                  }
                                                                                });


                                                                              },
                                                                              shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(10)),
                                                                              textColor: Colors.white,
                                                                              color: AppTheme.appbarPrimary ,child: Text("Remove",  style: GoogleFonts.poppins())),
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
                                                      bottom: 180,
                                                      left: 100,
                                                      right: 100,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        radius: Constants
                                                            .avatarRadius,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    Constants
                                                                        .avatarRadius)),
                                                            child: Image.asset(
                                                                "assets/images/warning.png",height: 90,width: 90,)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        transitionBuilder: (context,
                                            anim1, anim2, child) {
                                          return SlideTransition(
                                            position: Tween(
                                                begin: Offset(0, 2),
                                                end: Offset(0, 0))
                                                .animate(anim1),
                                            child: child,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: width<=330 ? 15 : 25,
                                  ),
                                ],
                              ),
                            ],
                          ));
                    }),
              ),
            ),
            spaceBetween,
          ],
        ),
      ),
    );
  }

  void _showAlertDialogForEditMemberList(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return EditMemberListPrompt();
        });
  }

  void _showAlertDialogForAddMember(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AddFamilyMemberPrompt();
        });
  }
}