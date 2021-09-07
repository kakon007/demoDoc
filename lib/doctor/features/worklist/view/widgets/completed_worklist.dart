import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/worklists_widget.dart';
import 'package:myhealthbd_app/doctor/features/worklist/models/worklist_model.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view/widgets/worklists_widget.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view_model/worklist_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

import 'filter_worklist.dart';

class CompletedWorkList extends StatefulWidget {
  const CompletedWorkList({Key key}) : super(key: key);

  @override
  _CompletedWorkListState createState() => _CompletedWorkListState();
}

class _CompletedWorkListState extends State<CompletedWorkList> {
  List<Datum> completedWorkList = [];
  @override
  void initState() {
    // TODO: implement initState
    var vm = Provider.of<WorkListViewModel>(context, listen: false);
    //
    // vm.workListData
    //     .forEach((item) {
    //   if (item.consultationOut.toString().contains('1')) {
    //     completedWorkList.add(item);
    //     print('bbb ${completedWorkList.length}');
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<WorkListViewModel>(context, listen: false);
    //print("item ${completedWorkList.length}");
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    bool isTablet = Responsive.isTablet(context);
    var searchField = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width <= 330 ? 220 : 290,
          child: TextField(
              onChanged: (value) {},
              decoration: new InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                hintText: "Search Here",
                hintStyle: GoogleFonts.poppins(
                    fontSize: isTablet
                        ? 16
                        : width < 350
                            ? 12
                            : 14.0,
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#D2D2D2"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: new BorderSide(color: Colors.grey)),
                contentPadding: width < 350
                    ? EdgeInsets.fromLTRB(15.0, 0.0, 40.0, 0.0)
                    : EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  context: context,
                  backgroundColor: HexColor('#FFFFFF'),
                  isScrollControlled: true,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      var index = 0;
                      bool isTrue = false;
                      return FractionallySizedBox(
                        heightFactor: 0.65,
                        child: WorkListFilter(),
                      );
                    });
                  });
            },
            child: SvgPicture.asset(
              "assets/icons/fliter.svg",
              key: Key('filterIconKey'),
              width: 10,
              height: 18,
              fit: BoxFit.fitWidth,
              allowDrawingOutsideViewBox: true,
              matchTextDirection: true,
              color: Colors.grey.withOpacity(0.5),
              //semanticsLabel: 'Acme Logo'
            ),
          ),
        ),
      ],
    );
    return Container(
      child: Column(
        children: [
          spaceBetween,
          spaceBetween,
          // spaceBetween,
          //searchField,
          spaceBetween,
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: vm.completedData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 0, right: 0),
                  child: WorklistAll(
                    id: vm.completedData[index].hospitalId,
                    consultTime: vm.completedData[index].consTime,
                    patientName: vm.completedData[index].patientName,
                    age: vm.completedData[index].age,
                    bloodGroup: vm.completedData[index].bloodGroup,
                    gender: vm.completedData[index].gender,
                    phoneNumber: vm.completedData[index].phoneMobile,
                    serial: vm.completedData[index].slotSl,
                    consultType:
                        vm.completedData[index].consultTypeNo.toString(),
                    regNo: vm.completedData[index].registrationNo,
                    appointmentNumber:vm.completedData[index].appointId ,
                    companyNumber: vm.completedData[index].companyNo,
                    consultationNumber: vm.completedData[index].consultationOut,
                    consultationTypeNo: vm.completedData[index].consultTypeNo,
                    departmentName: vm.completedData[index].departmentName,
                    departmentNumber: vm.completedData[index].departmentNo,
                    isPatientOut: vm.completedData[index].isPatientOut,
                    doctorNo: vm.completedData[index].doctorNo,
                    consultationId: vm.completedData[index].consultationId,
                    consultationOut: vm.completedData[index].consultationOut,
                  ),
                );
              }),
          vm.isFetchingMoreData
              ? SizedBox(
                  height: 60,
                  child: Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppTheme.buttonActiveColor),
                  )))
              : SizedBox(),
          spaceBetween,
          spaceBetween,
        ],
      ),
    );
  }
}
