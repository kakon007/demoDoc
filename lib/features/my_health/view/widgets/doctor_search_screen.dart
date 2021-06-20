import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/my_health/models/search_doctor_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/search_doctor_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/registered_members_model.dart';
import 'package:myhealthbd_app/features/user_profile/view/family_member_list_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view/widgets/add_family_member.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/registered_member_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class SearchDoctor extends StatefulWidget {
  String selectedName;
   SearchDoctor({this.selectedName});

  @override
  _SearchDoctorState createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  TextEditingController memberSearch = TextEditingController();
  List<Itemm> familyMembers= [];
  int selectedCard = -1;
  bool isSelected = false;

  loadProfileImage(String image, double height, double width, double border) {
    Uint8List _bytesImage = Base64Decoder().convert(image);
    //print(_bytesImage);
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: Image.memory(
        _bytesImage,
        fit: BoxFit.fill,
        width: width,
        height: height,
        gaplessPlayback: true,
      ),
    );
  }
  @override
  void initState() {
    // Future.delayed(Duration.zero, () async {
    //   var userVm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: false);
    //   // TODO: implement initState
    //   userVm.getData();
    // });
    var vm2 = Provider.of<SearchDoctorViewModel>(context, listen: false);
    selectedCard=vm2.selectedCard;
    super.initState();
  }
  Future<void> membersSearch(String query) async {
    print(query);
    var vm2 = Provider.of<SearchDoctorViewModel>(context, listen: false);
    var companyId= int.parse( widget.selectedName);
    var patName= query;
    print('MM:: $companyId');
    await vm2.getData(name: patName,companyNo: companyId);
    if(vm2.message=="Data not found"){
      familyMembers=[];
    }
    else{
      //familyMembers.clear();
      setState(() {
        familyMembers=vm2.searchDocList;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    // var vm = Provider.of<RegisteredMemberViewModel>(context, listen: true);
    // var userVm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: true);
    // var imageVm = Provider.of<UserImageViewModel>(appNavigator.context,listen: true);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm2 = appNavigator.getProviderListener<SearchDoctorViewModel>();
    var deviceWidth=MediaQuery.of(context).size.width;
    var searchField =Theme(
        data: Theme.of(context).copyWith(
          primaryColor: HexColor("#8592E5"),
        ),
        child: Container(
          width: isTablet? deviceWidth*.96 : deviceWidth*.89,
          height: 50,
          child: TextField(
            textCapitalization: TextCapitalization.characters,
              onSubmitted: (value) {
                membersSearch(value);
              },
              controller: memberSearch,
              decoration: new InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  //color: HexColor("#8592E5"),
                ),
                hintText: "Name or Username",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#8592E5"), width: 1.0),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(25),
                  //     bottomLeft: Radius.circular(25)),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#C7C8CF"), width: 1.0),
                  borderRadius: BorderRadius.circular(25),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(25),
                  //     bottomLeft: Radius.circular(25)),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 3.0),
              )),
        ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text(
          "Search",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14, top: 15),
        child: Column(
          children: [
            Row(
              children: [
                searchField,
                // GestureDetector(
                //   onTap: (){
                //     Future.delayed(Duration.zero, () async {
                //       var vm = Provider.of<RegisteredMemberViewModel>(context, listen: false);
                //       var regId= memberSearch.text;
                //       var patName=  memberSearch.text;
                //       await vm.getMembers(regId, patName);
                //       if(vm.message=="Data Empty "){
                //         print("aaaaaaaaaaaaaaa");
                //         familyMembers=[];
                //       }
                //       else{
                //         familyMembers.clear();
                //         familyMembers=vm.members;
                //       }
                //     });
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 2.4),
                //     child: Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //                 topRight: Radius.circular(25),
                //                 bottomRight: Radius.circular(25)),
                //             border: Border.all(color: HexColor("#8592E5")),
                //             color: HexColor("#8592E5")),
                //       width: 60,height: 48,child: Icon(Icons.search,color: HexColor("#FFFFFF"),),),
                //   ),
                // )
              ],
            ),
            SizedBox(height: 10,),
            vm2.isLoading? Center(child: CircularProgressIndicator(valueColor:
            AlwaysStoppedAnimation<Color>(
                AppTheme.appbarPrimary),)) : Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: familyMembers.length,
                    itemBuilder: (BuildContext context, int index) {
                      var photo = familyMembers[index]?.photo ?? "";
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedCard = index;
                            isSelected = true;
                            Future.delayed(Duration.zero, () async {
                              vm2.adDoctorsInfo(doctorName: familyMembers[index].doctorName,hospitalName:familyMembers[index].companyName,doctorNo: familyMembers[index].doctorNo,image: photo,spName: familyMembers[index].specializationName,selectedCard:selectedCard,isSelected: isSelected);

                              Navigator.pop(context);
                            });

                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            height: 70,
                            child:
                            Row(
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
                                        height: isTablet? 55 : deviceWidth<=360 ? 40 : 50,
                                        width: isTablet? 55 :deviceWidth<=360 ? 40 : 50,
                                        child: Center(
                                            child: loadProfileImage(photo, isTablet? 50 :deviceWidth<=360 ? 35 : 45,  isTablet? 50 : deviceWidth<=360 ? 40 : 45,50)
                                        ))
                                        : Container(
                                        decoration: BoxDecoration(
                                          color: AppTheme.appbarPrimary,
                                          shape: BoxShape.circle,
                                        ),
                                        height: isTablet? 55 : deviceWidth<=360 ? 40 :50,
                                        width:  isTablet? 55 :deviceWidth<=360 ? 40 :50,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/dPro.png',
                                            height: isTablet? 35 :deviceWidth<=360 ? 25 : 30,
                                            width:  isTablet? 35 :deviceWidth<=360 ? 25 : 30,
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:isTablet? 300 :deviceWidth<=330? 170:  deviceWidth<=360 ? 200 :220,
                                          child: Text(
                                            familyMembers[index].doctorName,
                                            style: GoogleFonts.poppins(
                                                color: HexColor("#0D1231"),
                                                fontSize: deviceWidth<=360 ? 12 :16,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width:isTablet? 300 : deviceWidth<=330? 170:  deviceWidth<=360 && deviceWidth>330 ? 200 :220,
                                          child: Text(
                                            familyMembers[index].companyName,
                                            style: GoogleFonts.poppins(
                                              fontSize:  deviceWidth<=360 ? 12 : 15,
                                              color: AppTheme.appbarPrimary,),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    height:  isTablet? 25 : 20,
                                    width: isTablet? 25 : 20,
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
                                        height: isTablet? 15 : 10,
                                        width: isTablet? 15 : 10,
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
          ],
        ),
      ),
    );
  }
}
