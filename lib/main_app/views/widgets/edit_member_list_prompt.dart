import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/models/relationship_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/relationship_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class EditMemberListPrompt extends StatefulWidget {
  @override
  _EditMemberListPromptState createState() => _EditMemberListPromptState();
}

class _EditMemberListPromptState extends State<EditMemberListPrompt> {
  String _selectedRelation;
  // List<Item> _relations=[];
  void initState() {
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<RelationShipViewModel>(context, listen: false);
      await vm.getRelationShip();
      // var vm3 = Provider.of<UserDetailsViewModel>(
      //     context,
      //     listen: false);
      // var familyVm = Provider.of<FamilyMembersListViewModel>(
      //     context,
      //     listen: false);
      // await vm3.getPatData(familyVm.memberRegId);
      // if(vm3.patDetails.gender=="M"){
      //   for(int i=0; i<vm.relations.length;i++){
      //     if(vm.relations[i].name.contains("Son")){
      //       print("aaaa");
      //       _relations.add(vm.relations[i]);
      //       print(_relations);
      //     }
      //   }
      // }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    var familyVm =
        Provider.of<FamilyMembersListViewModel>(context, listen: true);
    var imageVm = Provider.of<UserImageViewModel>(context, listen: true);
    var relationVm = Provider.of<RelationShipViewModel>(context, listen: true);
    var relationshipList = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 50.0,
                width: isTablet ?425 : width<=330 ? width*.72 :  width*.75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: _selectedRelation!=null ? HexColor("#8592E5") : HexColor("D2D2D2")),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: isTablet ?400 :  width*.7,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            key: Key('familyRelationUpdateKey'),
                            icon: Icon(Icons.keyboard_arrow_down_sharp,color: _selectedRelation != null  ?  HexColor("#8592E5") : HexColor("#D2D2D2"),),
                            iconSize:25,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            ),
                            hint: Text(
                              "Select relation",
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet? 18 : 15, color: HexColor("#D2D2D2")),
                            ),
                            value: _selectedRelation,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedRelation = newValue;
                              });
                            },
                            items: relationVm.relations.map((relation) {
                              return DropdownMenuItem(
                                child: new Text(
                                  relation.name,
                                  style: GoogleFonts.roboto(fontSize: isTablet? 18 : 15),
                                ),
                                value: relation.id.toString(),
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
    var photo = familyVm?.image ?? "";
    return Center(
        child: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          constraints: BoxConstraints(maxWidth: isTablet? 500 : 400, minHeight: isTablet? 360 : 320),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
                child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: <Widget>[
                          Container(
                            // padding: new EdgeInsets.all(10.0),
                            decoration: new BoxDecoration(),
                            child: new Text(
                              'Edit Family Member Info',
                              key: Key('editMemberInfoKey'),
                              style: GoogleFonts.poppins(
                                  color: AppTheme.appbarPrimary,
                                  fontSize: isTablet? 18 : 15.0,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints: BoxConstraints(minHeight: isTablet? 90 : 75,),
                      //  height: isTablet? 90 : 75,
                        width: isTablet? 425 : width*.79,
                        decoration: BoxDecoration(
                          color: HexColor("#F0F2FF"),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            photo != ""
                                ? Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppTheme.appbarPrimary),
                                      //color: AppTheme.appbarPrimary,
                                      shape: BoxShape.circle,
                                    ),
                                    height: isTablet? 55 : 50,
                                    width: isTablet? 55 : 50,
                                    child: Center(
                                        child: imageVm.loadProfileImage(
                                            familyVm.image, isTablet? 50 : 45, isTablet? 50 : 45, 50)))
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.appbarPrimary,
                                      shape: BoxShape.circle,
                                    ),
                                constraints: BoxConstraints(minHeight: isTablet? 55 : 50,),

                               // height: isTablet? 55 : 50,
                                    width: isTablet? 55 : 50,
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
                                Container(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*.55),

                                  child: Text(
                                    familyVm.name,
                                    style: GoogleFonts.poppins(
                                        color: HexColor("#0D1231"),
                                        fontSize: isTablet? 18 : 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  familyVm.userId,
                                  style: GoogleFonts.poppins(
                                      color: AppTheme.appbarPrimary,
                                      fontSize: isTablet? 18 : 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  familyVm.relationName,
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet? 16 : 14,
                                      color: HexColor("#B8C2F8")),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      relationshipList,
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: isTablet?190 :  width / 3,
                            decoration: BoxDecoration(),
                            height: isTablet? 50 : 45,
                            child: FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                key: Key('familyMemberEditCancelKey'),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: AppTheme.appbarPrimary,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: AppTheme.appbarPrimary,
                                color: Colors.white,
                                child: Text("Cancel",
                                    style: GoogleFonts.poppins(fontSize: isTablet? 18 : 15))),
                          ),
                          Container(
                            width: isTablet?190: width / 3,
                            height: isTablet? 50 : 45,
                            child: AbsorbPointer(
                             absorbing: _selectedRelation!=null ? false : true,
                              child: FlatButton(
                                key: Key('familyMemberEditUpdateKey'),
                                  onPressed: () {
                                    Future.delayed(Duration.zero, () async {
                                      await familyVm.updateMember(_selectedRelation);
                                      if(familyVm.updateMessage=="Update Successfully"){
                                        Fluttertoast.showToast(
                                            msg: familyVm.updateMessage,
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
                                  color: _selectedRelation == null
                                      ? HexColor("#969EC8")
                                      : AppTheme.appbarPrimary,
                                  child: Text("Update",
                                      style: GoogleFonts.poppins(fontSize: isTablet? 18 : 15))),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
