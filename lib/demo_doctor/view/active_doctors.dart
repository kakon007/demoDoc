import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myhealthbd_app/demo_doctor/view/doctor_profile_screen.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ActiveDoctorsScreen extends StatefulWidget {


  @override
  _ActiveDoctorsScreenState createState() => _ActiveDoctorsScreenState();
}

class _ActiveDoctorsScreenState extends State<ActiveDoctorsScreen> with AfterLayoutMixin{
  List<Datum> hospitalList;
  bool isSearched = false;
  List<Datum> hospitalItems=[];
  TextEditingController deptController = TextEditingController();
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<DoctorListViewModel>(context, listen: false);
      await vm.getDoctor(2.toString(), 2.toString(), null, null, "");
      hospitalList = vm.doctorList;
      hospitalItems.addAll(hospitalList);
    });
  }
  void hospitalSearch(String query) {
    List<Datum> initialHospitalSearch = List<Datum>();
    hospitalList.forEach((element) {
      initialHospitalSearch.add(element);
    });
    if (query.isNotEmpty) {
      List<Datum> initialHospitalSearchItems = List<Datum>();
      initialHospitalSearch.forEach((item) {
        if (item.doctorName.toLowerCase().contains(query.toLowerCase())) {
          initialHospitalSearchItems.add(item);
        }
      });
      setState(() {
        isSearched = true;
        hospitalItems.clear();
        hospitalItems.addAll(initialHospitalSearchItems);
      });
      return;
    } else {
      setState(() {
        hospitalItems.clear();
        hospitalItems.addAll(hospitalList);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorListViewModel>(context);
    var width = MediaQuery.of(context).size.width;
    print('lenth ${hospitalItems.length}');
    var searchDepartment =
    SignUpFormField(
      //focusNode: widget.f1,
      onChanged: (value) {
        hospitalSearch(value);
      },
      focusBorderColor: "#8592E5",
      controller: deptController,
      borderRadius: 30,
      minimizeBottomPadding: true,
      hintSize:  12,
      hintText: 'Search Doctors',
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.search_rounded,
          //color: Colors.grey,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Doctors", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 10,),
          Text('Doctors',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          searchDepartment,
          SizedBox(width: 25,),
          Expanded(child:
          vm.doctorList==null?Loader():InkWell(
            onTap: (){

              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: DoctorProfile()
                ),
              );
              print('trr');
            },
            child: ListView.separated(
                itemCount: isSearched == false &&
                    hospitalItems.length == 0
                    ? vm.doctorList.length
                    : hospitalItems.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xff7266D8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:220,
                                  child: Text(isSearched == false &&
                                      hospitalItems.length == 0
                                      ? vm.doctorList[index].doctorName
                                      : hospitalItems[index].doctorName,style: TextStyle(color: Colors.white,fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ),
                                Text(isSearched == false &&
                                    hospitalItems.length == 0
                                    ? vm.doctorList[index].specializationName
                                    : hospitalItems[index].specializationName,style: TextStyle(color: Colors.white,fontSize: 13),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 10,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    minRadius: 5,
                                    child: Container(
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(width: 3,),
                                  Text('Active',style: TextStyle(color: Colors.white,fontSize: 13),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ],
                              )
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)
                        ],
                      ),
                    ),
                  );
                },separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );}),
          ))
        ],),
      ),
    );
  }
}
