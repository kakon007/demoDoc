import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/add_patient/view/widgets/delete_user_prompt.dart';
import 'package:myhealthbd_app/admin/add_patient/view/widgets/user_list_card.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class PatientPortalUserList extends StatefulWidget {
  @override
  _PatientPortalUserListState createState() => _PatientPortalUserListState();
}

class _PatientPortalUserListState extends State<PatientPortalUserList> {
  @override
  Widget build(BuildContext context) {
    var searchField = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
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
                hintText: "Search User",
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
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Portal User List',
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Column(
        children: [searchField,
          //userSection,
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index){
            return UserListCard();
          }),
        )
        ],
      ),
    );
  }
}
