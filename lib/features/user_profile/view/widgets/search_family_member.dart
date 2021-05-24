import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view/family_member_list_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view/widgets/add_family_member.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

import '../../../constant.dart';

class SearchFamilyMember extends StatefulWidget {
  const SearchFamilyMember({Key key}) : super(key: key);

  @override
  _SearchFamilyMemberState createState() => _SearchFamilyMemberState();
}

class _SearchFamilyMemberState extends State<SearchFamilyMember> {
  TextEditingController memberSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<MemberList> members = [
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
      MemberList(
          name: "John Doe",
          imageUrl: "assets/images/familypic.png",
          isLoggedIn: true,
          relation: "Username: Brother"),
    ];
    var searchField = Theme(
        data: Theme.of(context).copyWith(
          primaryColor: HexColor("#8592E5"),
        ),
        child: TextField(
            onChanged: (value) {},
            controller: memberSearch,
            decoration: new InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                //color: HexColor("#8592E5"),
              ),
              hintText: "Search",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#8592E5"), width: 1.0),
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#C7C8CF"), width: 1.0),
                borderRadius: BorderRadius.circular(25),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 0.0),
            )));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text(
          "Search",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
        child: Column(
          children: [
            searchField,
            SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: members.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                                      backgroundImage:
                                          AssetImage(members[index].imageUrl),
                                      radius: 28.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        members[index].name,
                                        style: GoogleFonts.poppins(
                                            color: HexColor("#0D1231"),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        members[index].relation,
                                        style: GoogleFonts.poppins(
                                            color: HexColor("#B8C2F8")),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AddFamilyMember();
                                  }));
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_add,
                                        color: HexColor("#4077BC"),
                                      ),
                                      Text(
                                        "Add Member",
                                        style: GoogleFonts.poppins(
                                            color: HexColor("#4077BC"),
                                            fontSize: 11),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: HexColor("#D2D9FF"),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 90,
                                  height: 70,
                                ),
                              ),
                            ],
                          ));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
