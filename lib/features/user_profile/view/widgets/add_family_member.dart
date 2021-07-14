import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/registered_member_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/relationship_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class AddFamilyMember extends StatefulWidget {
  String photo;
  AddFamilyMember({this.photo});
  @override
  _AddFamilyMemberState createState() => _AddFamilyMemberState();
}

class _AddFamilyMemberState extends State<AddFamilyMember> {
  String _selectedRelation;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<RelationShipViewModel>(context, listen: false);
      await vm.getRelationShip();
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm = Provider.of<RelationShipViewModel>(context, listen: true);
    var regMemberVm = Provider.of<RegisteredMemberViewModel>(context, listen: true);
    var familyVm = Provider.of<FamilyMembersListViewModel>(context, listen: true);
    var imageVm = Provider.of<UserImageViewModel>(appNavigator.context,listen: true);
    var width = MediaQuery.of(context).size.width;
    var relationshipList = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 50.0,
                width: isTablet? width*.91 : width*.845,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color:  _selectedRelation != null  ?  HexColor("#8592E5") : HexColor("#D2D2D2")),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: isTablet? width*.87 : width*.75,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            key: Key('selectRelationKey'),
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            ),
                            icon: Icon(Icons.keyboard_arrow_down_sharp,color: _selectedRelation != null  ?  HexColor("#8592E5") : HexColor("#D2D2D2"),),
                            iconSize:25,
                            hint: Text(
                              "Select here",
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet? 18 :12, color: HexColor("#D2D2D2")),
                            ),
                            value: _selectedRelation,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedRelation = newValue;
                              });
                            },
                            items: vm.relations.map((gender) {
                              return DropdownMenuItem(
                                child: new Text(
                                  gender.name,
                                  style: GoogleFonts.roboto(fontSize: 14),
                                ),
                                value: gender.id.toString(),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text(
          "Select Relationship",
          key: Key('selectRelationShipAppbarKey'),
          style: GoogleFonts.poppins(fontSize: isTablet? 18  : 15),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: isTablet? 25 : 15.0, right: isTablet? 25  :15, top: 15),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: HexColor("#F0F2FF"),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(top: 5, bottom: 5),
                constraints: BoxConstraints(minHeight: isTablet? 85 :  70,),
                //height: isTablet? 85 :  70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        regMemberVm.image != ""
                            ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.appbarPrimary),
                              //color: AppTheme.appbarPrimary,
                              shape: BoxShape.circle,
                            ),
                            height: isTablet? 55 : 50,
                            width: isTablet? 55 :50,
                            child: Center(
                                child: imageVm.loadProfileImage(regMemberVm.image, isTablet? 50 :45, isTablet? 50 :45,50)
                            ))
                            : Container(
                            decoration: BoxDecoration(
                              color: AppTheme.appbarPrimary,
                              shape: BoxShape.circle,
                            ),
                            height: isTablet? 55 :50,
                            width: isTablet? 55 :50,
                            child: Center(
                              child: Image.asset(
                                'assets/images/dPro.png',
                                height:isTablet? 32 : 27,
                                width: isTablet? 32 :  27,
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              regMemberVm.name,
                              style: GoogleFonts.poppins(
                                  color: HexColor("#0D1231"),
                                  fontSize: isTablet? 18 :width<=360 ? 13:16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*.7),
                              child: Text(
                                "Username: ${regMemberVm.relatedRegId}",
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet? 18 : width<=360 ? 13 : 16,
                                  color: AppTheme.appbarPrimary,),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 10,),
            Container(
              height: 300,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#0D1231").withOpacity(0.08),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left:10.0, right: 9, top: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Select your relationship status:", style: GoogleFonts.poppins(color: HexColor("#333132"), fontSize: isTablet? 19 : 16),),
                      ),
                      SizedBox(height: 10,),
                      relationshipList,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14),
                    child: Container(
                      width: width,
                      height: isTablet? 50 :  45,
                      child: AbsorbPointer(
                        absorbing: _selectedRelation!=null? false : true,
                        child: FlatButton(
                            onPressed: (){
                              Future.delayed(Duration.zero, () async {
                                await familyVm.addFamilyMember(regMemberVm.regId, regMemberVm.regNo, _selectedRelation, regMemberVm.relatedRegNo);

                                  if(familyVm.saveMessage=="Saved Successfully"){
                                    Fluttertoast.showToast(
                                        msg: "Saved Successfully",
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
                            color: _selectedRelation!= null ? AppTheme.appbarPrimary : HexColor("#969EC8") ,child: Text("Add as Family Member",key: Key('addAsFamilyMemberButtonKey'),  style: GoogleFonts.poppins(fontSize: isTablet? 18 : 15 ))),
                      ),
                    ),
                  )
                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
