import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/doctor_profile_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class WorkListFiler extends StatefulWidget {
  const WorkListFiler({Key key}) : super(key: key);

  @override
  _WorkListFilerState createState() => _WorkListFilerState();
}

class _WorkListFilerState extends State<WorkListFiler> {
  List filterItems = [];
  @override
  void initState() {
    // TODO: implement initState
    var doctorVm = Provider.of<DoctorProfileViewModel>(context, listen: false);
    //filterItems= doctorVm.filteredList;
    print(filterItems.length);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var doctorVm = Provider.of<DoctorProfileViewModel>(context, listen: true);
    var spaceBetween =  SizedBox(
      height: 10,
    );
    var title = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Row(
          children: [
            Icon(
              Icons.tune_outlined,
              color: AppTheme.buttonActiveColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Filter',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.clear)),
        )
      ],
    );

    var divider = Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade200,
    );
    var filterHeading = Padding(
      padding: EdgeInsets.only(right: 15, left: 15, top: 20),
      child: Row(children: [
        Text(
          'Applied Filters',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
    var appliedFilters = Container(
      height: 50,
      child: Padding(
        padding: EdgeInsets.only(right: 15, left: 15, top: 0),
        child: ListView.builder(
            itemCount: filterItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              return Row(
                children: [
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: HexColor('#EFF5FF'),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             filterItems[index],
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.buttonActiveColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: GestureDetector(
                                 onTap: (){
                                   setState(() {
                                     filterItems.removeAt(index);
                                   });
                                 },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  )
                ],
              );
            }),
      ),
    );
    var availableFilter = Padding(
        padding: EdgeInsets.only(right: 15, left: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Filters',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterItems.contains('Fresh Visit')
                          ? Container(
                          decoration: BoxDecoration(
                              color: AppTheme.buttonActiveColor,
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )) : Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppTheme.buttonActiveColor),
                                  borderRadius: BorderRadius.circular(50)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    filterItems.add('Fresh Visit');
                                    print(filterItems.length);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: AppTheme.buttonActiveColor,
                                ),
                              )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Fresh Visit',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterItems.contains('Follow Up')
                          ? Container(
                          decoration: BoxDecoration(
                              color: AppTheme.buttonActiveColor,
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )) : Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: GestureDetector(
                           onTap: (){
                             setState(() {
                               setState(() {
                                 filterItems.add('Follow Up');
                                 print(filterItems.length);
                               });
                             });
                           },
                            child: Icon(
                              Icons.add,
                              color: AppTheme.buttonActiveColor,
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Follow up',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterItems.contains('Report Check')
                          ? Container(
                          decoration: BoxDecoration(
                              color: AppTheme.buttonActiveColor,
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )) : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                filterItems.add('Report Check');
                                print(filterItems.length);
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: AppTheme.buttonActiveColor,
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Report Check',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  filterItems.contains('2nd Follow Up')
                      ? Container(
                      decoration: BoxDecoration(
                          color: AppTheme.buttonActiveColor,
                          border: Border.all(
                              color: AppTheme.buttonActiveColor),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )) : Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppTheme.buttonActiveColor),
                          borderRadius: BorderRadius.circular(50)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            filterItems.add('2nd Follow Up');
                            print(filterItems.length);
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: AppTheme.buttonActiveColor,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '2nd Follow Up',
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            divider
          ],
        ));
    var shift = Padding(
        padding: EdgeInsets.only(right: 15, left: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shift',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterItems.contains('Morning')
                          ? Container(
                          decoration: BoxDecoration(
                              color: AppTheme.buttonActiveColor,
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )) : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                filterItems.add('Morning');
                                print(filterItems.length);
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: AppTheme.buttonActiveColor,
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Morning',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterItems.contains('Night')
                          ? Container(
                          decoration: BoxDecoration(
                              color: AppTheme.buttonActiveColor,
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )) : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppTheme.buttonActiveColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                filterItems.add('Night');
                                print(filterItems.length);
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: AppTheme.buttonActiveColor,
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Night',
                        style: GoogleFonts.poppins(color: Colors.black,fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            title,
            spaceBetween,
            divider,
            filterHeading,
            spaceBetween,
            appliedFilters,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: divider,
            ),
            availableFilter,
            shift,
          ],
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                  onPressed: () {
                    //doctorVm.filterInfo(filteredList: filterItems);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minWidth: MediaQuery.of(context).size.width,
                  color: AppTheme.buttonActiveColor,
                  child: Text(
                    'Apply Filter',
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class FilterItems {
  String title;

  FilterItems({this.title});
}
