import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/relationship_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

class EditMemberListPrompt extends StatefulWidget {
  @override
  _EditMemberListPromptState createState() => _EditMemberListPromptState();
}

class _EditMemberListPromptState extends State<EditMemberListPrompt> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();
  final _address = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  DateTime pickBirthDate;
  String _selectedRelation;

  Future<Null> selectBirthDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.appbarPrimary,
            accentColor: AppTheme.appbarPrimary,
            colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 6)),
    );

    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
      });
    }
  }

  void initState() {
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<RelationShipViewModel>(context, listen: false);
      await vm.getRelationShip();
    });
    // TODO: implement initState
    super.initState();
  }

  String _selectedGender;
  String color = "#EAEBED";

  @override
  Widget build(BuildContext context) {
    var familyVm =
        Provider.of<FamilyMembersListViewModel>(context, listen: true);
    var imageVm = Provider.of<UserImageViewModel>(context, listen: true);
    var relationVm = Provider.of<RelationShipViewModel>(context, listen: true);
    var width = MediaQuery.of(context).size.width * 0.44;
    var name = SignUpFormField(
      labelText: "Name",
      isRequired: true,
      controller: _username,
      margin: EdgeInsets.only(top: 2),
      contentPadding: EdgeInsets.all(15),
      hintText: 'Name',
    );
    var email = SignUpFormField(
      labelText: "Email",
      isRequired: true,
      controller: _email,
      margin: EdgeInsets.only(top: 2),
      contentPadding: EdgeInsets.all(15),
      hintText: 'Email',
    );
    var mobile = SignUpFormField(
      labelText: "Mobile",
      isRequired: true,
      controller: _mobile,
      margin: EdgeInsets.only(top: 2),
      contentPadding: EdgeInsets.all(15),
      hintText: 'Mobile',
    );
    var address = SignUpFormField(
      labelText: "Address",
      isRequired: true,
      controller: _mobile,
      margin: EdgeInsets.only(top: 2),
      contentPadding: EdgeInsets.all(15),
      hintText: 'Address',
    );
    var relation = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.relation,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: 162,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 145,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  'Relation',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                                items:
                                    StringResources.relationList.map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      gender,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120.0, top: 5),
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
    var bloodGroup = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.bloodGroup,
                            style: GoogleFonts.roboto(fontSize: 12)),
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: 162,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 145,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  'Blood Group',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                                items: StringResources.bloodGroupList
                                    .map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      gender,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120.0, top: 5),
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

    var gender = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.gender,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: 163,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 145,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  StringResources.gender,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                                items: StringResources.genderList.map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      gender,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120.0, top: 5),
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
    //String formatBirthDate = DateFormat("dd/MM/yyyy").format(pickBirthDate);
    var dateOfBirth = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width * .2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.dateOfBirth,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: 161,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        pickBirthDate == DateTime.now()
                            ? "Date of birth"
                            : "22/02/2021",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 18,
                          child:
                              Image.asset("assets/images/calender_icon.png")),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            selectBirthDate(context);
          },
        ),
      ],
    );
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
    // return Center(
    //     child: SingleChildScrollView(
    //       child: Center(
    //         child: Container(
    //           padding:  EdgeInsets.symmetric(horizontal: 16,),
    //           constraints: BoxConstraints(maxWidth: 400, maxHeight: width*3.7),
    //           child: Material(
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.only(top: 30.0),
    //               child: Column(
    //                 // crossAxisAlignment: CrossAxisAlignment.start,
    //                 // mainAxisSize: MainAxisSize.min,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 25.0,right: 25, bottom: 15),
    //                       child: Row(
    //                         children: <Widget>[
    //                           Container(
    //                             // padding: new EdgeInsets.all(10.0),
    //                             decoration: new BoxDecoration(
    //                             ),
    //                             child: new Text(
    //                               'Edit Member Info',
    //                               style: GoogleFonts.poppins(
    //                                   color: AppTheme.appbarPrimary,
    //                                   fontSize: 15.0,
    //                                   fontWeight: FontWeight.w500
    //                               ),
    //                               textAlign: TextAlign.center,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 15.0, right: 15),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           name,
    //                           email,
    //                           mobile,
    //                           address,
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               relation,bloodGroup
    //                             ],
    //                           ),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               gender, dateOfBirth,
    //
    //                             ],),
    //                           Padding(
    //                             padding: const EdgeInsets.only(left: 2.0, top: 28),
    //                             child: Row(
    //                               mainAxisAlignment:
    //                               MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 SizedBox(
    //                                   width: width * .9,
    //                                   height: width * .25,
    //                                   child: FlatButton(
    //                                     onPressed: () {
    //                                       Navigator.pop(context);
    //                                     },
    //                                     textColor:  AppTheme.appbarPrimary,
    //                                     color: HexColor("#FFFFFF"),
    //                                     shape: RoundedRectangleBorder(
    //                                         borderRadius:
    //                                         BorderRadius.circular(8),
    //                                         side: BorderSide(
    //                                             color: AppTheme
    //                                                 .appbarPrimary,
    //                                             width: 1)),
    //                                     child: Text(
    //                                       StringResources.cancelText,
    //                                       style: GoogleFonts.poppins(),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   width: width * .9,
    //                                   height: width * .25,
    //                                   child: FlatButton(
    //                                     textColor: Colors.white,
    //                                     onPressed: () {},
    //                                     color:  AppTheme.appbarPrimary,
    //                                     shape: RoundedRectangleBorder(
    //                                       borderRadius:
    //                                       BorderRadius.circular(8),
    //                                     ),
    //                                     child: Text(
    //                                       "Submit",
    //                                       style: GoogleFonts.poppins(),
    //                                     ),
    //                                   ),
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ] ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ));
  }
}
