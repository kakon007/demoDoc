import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/relationship_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:provider/provider.dart';

class AddFamilyMember extends StatefulWidget {
  const AddFamilyMember({Key key}) : super(key: key);

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
    var vm = Provider.of<RelationShipViewModel>(context, listen: true);
    var relationshipList = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width*.85,
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
                            width: MediaQuery.of(context).size.width*.75,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none),
                                iconSize: 0.0,
                                hint: Text(
                                  "Select here",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.75, top: 12),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text(
          "Select Relationship",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: HexColor("#F0F2FF"),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(top: 5, bottom: 5),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/familypic.png",
                            ),
                            radius: 28.0,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.poppins(
                                  color: HexColor("#0D1231"),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Username: MH2201201438",
                              style: GoogleFonts.poppins(
                                  color: HexColor("#B8C2F8")),
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
              width: MediaQuery.of(context).size.width,
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
                padding: const EdgeInsets.only(left:10.0, right: 15, top: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Select your relationship status:", style: GoogleFonts.poppins(color: HexColor("#333132"), fontSize: 16),),
                      ),
                      SizedBox(height: 10,),
                      relationshipList,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: FlatButton(
                          onPressed: (){},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          textColor: Colors.white,
                          color: AppTheme.appbarPrimary ,child: Text("Add as Family Member",  style: GoogleFonts.poppins())),
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
