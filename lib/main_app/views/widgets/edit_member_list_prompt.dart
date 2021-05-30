import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/relationship_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class EditMemberListPrompt extends StatefulWidget {
  @override
  _EditMemberListPromptState createState() => _EditMemberListPromptState();
}

class _EditMemberListPromptState extends State<EditMemberListPrompt> {


  void initState() {
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<RelationShipViewModel>(context, listen: false);
      await vm.getRelationShip();
    });
    // TODO: implement initState
    super.initState();
  }
  String _selectedRelation;


  @override
  Widget build(BuildContext context) {
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
                width: MediaQuery.of(context).size.width * .77,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#8592E5")),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .68,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none),
                                iconSize: 0.0,
                                hint: Text(
                                  "Select relation",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                value: _selectedRelation,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedRelation = newValue;
                                  });
                                },
                                items: relationVm.relations.map((gender) {
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .65,
                              top: 12),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: HexColor("#D2D2D2"),
                          ),
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
    var photo = familyVm?.image ?? "";
    return Center(
        child: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 330),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25, bottom: 15),
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: <Widget>[
                          Container(
                            // padding: new EdgeInsets.all(10.0),
                            decoration: new BoxDecoration(),
                            child: new Text(
                              'Edit Family Member Info',
                              style: GoogleFonts.poppins(
                                  color: AppTheme.appbarPrimary,
                                  fontSize: 15.0,
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
                        height: 75,
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
                                    height: 50,
                                    width: 50,
                                    child: Center(
                                        child: imageVm.loadProfileImage(
                                            familyVm.image, 45, 45, 50)))
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.appbarPrimary,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  familyVm.name,
                                  style: GoogleFonts.poppins(
                                      color: HexColor("#0D1231"),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  familyVm.userId,
                                  style: GoogleFonts.poppins(
                                      color: AppTheme.appbarPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  familyVm.relationName,
                                  style: GoogleFonts.poppins(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, right: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(),
                              height: 45,
                              child: FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppTheme.appbarPrimary,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  textColor: AppTheme.appbarPrimary,
                                  color: Colors.white,
                                  child: Text("Cancel",
                                      style: GoogleFonts.poppins())),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, right: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 45,
                              child: FlatButton(
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
                                  color: AppTheme.appbarPrimary,
                                  child: Text("Update",
                                      style: GoogleFonts.poppins())),
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
