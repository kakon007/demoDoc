
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
import 'package:myhealthbd_app/features/dashboard/repositories/hospital_list_repository.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/my_health/view/doctor_filters.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';

class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen>with AfterLayoutMixin {
  List<Item> dataList = List<Item>();
 // List<HospitalListModel> chartData = [];
 //  List<dynamic> data=[];
  List<HospitalList> hospitals = [
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "60 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
    HospitalList(
        hospitalName: "Aalok HealthCare Ltd",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "70 Doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "80 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
    HospitalList(
        hospitalName: "Aalok HealthCare Ltd",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "90 Doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "60 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "60 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
  ];
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('Chest Medicine', false),
    SimpleModel('Cardiology', false),
    SimpleModel('Child Neurology', false),
    SimpleModel('Chest Medicine', false),
    SimpleModel('Dermatology', false),
    SimpleModel('Diabetics', false),
  ];
  List _items3 = [];
  List _items4 = [];
  final List<SimpleModel> _items2 = <SimpleModel>[
    SimpleModel('Child Specialist', false),
    SimpleModel('Chest Surgeon', false),
    SimpleModel('Diabetologist', false),
    SimpleModel('Endocrinologist', false),
    SimpleModel('ENT', false),
    SimpleModel('Gastroenterologist', false),
  ];
  ScrollController _scrollController;
  ScrollController _scrollController2;

  // @override
  // void initState() {
  //   //fetchHospitalList();
  //   //getNews();
  //   // var vm = Provider.of<HospitalListViewModel>(context, listen: false);
  //   // vm.getData(isFromOnPageLoad: true);
  //   HospitalListRepositry().fetchHospitalList();
  //   super.initState();
  //   _scrollController = ScrollController();
  //   _scrollController2 = ScrollController();
  // }

  @override
  void afterFirstLayout(BuildContext context) {
    HospitalListRepositry().fetchHospitalList();
    var vm = Provider.of<HospitalListViewModel>(context, listen: false);
    vm.getData();
  }
  // Future<HospitalListModel> fetchHospitalList() async {
  //   var url =
  //       "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyList";
  //   var client = http.Client();
  //   var response = await client.get(url);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonMap = json.decode(response.body);
  //     HospitalListModel data = hospitalListModelFromJson(response.body) ;
  //     setState(() {
  //       data.items.forEach((elemant) {
  //         dataList.add(elemant);
  //       });
  //     });
  //     print('Data:: ' + data.items[5].companyName);
  //     return data;
  //   }else {
  //     return null;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<HospitalListViewModel>(context);
    List<Item> list = vm.hospiitalList;
    var lengthh=list.length;
    var searchField = SignUpFormField(
      borderRadius: 30,
      hintText: StringResources.searchBoxHint,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.search_rounded,
          color: Colors.grey,
        ),
      ),
    );
    // var hospital= FutureBuilder<HospitalListModel>(
    //     future:fetchHospitalList(),
    //     builder: (BuildContext context, snapshot){
    //       if(snapshot.hasData){
    //         return SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Column(
    //             children: [
    //               ...List.generate(
    //                 snapshot.data.items.length,
    //                     (i) => HospitalListCard(snapshot.data.items[i].companyName,snapshot.data.items[i].companyAddress==null?"Mirpur,Dahaka,Bangladesh":snapshot.data.items[i].companyAddress,"60 Doctors",snapshot.data.items[i].companyPhone==null?"+880 1962823007":snapshot.data.items[i].companyPhone,snapshot.data.items[i].companyEmail==null?"info@mysoftitd.com":snapshot.data.items[i].companyEmail,snapshot.data.items[i].companyLogo,),
    //               ),
    //             ],
    //           ),
    //         );
    //       }else{
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     });
    var width = MediaQuery.of(context).size.width * 0.44;
    var height = MediaQuery.of(context).size.height;
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );
    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var searchDepartment = TextFormField(
        decoration: new InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          hintText: StringResources.searchDepartment,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#EAEBED"), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: new BorderSide(color: Colors.teal)),
          contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
        ));
    var searchSpeciality = TextFormField(
        decoration: new InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          hintText: StringResources.searchSpeciality,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#EAEBED"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: new BorderSide(color: Colors.teal)),
          contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
        ));
    var modalSheetTitle = Padding(
      padding: EdgeInsets.only(left: width / 6.912, right: width / 6.912),
      child: Column(
        children: [
          horizontalSpace,
          horizontalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpace,
              Text(
                StringResources.filters,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },child: Icon(Icons.clear)),
            ],
          ),
          horizontalSpace,
          horizontalSpace
        ],
      ),
    );


          return Scaffold(
            backgroundColor: Colors.white,
// appBar: AppBar(
//   backgroundColor: AppTheme.appbarPrimary,
//   title: Text(
//     StringResources.hospitalListAppbar,
//     style: GoogleFonts.poppins(fontSize: 15),
//   ),
//   actions: <Widget>[
//     IconButton(
//       icon: Icon(
//         Icons.notifications,
//         color: Colors.white,
//         size: 20,
//       ),
//       onPressed: () {
//
//         showModalBottomSheet(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(25),
//                     topRight: Radius.circular(25))),
//             context: context,
//             isScrollControlled: true,
//             builder: (context) {
//               return StatefulBuilder(
//                   builder: (BuildContext context, StateSetter setState) {
//                     return FractionallySizedBox(
//                       heightFactor: 0.85,
//                       child: Column(
//                         children: [
//                           modalSheetTitle,
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   left: width / 6.912,
//                                   right: width / 6.912),
//                               child: Column(
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       Container(
//                                         height: height/3.55,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(25),
//                                               topRight:
//                                               Radius.circular(25)),
//                                           border: Border.all(
//                                             color: HexColor("#D6DCFF"),
//                                             //                   <--- border color
//                                             width: 1,
//                                           ),
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             searchDepartment,
//                                             Expanded(
//                                               child: Scrollbar(
//                                                 isAlwaysShown: true,
//                                                 controller:
//                                                 _scrollController,
//                                                 child: ListView(
//                                                   controller:
//                                                   _scrollController,
//                                                   children:
//                                                   _items
//                                                       .map(
//                                                         (SimpleModel
//                                                     item) =>
//                                                         Container(
//                                                           height: 35,
//                                                           child:
//                                                           CheckboxListTile(
//                                                             activeColor:
//                                                             AppTheme
//                                                                 .signInSignUpColor,
//                                                             controlAffinity:
//                                                             ListTileControlAffinity
//                                                                 .leading,
//                                                             title: Text(
//                                                               item.title,
//                                                               style: GoogleFonts.poppins(
//                                                                   fontWeight: item.isChecked ==
//                                                                       true
//                                                                       ? FontWeight
//                                                                       .w600
//                                                                       : FontWeight
//                                                                       .normal),
//                                                             ),
//                                                             value: item
//                                                                 .isChecked,
//                                                             onChanged:
//                                                                 (bool val) {
//                                                               setState(() {
//                                                                 val == true
//                                                                     ? _items4.add(item
//                                                                     .title)
//                                                                     : _items4
//                                                                     .remove(item.title);
//                                                                 item.isChecked =
//                                                                     val;
//                                                               });
//                                                             },
//                                                           ),
//                                                         ),
//                                                   ).toList(),
//
//
//                                                 ),
//
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   horizontalSpace,
//                                   horizontalSpace,
//                                   horizontalSpace,
//                                   Container(
//                                     height: height/3.55,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(25),
//                                           topRight:
//                                           Radius.circular(25)),
//                                       border: Border.all(
//                                         color: HexColor("#D6DCFF"),
//                                         //                   <--- border color
//                                         width: 1.0,
//                                       ),
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         searchSpeciality,
//                                         Expanded(
//                                           child: Scrollbar(
//                                             isAlwaysShown: true,
//                                             controller:
//                                             _scrollController2,
//                                             child: ListView(
//                                               controller:
//                                               _scrollController2,
//                                               children: _items2
//                                                   .map(
//                                                     (SimpleModel
//                                                 item) =>
//                                                     Container(
//                                                       height: 35,
//                                                       child:
//                                                       CheckboxListTile(
//                                                         activeColor:
//                                                         AppTheme
//                                                             .signInSignUpColor,
//                                                         controlAffinity:
//                                                         ListTileControlAffinity
//                                                             .leading,
//                                                         title: Text(
//                                                           item.title,
//                                                           style: GoogleFonts.poppins(
//                                                               fontWeight: item.isChecked ==
//                                                                   true
//                                                                   ? FontWeight
//                                                                   .w600
//                                                                   : FontWeight
//                                                                   .normal),
//                                                         ),
//                                                         value: item
//                                                             .isChecked,
//                                                         onChanged:
//                                                             (bool val) {
//                                                           setState(() {
//                                                             val == true
//                                                                 ? _items3.add(item
//                                                                 .title)
//                                                                 : _items3
//                                                                 .remove(item.title);
//                                                             item.isChecked =
//                                                                 val;
//                                                           });
//                                                         },
//                                                       ),
//                                                     ),
//                                               )
//                                                   .toList(),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height:height>=600 ? 40: 25,),
//                                   Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       AbsorbPointer(
//                                         absorbing:
//                                         _items4.isEmpty && _items3.isEmpty
//                                             ? true
//                                             : false,
//                                         child: SizedBox(
//                                           width: width * .9,
//                                           height: width * .25,
//                                           child: FlatButton(
//                                             onPressed: () {},
//                                             textColor: _items4.isEmpty &&
//                                                 _items3.isEmpty
//                                                 ? HexColor("#969EC8")
//                                                 : AppTheme.appbarPrimary,
//                                             color: HexColor("#FFFFFF"),
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(8),
//                                                 side: BorderSide(
//                                                     color: _items4.isEmpty &&
//                                                         _items3.isEmpty
//                                                         ? HexColor("#969EC8")
//                                                         : AppTheme
//                                                         .appbarPrimary,
//                                                     width: 1)),
//                                             child: Text(
//                                               StringResources.clearFilterText,
//                                               style: GoogleFonts.poppins(),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       AbsorbPointer(
//                                         absorbing:
//                                         _items4.isEmpty && _items3.isEmpty
//                                             ? true
//                                             : false,
//                                         child: SizedBox(
//                                           width: width * .9,
//                                           height: width * .25,
//                                           child: FlatButton(
//                                             textColor: Colors.white,
//                                             onPressed: () {},
//                                             color: _items4.isEmpty &&
//                                                 _items3.isEmpty
//                                                 ? HexColor("#969EC8")
//                                                 : AppTheme.appbarPrimary,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(8),
//                                             ),
//                                             child: Text(
//                                               StringResources.applyFilterText,
//                                               style: GoogleFonts.poppins(),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   });
//             });
//       },
//     )
//   ],
// ),
            body: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     searchField,
              //     Expanded(child:ListView.builder(
              //           key: Key("dashboardHorizontalCareerAdviceListKey"),
              //           padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              //           scrollDirection: Axis.vertical,
              //           itemCount: length,
              //           itemBuilder: (context, index) {
              //             var advice = list[index];
              //             return HospitalListCard(advice.companyName,advice.companyAddress==null?"Mirpur,Dahaka,Bangladesh":advice.companyAddress,"60 Doctors",advice.companyPhone==null?"+880 1962823007":advice.companyPhone,advice.companyEmail==null?"info@mysoftitd.com":advice.companyEmail,advice.companyLogo,);
              //           })),
              //   ],
              // ),

              child: RefreshIndicator(
                onRefresh: vm.refresh,
                child: vm.shouldShowPageLoader
                    ? Center(
                  child: Loader(),
                )
                    : ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 4,vertical: 12),
                    controller: _scrollController,
                    itemCount: lengthh,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // if (index == lengthh) {
                      //   return vm.isFetchingMoreData
                      //       ? Padding(padding: EdgeInsets.all(15), child: Loader())
                      //       : SizedBox();
                      // }
                      //List<Item> advice = list[index];
                      print("LIIIISSSYYSY:::"+list[index].companyName);
                      return HospitalListCard(list[index].companyName,list[index].companyAddress==null?"Mirpur,Dahaka,Bangladesh":list[index].companyAddress,"60 Doctors",list[index].companyPhone==null?"+880 1962823007":list[index].companyPhone,list[index].companyEmail==null?"info@mysoftitd.com":list[index].companyEmail,list[index].companyLogo,);
                    }),
              ),
            ),
          );
  }
}

class HospitalList {
  String hospitalName;
  String location;
  String doctorOnline;
  String hospitalLogo;

  HospitalList(
      {this.hospitalLogo, this.hospitalName, this.location, this.doctorOnline});
}
