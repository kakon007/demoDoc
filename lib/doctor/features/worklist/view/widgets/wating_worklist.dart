import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/worklist/models/worklist_model.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view/widgets/worklists_widget.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view_model/worklist_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

import 'filter_worklist.dart';

class WaitingWorkList extends StatefulWidget {
  const WaitingWorkList({Key key}) : super(key: key);

  @override
  _WaitingWorkListState createState() => _WaitingWorkListState();
}

class _WaitingWorkListState extends State<WaitingWorkList> {
  List<Datum> waitingWorkList = [];
  List<Datum> workList = [];
  var length;

  @override
  void initState() {
    // TODO: implement initState
    var vm = Provider.of<WorkListViewModel>(context, listen: false);
    workList = vm.workListData;
    length = vm.workListData;
    // vm.workListData
    //     .forEach((item) {
    //   if (item.consultationOut.toString().contains('0')) {
    //     waitingWorkList.add(item);
    //     print('aaa ${waitingWorkList.length}');
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<WorkListViewModel>(context, listen: true);
    // print("itemsssss ${vm.workListData.length}");
    // if(workList!=vm.workListData){
    //   print('true2');
    //   print(workList.length);
    //   waitingWorkList.clear();
    //   vm.workListData
    //       .forEach((item) {
    //     if (item.consultationOut.toString().contains('0')) {
    //       waitingWorkList.add(item);
    //       print('aaa');
    //     }
    //   });
    // }
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
                  backgroundColor: HexColor('#FFFFFF'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  context: context,
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
          //  spaceBetween,
          // searchField,
          spaceBetween,
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: vm.waitingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 0, right: 0),
                  child: WorklistAll(
                    id:vm.waitingData[index].hospitalId,
                    patientName: vm.waitingData[index].patientName,
                    age: vm.waitingData[index].age,
                    bloodGroup: vm.waitingData[index].bloodGroup,
                    gender: vm.waitingData[index].gender,
                    phoneNumber: vm.waitingData[index].phoneMobile,
                    serial: vm.waitingData[index].slotSl,
                    consultTime: vm.waitingData[index].consTime,
                    consultType: vm.waitingData[index].consultationOut.toString(),
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
